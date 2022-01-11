//
//  PageViewController.swift
//  Week12
//
//  Created by Mehmet Salih ÇELİK on 4.01.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

class PageViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private var views = [CustomViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        self.presentPageVC()
    }
    
    private func configureContents() {
        views.append(CustomViewController(bgcolor: .red, text: "1. ViewController"))
        views.append(CustomViewController(bgcolor: .blue, text: "2. ViewController"))
        views.append(CustomViewController(bgcolor: .yellow, text: "3. ViewController"))
        views.append(CustomViewController(bgcolor: .darkGray, text: "4. ViewController"))
    }
    
    private func presentPageVC() {
        guard let first = views.first else { return }
        
        let pageVC = UIPageViewController(transitionStyle: .pageCurl,
                                          navigationOrientation: .horizontal,
                                          options: nil)
        pageVC.delegate = self
        pageVC.dataSource = self
        pageVC.setViewControllers([first],
                                  direction: .forward,
                                  animated: true,
                                  completion: nil)
        self.addChild(pageVC)
        self.view.addSubview(pageVC.view)
    }
}

//MARK: - UIPageViewControllerDataSource Methods
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = views.firstIndex(of: viewController as! CustomViewController), index > 0 else { return nil }
        let before = index - 1
        return views[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = views.firstIndex(of: viewController as! CustomViewController), index < (views.count - 1) else { return nil }
        let after = index + 1
        return views[after]
    }
}
