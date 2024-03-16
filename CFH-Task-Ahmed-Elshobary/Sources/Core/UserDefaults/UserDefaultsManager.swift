//
//  UserDefaultsManager.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let userDefaults = UserDefaults.standard
    private let key = "userData"
    private let firstTimeKey = "isFirstTime"
    private let LoggedInKey = "isLoggedIn"
    private let permissionAlertKey = "PermissionAlertPresented"
    private let latitudeKey = "latitude"
    private let longitudeKey = "longitude"
    
    func isFirstTime() -> Bool {
        return !userDefaults.bool(forKey: firstTimeKey)
    }
    
    func setFirstTime() {
        userDefaults.set(true, forKey: firstTimeKey)
    }
    
    
    func isLoggedIn() -> Bool {
        return userDefaults.bool(forKey: LoggedInKey)
    }
    
    func setLoggedIn(isLoggedIn: Bool) {
        userDefaults.set(isLoggedIn, forKey: LoggedInKey)
    }
    
    func isPermissionAlertPresented() -> Bool {
        return userDefaults.bool(forKey: permissionAlertKey)
    }
    
    func setPermissionAlertPresented(_ presented: Bool) {
        userDefaults.set(presented, forKey: permissionAlertKey)
    }
    
    func setLatitude(_ latitude: Double) {
        userDefaults.set(latitude, forKey: latitudeKey)
    }
    
    func setLongitude(_ longitude: Double) {
        userDefaults.set(longitude, forKey: longitudeKey)
    }
    
    func getLatitude() -> Double? {
        return userDefaults.double(forKey: latitudeKey)
    }
    
    func getLongitude() -> Double? {
        return userDefaults.double(forKey: longitudeKey)
    }
    
    func addUser(user: UserModel) {
        do {
            let encodedData = try JSONEncoder().encode(user)
            userDefaults.set(encodedData, forKey: key)
        } catch {
            print("Error encoding user data: \(error)")
        }
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: key)
    }
    
    func updateUser(user: UserModel) {
        addUser(user: user) // For simplicity, updating is the same as adding
    }
    
    func getUser() -> UserModel? {
        guard let userData = userDefaults.data(forKey: key) else { return nil }
        do {
            let decodedData = try JSONDecoder().decode(UserModel.self, from: userData)
            return decodedData
        } catch {
            print("Error decoding user data: \(error)")
            return nil
        }
    }
}
