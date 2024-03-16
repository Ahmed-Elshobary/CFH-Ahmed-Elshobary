//
//  UIViewController+Extentions.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
    
    func startLoading() {
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        //        progress.mode = .annularDeterminate
        progress.isUserInteractionEnabled = false
        self.view.isUserInteractionEnabled = false
        progress.show(animated: true)
    }
    func stopLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.view.isUserInteractionEnabled = true
    }
    
    func showLoaderView(over view: UIView) {
        let overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayView.cornerRadius = 50
        overlayView.clipsToBounds = true
        view.addSubview(overlayView)
        
        let loaderView = UIActivityIndicatorView(style: .large)
        loaderView.startAnimating()
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loaderView)
        
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func hideLoaderView(over view: UIView) {
        view.subviews.filter { $0 is UIActivityIndicatorView || $0.backgroundColor == UIColor.black.withAlphaComponent(0.5) }.forEach { $0.removeFromSuperview() }
        
    }
    
    func addImageToView(over view: UIView, color:UIColor, image: UIImage) {
        view.backgroundColor = color.withAlphaComponent(0.5)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func checkLoaderViewPresent(in views: [UIView]) -> Bool {
        for view in views {
            if view.subviews.contains(where: { $0 is UIActivityIndicatorView || $0.backgroundColor == UIColor.black.withAlphaComponent(0.5) }) {
                return false
            }
            
            if !checkLoaderViewPresent(in: view.subviews) {
                return false
            }
        }
        
        return true
    }
    
    
    func removeStateImage(over view: UIView) {
        for subView in view.subviews {
            if subView.isKind(of: UIImageView.self){
                guard let image = subView as? UIImageView else {return}
                if (image.image == UIImage(named: "Done")) {
                    subView.removeFromSuperview()
                    view.backgroundColor = UIColor.white.withAlphaComponent(1)
                }
            }
        }
    }
}
