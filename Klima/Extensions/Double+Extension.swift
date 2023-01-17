//
//  Decimal+Extension.swift
//  Klima
//
//  Created by Office on 1/17/23.
//

import Foundation

extension Float {
    var weatherReadingFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 1
        return "\(numberFormatter.string(from: self as NSNumber) ?? "")°" 
    }
}
