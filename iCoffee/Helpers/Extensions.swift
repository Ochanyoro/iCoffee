//
//  Extensions.swift
//  iCoffee
//
//  Created by 大和田一裕 on 2022/07/15.
//

import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
