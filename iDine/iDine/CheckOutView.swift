//
//  CheckOutView.swift
//  iDine
//
//  Created by Johel Zarco on 26/09/22.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    /*
     SwiftUI gives us a different property wrapper for these simple local values: @State. It works similarly to @EnvironmentObject in that if the object changes it automatically refreshes our UI, but it’s designed for simple local values like integers and strings.
     In our case is the total amount that will be shared accross UI's
     Apple recomends to use the private
     */
    @State private var paymentType = "Cash" // default payment type
    @State private var addLoyaltyDetails = false
    @State private var loyalttyNumber = ""
    @State private var tipAmount = 15
    // state property for showing alert
    @State private var showingPaymentAlert = false
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    // compouted property for total cost of the order, every time @state tip property is called, total price is re-calculated
    var totalPrice : String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = (total / 100) * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        
    }
    
    var body: some View {
        Form{// just changed VStack to Form, much better feel!
            Section{
                Picker("Choose payment method:", selection: $paymentType){ // $ two way binding, use the value from the property wrapper
                    ForEach(paymentTypes, id : \.self){
                        Text($0)
                    }
                }
                
                Toggle("Add loyalty Card", isOn: $addLoyaltyDetails.animation()) //$writes to @state value, animation() makes it look smoother
                if(addLoyaltyDetails){ // if we only want to read @state property, no need to use $
                    TextField("Enter your Idine ID:", text: $loyalttyNumber)
                }
                
            }
            Section(header : Text("Add a tip?")){
                Picker("Percentage : ", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header : Text("Total : \(totalPrice)")){
                Button("Confirm order"){// tintColor is automatically le
                    print("Confirm order tapped")
                    // in order to show alert binding mut be true
                    showingPaymentAlert.toggle()
                }
            }
        }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingPaymentAlert){
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
            }
    }
}



//struct CheckOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckOutView()
//    }
//}
