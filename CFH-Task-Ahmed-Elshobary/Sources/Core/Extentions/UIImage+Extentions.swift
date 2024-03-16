//
//  UIImage+Extentions.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

extension UIImage {
    func resized(withCompression compression: CGFloat) -> UIImage? {
        let imageData = self.jpegData(compressionQuality: compression)
        return UIImage(data: imageData ?? Data())
    }
}
