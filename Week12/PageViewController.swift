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
    
    lazy var view0: UIView = {
        let view = UIViewBuilder()
            .backgroundColor(.red)
            .build()
        let label = UILabelBuilder()
            .text("Page 1")
            .textAlignment(.center)
            .build()
        view.addSubview(label)
        label.edgesToSuperview()
        return view
    }()
    
    lazy var view1: UIView = {
        let view = UIViewBuilder()
            .backgroundColor(.blue)
            .build()
        let label = UILabelBuilder()
            .text("Page 2")
            .textAlignment(.center)
            .build()
        view.addSubview(label)
        label.edgesToSuperview()
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIViewBuilder()
            .backgroundColor(.yellow)
            .build()
        let label = UILabelBuilder()
            .text("Page 3")
            .textAlignment(.center)
            .build()
        view.addSubview(label)
        label.edgesToSuperview()
        return view
    }()
    
    lazy var button: UILabel = {
        let button = UILabelBuilder()
            .text("One Tap")
            .backgroundColor(.white)
            .cornerRadius(5)
            .borderColor(UIColor.black.cgColor)
            .borderWidth(2)
            .textAlignment(.center)
            .masksToBounds(true)
            .build()
        return button
    }()
    
    lazy var buttonDouble: UILabel = {
        let button = UILabelBuilder()
            .text("Double Tap")
            .backgroundColor(.white)
            .cornerRadius(5)
            .borderColor(UIColor.black.cgColor)
            .borderWidth(2)
            .textAlignment(.center)
            .masksToBounds(true)
            .build()
        return button
    }()
    
    lazy var views = [view0, view1, view2]
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
    }
    
    private func addSubView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
        scrollView.widthToSuperview()
        
        scrollView.addSubview(button)
        button.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 50, bottom: 100, right: 50), isActive: true, usingSafeArea: true)
        
        scrollView.addSubview(buttonDouble)
        buttonDouble.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 50, bottom: 50, right: 50), isActive: true, usingSafeArea: true)
        
        gestureLabelOneTapped()
        gestureLabelDoubleTapped()
    }
    
    private func gestureLabelOneTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didOneTap(_:)))
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 1
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(tapGesture)
    }
    
    private func gestureLabelDoubleTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 2
        buttonDouble.isUserInteractionEnabled = true
        buttonDouble.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didOneTap(_ gesture: UIGestureRecognizer) {
        views[Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))].backgroundColor = .red
    }
    
    @objc
    private func didDoubleTap(_ gesture: UIGestureRecognizer) {
        views[Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))].backgroundColor = .white
    }
}

extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}

//MARK: - UIPageViewControllerDataSource Methods
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}
