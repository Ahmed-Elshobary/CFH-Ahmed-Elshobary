//
//  UILabel+Extentions.swift
// CFH-Task-Ahmed-Elshobary
//
// Created by ahmed elshobary on 16/03/2024.
//

import UIKit

@IBDesignable extension UILabel {
    
    @IBInspectable var regularFont: CGFloat {
        get {
            return self.font.capHeight
        }
        set {
            self.font = UIFont.appFontRegular(ofSize: newValue)
            self.setLineSpacing()
        }
    }
    
    
    @IBInspectable var mediumFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.font  = UIFont.appFontMedium(ofSize: newValue)
            self.setLineSpacing()
        }
    }
    @IBInspectable var lightFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.font  = UIFont.appFontLight(ofSize: newValue)
            self.setLineSpacing()
        }
    }
    

    
    @IBInspectable var isUpperCased: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.text = self.text?.uppercased()
            }
       }
    }
    
    @IBInspectable var isCapitalized: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.text = self.text?.capitalized
            }
       }
    }
    
    
    @IBInspectable var adjustFontToFitWidth: Bool {
        get {
            return self.adjustsFontSizeToFitWidth
        }
        set {
            self.adjustsFontSizeToFitWidth = newValue
       }
    }
    
    func setLineSpacing() {
           guard let text = self.text else { return }
           let attributedString = NSMutableAttributedString(string: text)
           let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = 10
           paragraphStyle.alignment = self.textAlignment
           attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
           self.attributedText = attributedString
       }
}
