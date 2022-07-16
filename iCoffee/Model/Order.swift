//
//  Order.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/16.
//

import Foundation


class Order: Identifiable {
    
    var id: String!
    var customerID: String!
    var orderItems: [Drink] = []
    var amount: Double!
    var customerName: String!
    var isCompleted: Bool!
    
    func saveOrderToFirebase(){
        FirebaseReference(.Order).document(self.id).setData(orderDictionaryFromOrder(self)) { error in
            if let error = error {
                print("error saving order to firestore", error.localizedDescription)
            }
        }
    }
}


func orderDictionaryFromOrder(_ order: Order) -> [String : Any] {
    
    var allDrinkIds: [String] = []
    
    for drink in order.orderItems {
        allDrinkIds.append(drink.id)
    }
    
    return NSDictionary(objects: [
        order.id,
        order.customerID,
        allDrinkIds,
        order.amount,
        order.customerName,
        order.isCompleted
    ], forKeys: [
        kID as NSCopying,
        kCUSTOMERID as NSCopying,
        kDRINKIDS as NSCopying,
        kAMOUNT as NSCopying,
        kCUSTOMERNAME as NSCopying,
        kISCOMPLETED as NSCopying
    ]) as! [String : Any]
}
