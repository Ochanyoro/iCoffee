//
//  DrinkDetail.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/15.
//

import SwiftUI

struct DrinkDetail: View {
    
    @State private var showingAlert = false
    
    var drink: Drink
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            ZStack(alignment: .bottom) {
                Image(drink.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(.black)
                    .opacity(0.35)
                    .blur(radius: 10)
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())
            
            Text(drink.description)
                .foregroundColor(.primary)
                .font(.body)
                .lineLimit(5)
                .padding()
            
            HStack {
                Spacer()

                OrderButton(showAlert: $showingAlert, drink: self.drink)
                
                Spacer()

            }
            .padding(.top, 50)
            
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitle("iCoffee")
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Added to Backet!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData.first!)
    }
}

struct OrderButton: View {
    
    @Binding var showAlert: Bool
    
    var drink: Drink
    
    var body: some View {
        
        Button {
            self.showAlert.toggle()
            self.addItemToBasket()
        } label: {
            Text("Add to basket")
        }
        .frame(width: 200, height: 50)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue)
        .cornerRadius(10)

    }
    
    private func addItemToBasket() {
        
        var orderBasket: OrderBasket!
        
        orderBasket = OrderBasket()
        orderBasket.ownerID = "123"
        orderBasket.id = UUID().uuidString
        orderBasket.add(self.drink)
        orderBasket.saveBasketToFirebase()
    }
}
