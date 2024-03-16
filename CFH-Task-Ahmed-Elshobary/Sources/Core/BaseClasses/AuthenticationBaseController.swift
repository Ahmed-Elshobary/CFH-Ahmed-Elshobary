//
//  BaseController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

class AuthenticationBaseController: UIViewController {

    public var navigator: AuthenticationNavigator!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navController = self.navigationController  {
            navigator = AuthenticationNavigator(navController: navController)
        }
    }
}
