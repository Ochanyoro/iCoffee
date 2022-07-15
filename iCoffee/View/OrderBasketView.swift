//
//  OrderBasketView.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/15.
//

import SwiftUI

struct OrderBasketView: View {
    
    @ObservedObject var basketListener = BasketListener()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(self.basketListener.orderBasket?.items ?? []) { drink in
                        HStack {
                            Text(drink.name)
                            
                            Spacer()
                            
                            Text("\(drink.price.clean) $")
                        }
                    }
                    .onDelete { (indexSet) in
                        self.deleteItems(at: indexSet)
                    }
                }
                
                Section {
                    NavigationLink(destination: ContentView()) {
                        Text("Place Order")
                    }
                }
                .disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
            }
            .navigationTitle("Order")
            .listStyle(GroupedListStyle())
        }
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        self.basketListener.orderBasket.items.remove(at: offsets.first!)
        self.basketListener.orderBasket.saveBasketToFirebase()
    }
    
}

struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
