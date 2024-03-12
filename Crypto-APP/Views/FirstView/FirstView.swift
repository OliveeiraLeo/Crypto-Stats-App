//  FirstView.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 23/02/24.

import UIKit
import Foundation

class FirstView: UIView {
    
    var navigationController: UINavigationController?

    private lazy var firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "ModColor")
        return view
    }()
    
    private lazy var cryptoLabel: UILabel = {
        let label = UILabel()
        label.text = "CRYPTO STATS"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a Coin for More Details"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        firstView.addSubview(detailsLabel)
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
            cryptoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            cryptoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            cryptoLabel.heightAnchor.constraint(equalToConstant: 40)
        
        ])
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: cryptoLabel.bottomAnchor, constant: 15),
            detailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            detailsLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        NSLayoutConstraint.activate([
            CryptoCollectionView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 10),
            CryptoCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            CryptoCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            CryptoCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
