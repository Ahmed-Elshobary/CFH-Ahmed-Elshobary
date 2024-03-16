//
//  AuthenticationCoordinator.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
import SideMenu
protocol Navigator {
    associatedtype Destination

    func navigate(to destination: Destination)
}



class AuthenticationNavigator: Navigator {
    // Here we define a set of supported destinations using an
    // enum, and we can also use associated values to add support
    // for passing arguments from one screen to another.
    
    var navigationController: UINavigationController!
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    enum Destination {
        case login
        case createAccount
    }
    
    // MARK: - Navigator

    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }

    
    // MARK: - Private

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .login:
            return LoginViewController.loadFromNib()
        case .createAccount:
            return CreateNewAccountViewController.loadFromNib()
        }
    }
    
    func setRootHome() {
        let scene = HomeViewController.loadFromNib()
        let navigationController = SideMenuNavigationController(rootViewController: scene)
        navigationController.leftSide = true
        
        navigationController.navigationBar.isHidden = true
        guard let scene = UIApplication.shared.connectedScenes.first,
              let sceneDelegate = scene.delegate as? SceneDelegate else { return }
        let window = sceneDelegate.window
        window?.rootViewController =  navigationController
        window?.makeKeyAndVisible()
        UIView.transition(with: window ?? UIWindow(),
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
}
