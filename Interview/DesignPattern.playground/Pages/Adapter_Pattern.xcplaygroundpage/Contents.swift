//: [Previous](@previous)


/*
 Pavunraj
 Linkedin - www.linkedin.com/in/pavunraj-experienced-ios-dev
 Email id - pavunrajtech@gmail.com
 WhatsApp - +91 9578634446
 
 
 // Adapter
 There is case of system Incompatible interface is doesn't fit for system , like open source library
 Need to make it compitable interface
 use the extension without break old implemtation

 
 */

import Foundation


// classic Method adapter

protocol PaymentGateway {
    
    func receivePayment(amount: Double)
    var totalPayment: Double { get }
}


final class Paypal: PaymentGateway {
    
    private var total: Double = 0.0
    
    func receivePayment(amount: Double) {
        total += amount
        print("Receive total amount paypal \(total)")
    }
    
    var totalPayment : Double{
       return total
    }
    
}



final class Stripe: PaymentGateway {
    
    private var total: Double = 0.0
    
    func receivePayment(amount: Double) {
        total += amount
        print("Receive total amount stripe \(total)")
    }
    
    var totalPayment : Double{
       return total
    }
    
}


// The AmazonPayment class as no PaymentGatway protocol
// It's incompitable interface

final class AmazonPayment {
     var total: Double
    
    init(total: Double) {
        self.total = total
    }
    
    func receivePaymentAmazon(amount:Double, currency: String) {
        total += amount
    }
    
}


let amazonPayment = AmazonPayment(total: 0.0)
amazonPayment.receivePaymentAmazon(amount: 100.0, currency: "USD")
amazonPayment.receivePaymentAmazon(amount: 110.0, currency: "USD")

print(amazonPayment.total)


class AmazonPayamentAdapter : PaymentGateway {
    
    
    func receivePayment(amount: Double) {
        amazonPayment.receivePaymentAmazon(amount: amount, currency: "USD")

        print("Receive total amount stripe \(total)")
    }
    
    var totalPayment : Double{
        return amazonPayment.total
    }
    
}


let paypal = Paypal()
paypal.receivePayment(amount: 200.0)

let stripe = Stripe()
stripe.receivePayment(amount: 300.0)





let amazonPayamentAdapter = AmazonPayamentAdapter()
amazonPayamentAdapter.receivePayment(amount: 310.0)


var paymentGateways : [PaymentGateway] =  [paypal,stripe, amazonPayamentAdapter]


var total = 0.0

for gateway in paymentGateways {
    
    total += gateway.totalPayment
}


print("Total amount: \(total)")



// Method 2
// Use extension

extension AmazonPayment: PaymentGateway {
    
    
    func receivePayment(amount: Double) {
        total += amount
        print("Receive total amount stripe \(total)")
    }
    
    var totalPayment : Double{
       return total
    }
}
