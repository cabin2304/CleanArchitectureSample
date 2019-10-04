# The Sample Template iOS Application Codebase
## Description:

```
This project aims to be a standard configured code structure to help developers reducing the effort of Infrastructure period.


```

## How to setup

### Environments and tools:
-------

Xcode 11.0 or later

Carthage 0.33.0

Swift 5

Development Target: iOS 12.0+

Development Configured Environments: 
```
  . Development
  . Staging
  . Production
```

Text Editing - Identation:
```
  . Tab width: 2
  . Indent width: 2
  . Line wrapping: 2
```

XCode Preference -> Locations -> Command Line Tools: *Xcode 11.x*

### Required:
-------

Installing the following packages:

[Carthage](https://github.com/Carthage/Carthage) : `brew update & brew install carthage`

[Swiftlint](https://github.com/realm/SwiftLint) : `brew install swiftlint`

### Setup:
-----

* Before setting the project up, you must ensure that all above requirements were up already.

	** Clone the repository to your machine

	** Navigate to iOSTemplate folder

	Run the following CLIs one by one:  <br>
	```
	1. chmod +x ./build.sh
	2. ./build.sh "NEW_PROJ_NAME"
	```
	replace NEW_PROJ_NAME with yours.

	** Update Carthage: 
    	`carthage bootstrap --platform iOS --no-use-binaries`
    
 
 
    
## Architecture High Level Overview:

### Clean architecture with RxSwift
#### Architecture: [Clean Architecture and Design] (https://www.youtube.com/watch?v=Nsjsiz2A9mg) - Robert C Martin 

#### Domain
The `Domain` is basically what is your App about and what it can do (Entities, UseCase etc.) **It does not depend on UIKit or any persistence framework**, and it doesn't have implementations apart from entities

#### Platforms
The `Platform` is a concrete implementation of the `Domain` in a specific platform like iOS. It does hide all implementation details. For example Database implementation whether it is CoreData, Realm, SQLite etc.

##### AWSPlatform: Implementation all things related AWS as AWSAppSync, AWSMobileClient, S3...
##### NetworkPlatform: Place of all implementation playing with RESTful API.  

#### Application
`Application` is responsible for delivering information to the user and handling user input. It can be implemented with `MVVM` pattern.

#### ServiceKit
Place of all reusable, convenient iOS services, including extensions, utilities,... which has got the taking-over certificate of the accuracy.

### Highlight notes:

`Code commentation` followed Apple standard style.

In order to make the project go perfect with Clean Architecture and using `RxSwift` was preferred to use for binding data and UIs control.

This project was integrated `SwiftLint` for Swift style and conventions enforcement. All rules were declared in .swiftlint.yml file.

## CI/CD

I will prefer CircleCI and Fastlane for CI/CD, combined with 2 services for UI Test, status notification: AWS Device Farm and Slack, code signing with Match and Rome for Carthage cache.

## Document Generator:

[Jazzy](https://github.com/realm/jazzy) - A command-line utility that generates documentation for Swift.

#### Install: `sudo gem install jazzy`

* Issue the following command to generate the project's documentation.

````
sh doc.sh
````

## Frameworks:

* [RxSwift](https://github.com/ReactiveX/RxSwift) - Reactive programming in Swift.

* [AWS iOS SDK](https://github.com/aws-amplify/aws-sdk-ios) - The AWS SDK for iOS provides a library and documentation for developers to build connected mobile applications using AWS.

* [AWS AppSync SDK](https://github.com/awslabs/aws-mobile-appsync-sdk-ios) - The AWS AppSync SDK for iOS enables you to access your AWS AppSync backend and perform operations like Queries, Mutations, and Subscriptions. The SDK also includes support for offline operations.

* [Alamofire](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.

* [RxAlamofire](https://github.com/RxSwiftCommunity/RxAlamofire) - RxSwift wrapper around the elegant HTTP networking in Swift Alamofire

* [SwiftDate](https://github.com/malcommac/SwiftDate) - The best way to manage Dates and Timezones in Swift

* [Kingfisher](https://github.com/onevcat/Kingfisher) - A lightweight, pure-Swift library for downloading and caching images from the web.

* [CryptoSwift](https://github.com/krzyzanowskim/CryptoSwift) - CryptoSwift is a growing collection of standard and secure cryptographic algorithms implemented in Swift 

## TODO:

* Code coverage of 80-90%
* Support SwiftUI and Combine frameworks
* Apply Bitrise and Buddybuild for CI/CD
* Move on to Swift Package Manager

