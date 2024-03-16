//
//  CreateNewAccountViewModel.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import Foundation

class CreateNewAccountViewModel: BaseViewModel, Alertable {
    var accountCreatedResponse: Publisher<UserModel> = .init()
}
    
extension CreateNewAccountViewModel {
    
    func registerNewUser(fields: [InputTextField]) {
        var userModel = UserModel()
        var password = ""
        for field in fields {
            switch field.tag {
            case 2:
                userModel.firstName = field.inputTextField.text
            case 3:
                userModel.lastName = field.inputTextField.text
            case 4:
                userModel.age = field.inputTextField.text
            case 5:
                userModel.email = field.inputTextField.text
            case 6:
                password = field.inputTextField.text ?? ""
            default:
                break
            }
        }
        UserDefaultsManager.shared.addUser(user: userModel)
        KeychainManager.savePassword(service: CFHConstants.keychainService, account: userModel.email ?? "", password: password)
        self.accountCreatedResponse.send(userModel)
        
    }
}
