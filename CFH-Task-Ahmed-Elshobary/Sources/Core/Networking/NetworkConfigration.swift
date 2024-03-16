//
//  EndPoint.swift
//  SupportI
//

import Foundation
import UIKit

// MARK: - ...  Network layer configration

struct NetworkConfigration {
    static var urlString:String = "https://api.foursquare.com/v2/"

    
    // MARK: - ...  The Endpoints
    
    public enum EndPoint: String {
        case venues
        
        var rawValue: String {
            get {
                switch self {
                case .venues:
                    return "venues/search?"
               
                }
            }
        }
    }
}

extension NetworkConfigration.EndPoint {
    static func endPoint(point: NetworkConfigration.EndPoint, paramters: [Any]? = nil) -> String {
        let method = NewNetworkManager.instance.slugs(point)
        return method
    }
}


 
