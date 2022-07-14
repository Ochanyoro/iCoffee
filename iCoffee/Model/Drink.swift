//
//  Drink.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/14.
//

import Foundation
import SwiftUI


enum Category: String, CaseIterable, Codable, Hashable {
    case hot
    case cold
    case filter
}



struct Drink: Identifiable, Hashable{
    
    var id: String
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var price: Double

}


func drinkDictionaryFrom(drink: Drink) -> [String : Any] {
    
    
    return NSDictionary(object: [drink.id,
                                 drink.name,
                                 drink.imageName,
                                 drink.category.rawValue,
                                 drink.description,
                                 drink.price
                                ], forKey: [
                                    kID as NSCopying,
                                    kNAME as NSCopying,
                                    kIMAGENAME as NSCopying,
                                    kCATEGORY as NSCopying,
                                    kDESCRIPTION as NSCopying,
                                    kPRICE as NSCopying
                                ] as NSCopying) as! [String : Any]
}

func createMenu() {
    for drink in drinkData {
        FirebaseReference(.Menu).addDocument(data: drinkDictionaryFrom(drink: drink))
    }
}
