//
//  UIFont+Extentions.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

extension UIFont {
    
    class func appFontBold(ofSize size: CGFloat) -> UIFont {
            let fontName = "FFShamelFamily-UniqueBold"
        let fontSize = (size > 11) ? size : size + 3
            return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    class func appFontRegular(ofSize size: CGFloat) -> UIFont {
            let fontName = "FFShamelFamily-UniqueBook"
        let fontSize = (size > 11) ? size : size + 3
            return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    class func appFontMedium(ofSize size: CGFloat) -> UIFont {
            let fontName = "FFShamelFamily-UniqueMedium"
        let fontSize = (size > 11) ? size : size + 3
            return UIFont(name: fontName, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)

    }

    class func appFontLight(ofSize size: CGFloat) -> UIFont {
            let fontName = " FFShamelFamily-UniqueLight"
        let fontSize = (size > 11) ? size : size + 3
            return UIFont(name: fontName, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    
}

