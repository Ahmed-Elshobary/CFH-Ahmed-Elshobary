//
//  LoginViewModel.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation

class LoginViewModel: BaseViewModel, Alertable {
    var loginObject: Publisher<UserModel> = .init()
    var errorObject: Publisher<String> = .init()
    
    func login(email: String, password: String) {
        // Retrieve the stored password from the keychain
        guard let storedPassword = KeychainManager.getPassword(service: CFHConstants.keychainService, account: UserDefaultsManager.shared.getUser()?.email ?? "") else {
            errorObject.send("invalid data")
            return
        }
        
        // Retrieve the user details from UserDefaults
        guard let user = UserDefaultsManager.shared.getUser() else {
            errorObject.send("invalid data")
            return
        }
        
        // Check if the provided phone and password match the stored user data
        if user.email == email && storedPassword == password {
            loginObject.send(user)
        } else {
            errorObject.send("invalid data")
        }
    }
}
