//
//  SideMenuViewController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

enum SourceVC {
    case profile
    case home
    case terms
}

class SideMenuViewController: HomeBaseController {

    // MARK: - Variables
    
    var sourceVC: SourceVC?
    
    // MARK: - Actions
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        UserDefaultsManager.shared.setLoggedIn(isLoggedIn: false)
        self.navigator.setRootLogin()
    }
    @IBAction func termsButtonAction(_ sender: Any) {
        if !isPresentedFromTerms() {
            self.navigator.navigate(to: .terms)
        } else {
            self.dismiss(animated: true)
        }
    }
    @IBAction func myProfileButtonAction(_ sender: Any) {
        if !isPresentedFromProfile() {
            self.navigator.navigate(to: .profile)
        } else {
            self.dismiss(animated: true)
        }
    }
    @IBAction func HomeButtonAction(_ sender: Any) {
        if !isPresentedFromHome() {
            self.navigator.navigate(to: .home)
        } else {
            self.dismiss(animated: true)
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func isPresentedFromHome() -> Bool {
        if sourceVC == .home {
            return true
        }
        return false
    }
    
    private func isPresentedFromProfile() -> Bool {
        if sourceVC == .profile {
            return true
        }
        return false
    }

    private func isPresentedFromTerms() -> Bool {
        if sourceVC == .terms {
            return true
        }
        return false
    }
}
