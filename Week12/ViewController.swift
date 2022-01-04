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
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(20)
        .distribution(.fill)
        .alignment(.fill)
        .build()
    
    private let nickTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nick"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let retypePasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "RetypePassword"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("Register", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let registerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        self.view.backgroundColor = .white
    }
    
    private func addSubView() {
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

