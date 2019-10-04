//
//  IAPService.swift
//  ServiceKit
//

import StoreKit
import PassKit

public typealias ProductIdentifier = String
public typealias ProductsRequestCompletionHandler = (_ success: Bool, _ products: [SKProduct]?) -> Void
public typealias PaymentRequestCompletionHandler = (_ transactions: [SKPaymentTransaction]) -> Void

open class IAPService: NSObject  {
  
  public static let items = [PKPaymentSummaryItem(label: "Silver", amount: 5.00),
                             PKPaymentSummaryItem(label: "Gold", amount: 10.00),
                             PKPaymentSummaryItem(label: "Diamond", amount: 15.00)]
    
  private let productIdentifiers: Set<ProductIdentifier>
  private var purchasedProductIdentifiers: Set<ProductIdentifier> = []
  private var productsRequest: SKProductsRequest?
  private var productsRequestCompletionHandler: ProductsRequestCompletionHandler?
  private var paymentRequestCompletionHandler: PaymentRequestCompletionHandler?

  public init(productIds: Set<ProductIdentifier>) {
    productIdentifiers = productIds
    for productIdentifier in productIds {
      let purchased = UserDefaults.standard.bool(forKey: productIdentifier)
      if purchased {
        purchasedProductIdentifiers.insert(productIdentifier)
      }
    }
    super.init()
    
    SKPaymentQueue.default().add(self)
  }
}

// MARK: - StoreKit API

extension IAPService {
  
  public func requestProducts(_ completionHandler: @escaping ProductsRequestCompletionHandler) {
    productsRequest?.cancel()
    productsRequestCompletionHandler = completionHandler
    
    productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
    productsRequest?.delegate = self
    productsRequest?.start()
  }
  
  public func paymentRequestCompletionHandler(_ completionHandler: @escaping PaymentRequestCompletionHandler) {
    paymentRequestCompletionHandler = completionHandler
  }
  
  public func buyProduct(_ product: SKProduct) {
    let payment = SKPayment(product: product)
    SKPaymentQueue.default().add(payment)
  }
  
  public func isProductPurchased(_ productIdentifier: ProductIdentifier) -> Bool {
    return purchasedProductIdentifiers.contains(productIdentifier)
  }
  
  public class func canMakePayments() -> Bool {
    return SKPaymentQueue.canMakePayments()
  }
  
  public func restorePurchases() {
    SKPaymentQueue.default().restoreCompletedTransactions()
  }
}

// MARK: - SKProductsRequestDelegate

extension IAPService: SKProductsRequestDelegate {
  
  public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
    let products = response.products.sorted(by: { $0.price.floatValue < $1.price.floatValue})
    productsRequestCompletionHandler?(true, products)
    clearRequestAndHandler()
  }
  
  public func request(_ request: SKRequest, didFailWithError error: Error) {
    productsRequestCompletionHandler?(false, nil)
    clearRequestAndHandler()
  }
  
  private func clearRequestAndHandler() {
    productsRequest = nil
    productsRequestCompletionHandler = nil
  }
}

// MARK: - SKPaymentTransactionObserver

extension IAPService: SKPaymentTransactionObserver {
  
  public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    for transaction in transactions where [.purchased, .failed].contains(transaction.transactionState) {
      SKPaymentQueue.default().finishTransaction(transaction)
    }
    paymentRequestCompletionHandler?(transactions)
  }
}
