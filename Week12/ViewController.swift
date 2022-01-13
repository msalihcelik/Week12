//
//  ViewController.swift
//  Week12
//
//  Created by Mehmet Salih ÇELİK on 27.12.2021.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

class ViewController: UIViewController {
    
    private let scrollView = UIScrollViewBuilder()
        .bounces(true)
        .build()
    
    private let contentView = UIViewBuilder().build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(20)
        .distribution(.fill)
        .alignment(.fill)
        .build()
    
    private let nickTextField = UITextFieldBuilder()
        .placeholder("Nick")
        .build()
    
    private let nameTextField = UITextFieldBuilder()
        .placeholder("Name")
        .build()
    
    private let surnameTextField = UITextFieldBuilder()
        .placeholder("Surname")
        .build()
    
    private let passwordTextField = UITextFieldBuilder()
        .placeholder("Password")
        .build()
    
    private let retypePasswordTextField = UITextFieldBuilder()
        .placeholder("RetypePassword")
        .build()
    
    private let registerButton = UIButtonBuilder()
        .title("Register")
        .titleColor(.gray)
        .borderColor(UIColor.black.cgColor)
        .borderWidth(1)
        .titleColor(.black)
        .build()
    
    private let registerStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .alignment(.fill)
        .distribution(.fill)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom, insets: .top(50), usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .left(20) + .right(20))
        contentStackView.addArrangedSubview(nickTextField)
        contentStackView.addArrangedSubview(nameTextField)
        contentStackView.addArrangedSubview(surnameTextField)
        contentStackView.addArrangedSubview(passwordTextField)
        contentStackView.addArrangedSubview(retypePasswordTextField)
        
        self.view.addSubview(registerButton)
        registerButton.topToBottom(of: scrollView).constant = 20
        registerButton.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 20, right: 20), usingSafeArea: true)
    }
}

