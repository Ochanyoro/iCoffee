//
//  iCoffeeApp.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/14.
//

import SwiftUI
import Firebase

@main
struct iCoffeeApp: App {
    
    // Firebaseを使う
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
