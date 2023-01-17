//
//  Decimal+Extension.swift
//  Klima
//
//  Created by Office on 1/17/23.
//

import Foundation

extension Float {
    /// Returns formatted weather reading data from float
    ///
    /// Here's an example
    ///
    ///     let currentTemp = Float(3.412)
    ///     print(currentTemp.weatherReadingFormat)
    ///     // Prints "3.4°"
    ///
    /// - Returns: year string from date string
    ///
    var weatherReadingFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 1
        return "\(numberFormatter.string(from: self as NSNumber) ?? "")°" 
    }
}
