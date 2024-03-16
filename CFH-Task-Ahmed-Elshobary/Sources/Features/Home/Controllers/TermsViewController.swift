//
//  TermsViewController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
import SideMenu

class TermsViewController: UIViewController {

    @IBAction func sideMenuButton(_ sender: Any) {
        let sideMenuVC = SideMenuViewController.loadFromNib()
        sideMenuVC.sourceVC = .terms
        let menu = SideMenuNavigationController(rootViewController: sideMenuVC)
        self.navigationController?.present(menu, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
