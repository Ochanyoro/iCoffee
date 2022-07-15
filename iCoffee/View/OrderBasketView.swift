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
                            
                            Text("\(drink.price)")
                        }
                    }
                    .onDelete { (indexSet) in
                        print("Delete at \(indexSet)")
                    }
                }
                
                Section {
                    Text("Place Order")
                }
                .disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
            }
            .navigationTitle("Order")
            .listStyle(GroupedListStyle())
        }
    }
}

struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
