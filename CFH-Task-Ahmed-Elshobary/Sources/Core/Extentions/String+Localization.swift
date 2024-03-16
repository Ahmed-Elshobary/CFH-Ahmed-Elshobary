//
//  String+Localization.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
extension String {
    
    var localized: String {
        
        return NSLocalizedString(self, comment: self)
    }
    
    func localized(fromTable tableName: String) -> String {
        
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: self, comment: self)
    }
    
}
