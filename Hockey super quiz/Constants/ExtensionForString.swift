//
//  ExtensionForString.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 06/08/22.
//

import Foundation
import Foundation
//MARK: extension for string
extension String {
    var localizedDD: String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: self, comment: "")
    }
}
