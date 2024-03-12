//  FirstView.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 23/02/24.

import UIKit
import Foundation

class FirstView: UIView {
    
    lazy var refreshButton = RefreshButton()
    lazy var allCoinsButton = AllCoinsButton()
    lazy var myCoinsButtom = MyCoinsButton()
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ModBlue")
        return view
    }()
    
    private lazy var cryptoLabel: UILabel = {
        let label = UILabel()
        label.text = "CRYPTO STATS"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    lazy var CryptoCollectionView: UICollectionView = {
        let Layout = UICollectionViewFlowLayout()
        Layout.scrollDirection = .vertical
        Layout.itemSize = CGSize(width: 180, height: 150)
        Layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: Layout)
        collectionView.backgroundColor = .clear
        collectionView.layer.masksToBounds = true
        collectionView.layer.cornerRadius = 15
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CryptoCollectionViewCell.self, forCellWithReuseIdentifier: "CryptoCell")
        return collectionView
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
        addSubview(firstView)

        firstView.addSubview(cryptoLabel)
        firstView.addSubview(refreshButton)
        firstView.addSubview(allCoinsButton)
        firstView.addSubview(myCoinsButtom)
        firstView.addSubview(CryptoCollectionView)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: topAnchor),
            firstView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
        NSLayoutConstraint.activate([
            cryptoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            cryptoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cryptoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            cryptoLabel.heightAnchor.constraint(equalToConstant: 40)
        
        ])
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            refreshButton.heightAnchor.constraint(equalToConstant: 40),
            refreshButton.widthAnchor.constraint(equalToConstant: 40)
        
        ])
        NSLayoutConstraint.activate([
            allCoinsButton.topAnchor.constraint(equalTo: cryptoLabel.bottomAnchor, constant: 15),
            allCoinsButton.leadingAnchor.constraint(equalTo: cryptoLabel.leadingAnchor),
            allCoinsButton.heightAnchor.constraint(equalToConstant: 30),
            allCoinsButton.widthAnchor.constraint(equalToConstant: 105)
        
        ])
        NSLayoutConstraint.activate([
            myCoinsButtom.topAnchor.constraint(equalTo: cryptoLabel.bottomAnchor, constant: 15),
            myCoinsButtom.leadingAnchor.constraint(equalTo: allCoinsButton.leadingAnchor, constant: 115),
            myCoinsButtom.heightAnchor.constraint(equalToConstant: 30),
            myCoinsButtom.widthAnchor.constraint(equalToConstant: 105)
        
        ])
        NSLayoutConstraint.activate([
            CryptoCollectionView.topAnchor.constraint(equalTo: myCoinsButtom.bottomAnchor, constant: 15),
            CryptoCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            CryptoCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            CryptoCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
