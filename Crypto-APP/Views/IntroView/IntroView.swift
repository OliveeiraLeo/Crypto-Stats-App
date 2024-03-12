//  IntroView.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 12/03/24.

import UIKit
import Foundation

class IntroView: UIView {
    
    var navigationController: UINavigationController?
    
    let welcomeButton = WelcomeButton()
    
    private lazy var introView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ModColor")
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Crypto Stats"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pressButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Press the Button for Start"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(introView)
        
        introView.addSubview(welcomeLabel)
        introView.addSubview(pressButtonLabel)
        introView.addSubview(welcomeButton)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            introView.topAnchor.constraint(equalTo: topAnchor),
            introView.leadingAnchor.constraint(equalTo: leadingAnchor),
            introView.trailingAnchor.constraint(equalTo: trailingAnchor),
            introView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 400),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            pressButtonLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            pressButtonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pressButtonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pressButtonLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            welcomeButton.topAnchor.constraint(equalTo: pressButtonLabel.bottomAnchor, constant: 30),
            welcomeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            welcomeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}
