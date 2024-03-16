//
//  HomeBaseController.swift
// CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

class HomeBaseController: UIViewController {

    public var navigator: HomeNavigator!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navController = self.navigationController  {
            navigator = HomeNavigator(navController: navController)
        }
    }
}
