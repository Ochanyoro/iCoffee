//
//  ContentView.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/14.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Text("Hi")
            
                .navigationBarTitle(Text("iCoffee"))
                .navigationBarItems(leading:
                    Button(action: {
                        print("log out")
                    }, label: {
                        Text("Log Out")
                    })
                    , trailing:
                    Button(action: {
                        print("basket")
                    }, label: {
                        Image("basket")
                    })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
