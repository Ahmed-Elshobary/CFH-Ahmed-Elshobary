//
//  HomeViewController+MapViewDelegate.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
import MapKit

extension HomeViewController: MKMapViewDelegate {
        
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let customAnnotation = annotation as? CustomAnnotation else {
            return nil
        }
        
        let reuseIdentifier = "customAnnotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? CustomAnnotationView
        
        if annotationView == nil {
            annotationView = CustomAnnotationView(annotation: customAnnotation, reuseIdentifier: reuseIdentifier)
        } else {
            annotationView?.annotation = customAnnotation
        }
        
        // Configure your custom annotation view
        // For example, set the image from the URL
        if let imageURL = customAnnotation.imageURL {
            URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    annotationView?.image = UIImage(data: data)
                }
            }.resume()
        }
        
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let customAnnotation = view.annotation as? CustomAnnotation else {
            return
        }
        
        let alertController = UIAlertController(title: customAnnotation.title, message: customAnnotation.subtitle, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
