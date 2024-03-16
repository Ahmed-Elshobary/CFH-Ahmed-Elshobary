//
//  UIButtonExtention.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit


public extension UIButton {

    
    @IBInspectable var boldFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.font = UIFont.appFontBold(ofSize: newValue)
        }
    }
    
    @IBInspectable var regularFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.font = UIFont.appFontRegular(ofSize: newValue)
        }
    }
    

    
    @IBInspectable var mediumFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.font  = UIFont.appFontMedium(ofSize: newValue)
        }
    }
    @IBInspectable var lightFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.font = UIFont.appFontLight(ofSize: newValue)
        }
    }
    

    
    @IBInspectable var isUpperCased: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.setTitle(self.title(for: .normal)?.uppercased(), for: .normal)
                self.titleLabel?.text = self.title(for: .normal)?.uppercased()
            }
       }
    }
}
