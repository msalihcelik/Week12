//
//  DashboardTabBarController.swift
//  Week12
//
//  Created by Mehmet Salih ÇELİK on 5.01.2022.
//

import Foundation
import UIKit
import TinyConstraints
import MobilliumBuilders

class DashboardTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let controllers = [createViewController(), createPageViewController()]
        self.viewControllers = controllers
    }
}

//MARK: - UITabBarControllerDelegate methods
extension DashboardTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "")")
        return true
    }
}

//MARK: - DashboardTabBarController methods
extension DashboardTabBarController {
    
    private func createViewController() -> UIViewController {
        let viewController = ViewController()
        let icon = UITabBarItem(title: "Register", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        viewController.tabBarItem = icon
        viewController.title = "Register"
        viewController.view.backgroundColor = .white
        return viewController
    }
    
    private func createPageViewController() -> UIViewController {
        let pageViewController = PageViewController()
        let icon = UITabBarItem(title: "Color", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book"))
        pageViewController.tabBarItem = icon
        pageViewController.title = "PageVC"
        return pageViewController
    }
}
