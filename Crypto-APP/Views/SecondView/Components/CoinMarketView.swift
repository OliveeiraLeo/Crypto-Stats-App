//  CoinMarketView.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 08/03/24.

import UIKit
import Foundation

class CoinMarketView: UIView {
    
    private lazy var coinView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var currentValue: UILabel = {
        let label = UILabel()
        label.text = "Current"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coinValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var highLabel: UILabel = {
        let label = UILabel()
        label.text = "High"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var highValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lowValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
    
    func loadData(marketData: [CoinsInfo] = []) {

        guard let coinInfo = marketData.first else {
            return
        }

        highValueLabel.text = "\(coinInfo.high24H.formatAsCurrency())"
        lowValueLabel.text = "\(coinInfo.low24H.formatAsCurrency())"
        coinValue.text = "\(coinInfo.currentPrice.formatAsCurrency())"
    }

    
    private func setupView() {
        setHierarchy()
        setConstraints()
      
    }
    
    private func setHierarchy() {
        addSubview(coinView)
        
        coinView.addSubview(currentValue)
        coinView.addSubview(coinValue)
        
        coinView.addSubview(highLabel)
        coinView.addSubview(lowLabel)
        coinView.addSubview(highValueLabel)
        coinView.addSubview(lowValueLabel)
    
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            currentValue.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            currentValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130),
            currentValue.widthAnchor.constraint(equalToConstant: 130),
            currentValue.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            coinValue.topAnchor.constraint(equalTo: highLabel.bottomAnchor, constant: 3),
            coinValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130),
            coinValue.widthAnchor.constraint(equalToConstant: 130),
            coinValue.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            highLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            highLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            highLabel.widthAnchor.constraint(equalToConstant: 115),
            highLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            highValueLabel.topAnchor.constraint(equalTo: currentValue.bottomAnchor, constant: 3),
            highValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            highValueLabel.widthAnchor.constraint(equalToConstant: 115),
            highValueLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lowLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            lowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            lowLabel.widthAnchor.constraint(equalToConstant: 115),
            lowLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            lowValueLabel.topAnchor.constraint(equalTo: lowLabel.bottomAnchor, constant: 3),
            lowValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            lowValueLabel.widthAnchor.constraint(equalToConstant: 115),
            lowValueLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
