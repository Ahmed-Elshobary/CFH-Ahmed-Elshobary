//
//  HelperMethods.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation
import UIKit
import CoreGraphics


class HelperMethods {
    
    class func addLoaderOverlay(to button: UIButton) {
        // Create an overlay view
        let overlayView = UIView(frame: button.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.4) // Transparent black
        
        // Create an activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .large) // Use .large style
        activityIndicator.center = CGPoint(x: overlayView.bounds.midX, y: overlayView.bounds.midY)
        activityIndicator.startAnimating()
        
        // Add the activity indicator to the overlay view
        overlayView.addSubview(activityIndicator)
        
        // Add the overlay view to the button
        button.addSubview(overlayView)
        
        // Disable user interaction on the button
        button.isUserInteractionEnabled = false
        
        // Set a tag for the overlay view to later identify and remove it
        overlayView.tag = 101
    }
    
    class func removeLoaderOverlay(from button: UIButton) {
        DispatchQueue.main.async {
            if let overlayView = button.viewWithTag(101) {
                overlayView.removeFromSuperview()
            }
            button.isUserInteractionEnabled = true
        }
    }
    
    class func safeUrl(url: String) -> String {
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        return safeURL
    }
    
    class func openURL(selectedURL:String) {
        if let url = URL(string: selectedURL) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    class func convertBase64ToImage(base64String: String) -> UIImage? {
        if let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
            return UIImage(data: imageData)
        }
        return nil
    }
    
    class func showAlert(
        title: String,
        message: String,
        primaryButtonAction: ((UIAlertAction) -> ())? = nil,
        secondButtonAction: ((UIAlertAction) -> ())? = nil,
        primaryButtonTitle: String? = nil,
        secondButtonTitle: String? = nil
    ) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.init(netHex: 0x0BAC4B)
        
        let okAction = UIAlertAction(title: primaryButtonTitle ?? "Ok".localized, style: .default, handler: primaryButtonAction)
        okAction.setValue(UIColor.init(netHex: 0x002A5B), forKey: "titleTextColor")
        
        let secondButton = UIAlertAction(title: secondButtonTitle ?? "Cancel".localized, style: .default, handler: secondButtonAction)
        secondButton.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(okAction)
        if secondButtonTitle != nil {
            alertController.addAction(secondButton)
        }
        return alertController
    }
}
