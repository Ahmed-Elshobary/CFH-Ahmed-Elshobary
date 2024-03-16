//
//  HomeViewController+LocationManagerDelegate.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import CoreLocation
import UIKit

extension HomeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        UserDefaultsManager.shared.setLatitude(latitude)
        UserDefaultsManager.shared.setLongitude(longitude)
        locationManager.stopUpdatingLocation()
        searchNearbyVenues()

        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .authorizedWhenInUse, .authorizedAlways:
                // User has granted permission, start updating location
                locationManager.startUpdatingLocation()
            case .denied, .restricted:
                // User has denied or restricted permission, show custom alert if not already presented
                if UserDefaultsManager.shared.isPermissionAlertPresented() {
                    UserDefaultsManager.shared.setPermissionAlertPresented(true)
                    self.present(HelperMethods.showAlert(title: "Location Access Denied", message: "Please enable location access in Settings to use this feature.",primaryButtonAction: { action in
                        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(settingsURL)
                        }
                    } ,secondButtonAction: { action in
                        if (UserDefaultsManager.shared.getLongitude() == nil || UserDefaultsManager.shared.getLongitude() == 0.0) || (UserDefaultsManager.shared.getLatitude() == nil || UserDefaultsManager.shared.getLatitude() == 0.0) {
                            self.enableLocationLabel.isHidden = false
                        } else {
                            self.searchNearbyVenues()
                        }
                    },primaryButtonTitle: "Settings", secondButtonTitle: "Cancel"), animated: true)
                }
            default:
                locationManager.requestLocation()
                break
            }
        }
    
    func handleAuthorizationStatus(_ status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            if UserDefaultsManager.shared.isPermissionAlertPresented() {
                UserDefaultsManager.shared.setPermissionAlertPresented(true)
                self.present(HelperMethods.showAlert(title: "Location Access Denied", message: "Please enable location access in Settings to use this feature.",primaryButtonAction: { action in
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsURL)
                    }
                }, secondButtonAction: { action in
                    if (UserDefaultsManager.shared.getLongitude() == nil || UserDefaultsManager.shared.getLongitude() == 0.0) || (UserDefaultsManager.shared.getLatitude() == nil || UserDefaultsManager.shared.getLatitude() == 0.0) {
                        self.enableLocationLabel.isHidden = false
                    } else {
                        self.searchNearbyVenues()
                    }
                } ,primaryButtonTitle: "Settings", secondButtonTitle: "Cancel"), animated: true)
            }
        default:
            locationManager.requestLocation()
            break
        }
    }
}
