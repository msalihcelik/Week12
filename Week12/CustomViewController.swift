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
    }
    
    func addSubViews() {
        view.addSubview(myLabel)
        myLabel.centerXToSuperview()
        myLabel.centerYToSuperview()
        myLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .init(top: 0, left: 100, bottom: 0, right: 100), isActive: true, usingSafeArea: true)
    }
}
