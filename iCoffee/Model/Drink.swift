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
