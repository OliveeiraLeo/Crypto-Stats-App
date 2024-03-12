//  WelcomeButton.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 12/03/24.

import UIKit
import Foundation
import ObjectiveC

protocol introButtonDelegate: AnyObject {
    func setupWelcomeButton()
}

class WelcomeButton: UIButton {
    
    var action:(() -> Void)?
    
    weak var delegate: introButtonDelegate?
    
    var navigationController: UINavigationController?
    
    func setupWelcomeButton() {
        var config = UIButton.Configuration.tinted()
        config.title = "Get Started"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .black
        
        configuration = config
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(welcomeAction), for: .touchUpInside)
    }
    
    @objc private func welcomeAction() {
        action?()
    }
    
    init() {
    super.init(frame: .zero)
        setupWelcomeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
