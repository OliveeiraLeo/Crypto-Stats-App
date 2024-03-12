//  WelcomeViewController.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 12/03/24.

import UIKit
import Foundation

class WelcomeViewController: UIViewController {
        
    let welcomeView = IntroView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        welcomeView.welcomeButton.action = welcomeAction
        welcomeView.navigationController = self.navigationController
        welcomeView.welcomeButton.navigationController = self.navigationController
    }
    
    private func welcomeAction() {
        print("Botão clicado!")
        let firstViewController = ViewController()
            navigationController?.pushViewController(firstViewController, animated: true)
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(welcomeView)
        welcomeView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        welcomeView.setConstraintsToParent(view)
    }
}
