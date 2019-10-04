//
//  LocationManagement.swift
//  ServiceKit
//

import CoreLocation
import RxSwift

public final class LocationServices: NSObject {
  
  public typealias Point = (latitude: Double, longitude: Double)
  
  public enum LocationStatus {
    
    case denied, disabled, active
  }
  
  public enum AuthStatus {
    
    case denied, notDetermined, authorized, off
  }
  
  public static var shared = LocationServices()
  public var locationManager: CLLocationManager?
  
  /// MARK: - Publish events
  public let updatedEvent = PublishSubject<CLLocation?>()
  public let newLocaltionEvent = PublishSubject<CLLocation>()
  public let statusChangedEvent = PublishSubject<LocationStatus>()
  
  /// MARK: - Public Properties
  public var status: AuthStatus {
    if CLLocationManager.locationServicesEnabled() {
      switch CLLocationManager.authorizationStatus() {
      case .notDetermined: return .notDetermined
      case .authorizedAlways: return .authorized
      default: return .denied
      }
    }
    return .off
  }
  public var isNotDetermined: Bool {
    return CLLocationManager.authorizationStatus() == .notDetermined
  }
  
  public var isAuthorizedAlways: Bool {
    return CLLocationManager.authorizationStatus() == .authorizedAlways
  }
  
  public var currentPoint: Point?
  
  /// MARK: - Private Properties
  private var currentLocation: CLLocation?
  private var gecoder: CLGeocoder!
  private lazy var persistentPath: String = {
    // Get path to documents directory
    return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
  }()
  private var path: String {
    return (persistentPath as NSString).appendingPathComponent("user-current-location")
  }
  private var lastUserUpdate: Date?
  
  public override init() {
    super.init()
    
    locationManager = CLLocationManager()
    locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
    locationManager?.distanceFilter = kCLDistanceFilterNone
    locationManager?.delegate = self
    locationManager?.allowsBackgroundLocationUpdates = true
    
    gecoder = CLGeocoder()
  }
  
  public func getStarted() {
    if !CLLocationManager.locationServicesEnabled() {
      statusChangedEvent.onNext(.disabled)
    } else if status == .denied {
      statusChangedEvent.onNext(.denied)
    } else {
      /// Request for always usage of location
      locationManager?.requestAlwaysAuthorization()
      locationManager?.startUpdatingLocation()
    }
  }
  
  @objc public func stop() {
    locationManager?.stopUpdatingLocation()
  }
  
  public func syncGeo(points: [Point], save: Bool = false, completion: @escaping ([(Int, String)]) -> Void) {
    guard !points.isEmpty else {
      completion([])
      return
    }
    var addresses = [(Int, String)]()
    var points = points
    func loc(_ point: Point) -> CLLocation {
      return CLLocation(latitude: point.latitude, longitude: point.longitude)
    }
    func loadAddress(point: Point, idx: Int) {
      LocationServices.shared.placemark(loc(point)) { (place) in
        if let place = place {
          let address = [place.name, place.locality.wrap,
                         [place.administrativeArea, place.postalCode].compactMap{$0}.joined(separator: " ")]
            .compactMap{$0}.joined(separator: ", ")
          addresses.append((idx, address))
        } else {
          addresses.append((idx, "\(point.latitude),\(point.longitude)"))
        }
        /// Stop and call the result back when reaching the end
        if points.isEmpty {
          completion(addresses)
          return
        }
        /// recursion load address because Geocode doesn't allow multiple actions at the same time
        loadAddress(point: points.removeFirst(), idx: idx+1)
      }
    }
    loadAddress(point: points.removeFirst(), idx: 0)
  }
  
  public func locationFrom(lat: CLLocationDegrees, long: CLLocationDegrees) -> CLLocation {
    return CLLocation(latitude: lat, longitude: long)
  }
  
  public func placemark(_ loc: CLLocation? = nil, completion: ((CLPlacemark?) -> Void)? = nil) {
    let location = loc ?? currentLocation
    if let loc = location {
      gecoder.reverseGeocodeLocation(loc) { (places, _) in
        let place = places?.last
        completion?(place)
      }
    } else {
      completion?(nil)
    }
  }
}

extension LocationServices: CLLocationManagerDelegate {
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print(locations)
    currentLocation = locations.last
    if let loc = currentLocation {
      currentPoint = (loc.coordinate.latitude, loc.coordinate.longitude)
    }
  }
  
  public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    updatedEvent.onNext(nil)
  }
  
  public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    statusChangedEvent.onNext( status == .authorizedAlways ? .active : .disabled)
  }
}

