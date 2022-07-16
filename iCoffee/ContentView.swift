//
//  ContentView.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/14.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var drinkListener = DrinkListener()
    @State private var showingBasket = false
    
    var categories: [String : [Drink] ] {
        .init(
            grouping: drinkListener.drinks,
            by: { $0.category.rawValue}
        )
    }
    
    var body: some View {
        
        NavigationView {
            
            List(categories.keys.sorted(), id: \String.self) { key in
                DrinkRow(categoryName: "\(key) Dink".uppercased(), drinks: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
            }
            
            
            .navigationBarTitle(Text("iCoffee"))
            .navigationBarItems(leading:
                Button(action: {
                    print("log out")
                }, label: {
                    Text("Log Out")
                })
                , trailing:
                Button(action: {
                    self.showingBasket.toggle()
                }, label: {
                    Image("basket")
                })
                    .sheet(isPresented: $showingBasket) {
                        if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                            OrderBasketView()
                        } else if FUser.currentUser() != nil {
                            FinishRegistrationView()
                        } else {
                            LoginView()
                        }
                        
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
