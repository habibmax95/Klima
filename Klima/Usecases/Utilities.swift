//
//  Utilities.swift
//  Klima
//
//  Created by Office on 1/17/23.
//

import Foundation
import UIKit

struct Utilities {
    static func openSettingsSreen() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
}
