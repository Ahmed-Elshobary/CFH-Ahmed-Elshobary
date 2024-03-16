//
//  HomeViewModel.swift
//  CFH-Task-Ahmed-Elshobary
//
// Created by ahmed elshobary on 16/03/2024.
//

import Foundation

class HomeViewModel: BaseViewModel, Alertable {
    var venuesObject: Publisher<VenueModelResponse> = .init()
}
extension HomeViewModel {
    
    func search(lat: String, long: String) {
        // Create the object
        let params: [String: Any] = [
            "ll": "\(lat),\(long)",
            "client_id": CFHConstants.clientID,
            "client_secret": CFHConstants.client_secret,
            "v": CFHConstants.v
        ]
        NewNetworkManager.instance.paramaters = params
        NewNetworkManager.instance.request(NetworkConfigration.EndPoint.venues.rawValue, type: .get, VenueModelResponse.self)?.response(error: { [weak self] error in
            self?.error.send(error)
            self?.makeAlertWith(error.localizedDescription)
            
        }, receiveValue: { [weak self] model in
            guard let model = model else { return }
            print(model)
            self?.venuesObject.send(model)
        }).store(self)
    }
    
}
