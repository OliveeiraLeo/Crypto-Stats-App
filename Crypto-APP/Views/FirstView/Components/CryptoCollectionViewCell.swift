//  CryptoCollectionViewCell.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 05/03/24.

import UIKit
import Foundation

class CryptoCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "CryptoCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ iconImageView, coinLabel, valueLabel])
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 10
        stackView.alignment = .center
        stackView.layer.borderColor = .none
        stackView.backgroundColor = .white
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var coinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func CvloadData(name: String?, icon: UIImage?, value: String?) {
         coinLabel.text = name
         iconImageView.image = icon
         valueLabel.text = value
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(stackView)
    }
    
    private func setConstraints() {
        
        stackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 55)
        ])
        NSLayoutConstraint.activate([
            coinLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            valueLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
