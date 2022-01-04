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
        
        let item1 = ViewController()
        let item2 = PageViewController()
        let icon1 = UITabBarItem(title: "Register", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        let icon2 = UITabBarItem(title: "Color", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book"))
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        let controllers = [item1, item2]
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
