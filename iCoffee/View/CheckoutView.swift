//
//  CheckoutView.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/16.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var basketListener = BasketListener()
    
    static let paymentTypes = ["Cash", "Credit Card"]
    static let tipAmounts = [10, 15, 20, 0]
    
    @State private var paymentType = 0
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = basketListener.orderBasket.total
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker(selection: $tipAmount, label: Text("Percentage: ")) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0]) %")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total: $\(totalPrice,specifier: "%.2f")").font(.largeTitle)) {
                Button {
                    self.showingPaymentAlert.toggle()
                    self.createOrder()
                    self.emptyBasket()
                } label: {
                    Text("Confirm Order")
                }
            }
            .disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
        }
        .navigationTitle(Text("Payment"))
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Thank You!"), dismissButton: .default(Text("OK")))
        }
    }
    
    private func createOrder() {
        let order = Order()
        order.amount = totalPrice
        order.id = UUID().uuidString
        order.customerID = FUser.currentId()
        order.orderItems = self.basketListener.orderBasket.items
        
        order.saveOrderToFirebase()
        
    }
    
    private func emptyBasket() {
        self.basketListener.orderBasket.emptyBasket()
    }
    
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
