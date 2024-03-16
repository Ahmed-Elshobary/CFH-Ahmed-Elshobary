//
//  UITextField+Extentions.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }

}

@IBDesignable extension UITextField {
    
   
    @IBInspectable var boldFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.font = UIFont.appFontBold(ofSize: newValue)
        }
    }
    
    @IBInspectable var regularFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.font = UIFont.appFontRegular(ofSize: newValue)
        }
    }
    
    
    @IBInspectable var mediumFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.font  = UIFont.appFontMedium(ofSize: newValue)
        }
    }
    @IBInspectable var lightFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.font  = UIFont.appFontLight(ofSize: newValue)
        }
    }
    
    @IBInspectable var paddingLeftCustom: CGFloat  {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
}
