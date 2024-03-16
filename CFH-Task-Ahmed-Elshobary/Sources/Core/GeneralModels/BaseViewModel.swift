//
//  BaseViewModel.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation
import Alamofire
// MARK: - ...  Base ViewModel
class BaseViewModel: NSObject, ViewModelProtocol, ViewModelPaginate, Combining {
    var requests: [DataRequest?] = []
    var subscriptions: Set<Subscriptions> = []
    var error: Publisher<NetworkError> = .init()
    var requestFinished: Publisher<Bool> = .init()
    // MARK: - ...  empty the refrence
    override init() {
        super.init()
        bind()
    }
    deinit {
        removeSubscription()
//        removeTasks()
    }
    func publisher() {
        requestFinished.send(true)
    }
    @objc dynamic func bind() {
        
    }
    
    func convertToQueryParamters(params: [String: Any], apiURL: String) -> URL {
        let queryItems = params.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }

        var urlComponents = URLComponents(string: apiURL)!
        urlComponents.queryItems = queryItems

        let url = urlComponents.url!

        return url
    }
}
