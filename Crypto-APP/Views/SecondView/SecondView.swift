//  SecondView.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 08/03/24.

import UIKit
import Foundation

class SecondView: UIView {
    
    var navigationController: UINavigationController?
    
    lazy var backButton = BackButton()
    lazy var coinGraphic = CoinGraphic()
    lazy var coinMarketView = CoinMarketView()
    lazy var priceChangesView = PriceChangesView()
    
    private lazy var secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ModColor")
        return view
    }()
    
    private lazy var coinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var graphicLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Seven Days"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today Prices"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceChangeLabel: UILabel = {
        let label = UILabel()
        label.text = "Price Changes"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .white
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
    
    func loadData(data: [CoinsInfo] = []) {
        guard let coinInfo = data.first else {
            return
    }
        symbolLabel.text = coinInfo.symbol.uppercased()
        coinLabel.text = coinInfo.name.uppercased()
        coinGraphic.setupSparklineWithCoinsInfo(coinInfo)
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
        setDetails()
    }
    
    private func setHierarchy() {
        addSubview(secondView)
        
        secondView.addSubview(coinLabel)
        secondView.addSubview(symbolLabel)
        secondView.addSubview(backButton)
        secondView.addSubview(coinMarketView)
        secondView.addSubview(graphicLabel)
        secondView.addSubview(coinGraphic)
        secondView.addSubview(todayLabel)
        secondView.addSubview(priceChangeLabel)
        secondView.addSubview(priceChangesView)
    }
    
    private func setConstraints() {
        
        
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: topAnchor),
            secondView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            coinLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            coinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            coinLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            coinLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: coinLabel.bottomAnchor, constant: 5),
            symbolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            symbolLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            symbolLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: coinLabel.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            graphicLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 15),
            graphicLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            graphicLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            graphicLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            coinGraphic.topAnchor.constraint(equalTo: graphicLabel.bottomAnchor, constant: 15),
            coinGraphic.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coinGraphic.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            coinGraphic.heightAnchor.constraint(equalToConstant: 430)
        ])
        
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: coinGraphic.bottomAnchor, constant: 15),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            todayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            todayLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            coinMarketView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 15),
            coinMarketView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coinMarketView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            coinMarketView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            priceChangeLabel.topAnchor.constraint(equalTo: coinMarketView.bottomAnchor, constant: 15),
            priceChangeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            priceChangeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            priceChangeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            priceChangesView.topAnchor.constraint(equalTo: priceChangeLabel.bottomAnchor, constant: 15),
            priceChangesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceChangesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            priceChangesView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func setDetails() {
        coinMarketView.backgroundColor = .white
        coinMarketView.layer.cornerRadius = 10
        coinMarketView.layer.masksToBounds = true
        coinMarketView.translatesAutoresizingMaskIntoConstraints = false
        
        coinGraphic.backgroundColor = .white
        coinGraphic.layer.cornerRadius = 10
        coinGraphic.layer.masksToBounds = true
        coinGraphic.translatesAutoresizingMaskIntoConstraints = false
        
        priceChangesView.backgroundColor = .white
        priceChangesView.layer.cornerRadius = 10
        priceChangesView.layer.masksToBounds = true
        priceChangesView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
