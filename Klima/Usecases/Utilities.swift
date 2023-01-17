//
//  Utilities.swift
//  Klima
//
//  Created by Office on 1/17/23.
//

import Foundation
import UIKit

struct Utilities {
    /// Opens setting screen
    static func openSettingsSreen() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
}
