//
//  LoginViewController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

class LoginViewController: AuthenticationBaseController {

    
    @IBOutlet weak var emailField: InputTextField!
    @IBOutlet weak var passwordField: InputTextField!
    
    
    var viewModel: LoginViewModel = .init()
    
    
    @IBAction func login(_ sender: Any) {
        if emailField.validateField() && passwordField.validateField() {
            viewModel.login(email: emailField.inputTextField.text ?? "", password: passwordField.inputTextField.text ?? "")
        }
    }
    
    @IBAction func createNewAccount(_ sender: Any) {
        self.navigator?.navigate(to: .createAccount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindLogin()
        
    }

    func bindLogin(){
        
        viewModel.errorObject.listen(on: { [weak self] error in
            self?.present(HelperMethods.showAlert(title: "Alert", message: "Please enter valid email and password"), animated: true)
            
        })
        
        viewModel.loginObject.listen(on: { [weak self] value in
            UserDefaultsManager.shared.setLoggedIn(isLoggedIn: true)
            self?.navigator.setRootHome()
        })
        
    }
}
