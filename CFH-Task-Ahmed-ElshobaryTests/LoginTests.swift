//
//  LoginTests.swift
//  CFH-Task-Ahmed-ElshobaryTests
//
//  Created by ahmed elshobary on 16/03/2024.
//

import XCTest
@testable import CFH_Task_Ahmed_Elshobary

final class LoginTests: XCTestCase {
    
    var viewController: LoginViewController!
    var viewModel: LoginViewModelMock!
    
    override func setUp() {
        super.setUp()
        viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)

        viewController.loadViewIfNeeded()
        
        // Mock the view model
        viewModel = LoginViewModelMock()
        viewController.viewModel = viewModel
    }
    
    func testLoginButtonTapped() {
        // Given
        let email = "test@example.com"
        let password = "password"
        viewController.emailField.inputTextField.text = email
        viewController.passwordField.inputTextField.text = password
        
        // When
        viewController.login(UIButton())
        
        // Then
        XCTAssertTrue(viewModel.loginCalled)
        XCTAssertEqual(viewModel.loggedEmail, email)
       XCTAssertEqual(viewModel.loggedPassword, password)
    }
}
    // Mock ViewModel for testing
    class LoginViewModelMock: LoginViewModel {
        
        var loginCalled = false
        var loggedEmail: String?
        var loggedPassword: String?
        
        override func login(email: String, password: String) {
            loginCalled = true
            loggedEmail = email
            loggedPassword = password
        }
        
    }
