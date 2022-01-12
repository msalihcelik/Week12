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
    
    private var viewControllers = [CustomViewController]()
    private var currentPageIndex = 0
    private var pageVC = UIPageViewController()
    
    private let redColorLabel = UILabelBuilder()
        .isUserInteractionEnabled(true)
        .text("One Tap")
        .cornerRadius(5)
        .borderColor(UIColor.black.cgColor)
        .borderWidth(2)
        .backgroundColor(.systemGray4)
        .clipsToBounds(true)
        .textAlignment(.center)
        .build()
    
    private let whiteColorLabel = UILabelBuilder()
        .isUserInteractionEnabled(true)
        .text("Double Tap")
        .cornerRadius(5)
        .borderColor(UIColor.black.cgColor)
        .borderWidth(2)
        .backgroundColor(.systemGray4)
        .clipsToBounds(true)
        .textAlignment(.center)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        configurePageViewController()
        addSubViews()
    }
    
    private func configureContents() {
        viewControllers.append(CustomViewController(bgcolor: .red, text: "1. ViewController"))
        viewControllers.append(CustomViewController(bgcolor: .blue, text: "2. ViewController"))
        viewControllers.append(CustomViewController(bgcolor: .yellow, text: "3. ViewController"))
        viewControllers.append(CustomViewController(bgcolor: .darkGray, text: "4. ViewController"))
        gestureLabelOneTap()
        gestureLabelDoubleTap()
    }
    
    private func configurePageViewController() {
        guard let first = viewControllers.first else { return }
        
        let tempPageVC = UIPageViewController(transitionStyle: .pageCurl,
                                          navigationOrientation: .horizontal,
                                            options: nil)
        tempPageVC.delegate = self
        tempPageVC.dataSource = self
        tempPageVC.setViewControllers([first],
                                  direction: .forward,
                                  animated: true,
                                  completion: nil)
        pageVC = tempPageVC
    }
    
    private func addSubViews() {
        addChild(pageVC)
        
        view.addSubview(pageVC.view)
        pageVC.view.edgesToSuperview()
        
        view.addSubview(redColorLabel)
        redColorLabel.centerXToSuperview()
        redColorLabel.bottomToSuperview().constant = -250
        redColorLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .left(100) + .right(100), usingSafeArea: true)
        
        view.addSubview(whiteColorLabel)
        whiteColorLabel.centerXToSuperview()
        whiteColorLabel.topToBottom(of: redColorLabel, offset: 10)
        whiteColorLabel.width(to: redColorLabel)
    }
    
    private func gestureLabelOneTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didOneTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        redColorLabel.addGestureRecognizer(tapGesture)
    }
    
    private func gestureLabelDoubleTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        tapGesture.numberOfTapsRequired = 2
        whiteColorLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didOneTap(_ gesture: UIGestureRecognizer) {
        viewControllers[currentPageIndex].view.backgroundColor = .red
    }
    
    @objc
    private func didDoubleTap(_ gesture: UIGestureRecognizer) {
        viewControllers[currentPageIndex].view.backgroundColor = .white
    }
}

//MARK: - UIPageViewControllerDataSource Methods
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController as! CustomViewController), index > 0 else { return nil }
        let before = index - 1
        return viewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController as! CustomViewController), index < (viewControllers.count - 1) else { return nil }
        let after = index + 1
        return viewControllers[after]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first as? CustomViewController,
              let index = viewControllers.firstIndex(of: currentVC) else { return }
        currentPageIndex = index
    }
}
