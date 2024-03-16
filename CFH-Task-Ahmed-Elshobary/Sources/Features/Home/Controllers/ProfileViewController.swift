//
//  ProfileViewController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
import SideMenu

class ProfileViewController: UIViewController {

    // MARK: - Actions
    
    @IBAction func sidemenu(_ sender: Any) {
        let sideMenuVC = SideMenuViewController.loadFromNib()
        sideMenuVC.sourceVC = .profile
        let menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        self.navigationController?.present(menu, animated: true, completion: nil)
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var userAge: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = UserDefaultsManager.shared.getUser() {
            userName.text = "Username: " +  "\(user.firstName ?? "Guest") \(user.lastName ?? "")"
            userAge.text = "Age: " +  (user.age ?? "0")
            userEmail.text = "Email: " +  (user.email ?? "")
        }

    }
}
