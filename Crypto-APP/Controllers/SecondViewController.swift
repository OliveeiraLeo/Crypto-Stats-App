//  SecondViewController.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 08/03/24.

import UIKit
import Foundation

class SecondViewController: UIViewController {
    
    var selectedCoinInfo: CoinsInfo?
    let secondView = SecondView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    
        if let coinInfo = selectedCoinInfo {
            secondView.loadData(data: [coinInfo])
            secondView.coinMarketView.loadData(marketData: [coinInfo])
            secondView.priceChangesView.loadData(changeData: [coinInfo])
        }
        
        secondView.navigationController = self.navigationController
        secondView.backButton.navigationController = self.navigationController
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        secondView.setConstraintsToParent(view)
    }
}

