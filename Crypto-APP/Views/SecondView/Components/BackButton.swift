//  backButton.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 10/03/24.

import UIKit
import Foundation

class BackButton: UIButton {
    
    var navigationController: UINavigationController?
    
    func setupBackButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(named: "backButton"), for: .normal)
        addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    init() {
    super.init(frame: .zero)
        setupBackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
