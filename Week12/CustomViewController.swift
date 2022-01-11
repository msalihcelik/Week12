//
//  CustomViewController.swift
//  Week12
//
//  Created by Mehmet Salih ÇELİK on 7.01.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

class CustomViewController: UIViewController {
    
    private let myLabel = UILabelBuilder()
        .textColor(.black)
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    
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
    
    init(bgcolor: UIColor, text: String) {
        self.myLabel.text = text
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = bgcolor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        gestureLabelOneTap()
        gestureLabelDoubleTap()
    }
    
    func addSubViews() {
        view.addSubview(myLabel)
        myLabel.centerXToSuperview()
        myLabel.centerYToSuperview()
        myLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .init(top: 0, left: 100, bottom: 0, right: 100), isActive: true, usingSafeArea: true)
        
        view.addSubview(redColorLabel)
        redColorLabel.centerXToSuperview()
        redColorLabel.topToBottom(of: myLabel, offset: 10, relation: .equalOrGreater, priority: .defaultHigh, isActive: true)
        redColorLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        redColorLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .left(100) + .right(100), isActive: true, usingSafeArea: true)
        
        view.addSubview(whiteColorLabel)
        whiteColorLabel.centerXToSuperview()
        whiteColorLabel.topToBottom(of: redColorLabel, offset: 10, relation: .equal, priority: .required, isActive: true)
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
        view.backgroundColor = .red
    }
    
    @objc
    private func didDoubleTap(_ gesture: UIGestureRecognizer) {
        view.backgroundColor = .white
    }
}
