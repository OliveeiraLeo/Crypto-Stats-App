//  Core+Extensions.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 23/02/24.

import UIKit

extension UIView {
    
func setConstraintsToParent(_ parent: UIView) {
    NSLayoutConstraint.activate([
        self.topAnchor.constraint(equalTo: parent.topAnchor),
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
            
    ])
  }
}
