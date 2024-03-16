//
//  CustomAnnotationModel.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation
import MapKit
class CustomAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let imageURL: URL?
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D, imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.imageURL = imageURL
        
        super.init()
    }
}
