//  ViewController.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 23/02/24.

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    let firstView = FirstView()
    let apiManager = APIManager()
    var coinData: [CoinsInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        firstView.navigationController = self.navigationController
        firstView.CryptoCollectionView.dataSource = self
        firstView.CryptoCollectionView.delegate = self
        firstView.CryptoCollectionView.isUserInteractionEnabled = true
    
        apiManager.fetchCoinsInfo { result in
            switch result {
            case .success(let coinsInfoArray):
                print("Success fetching coins info")
                self.coinData = coinsInfoArray
                self.firstView.CryptoCollectionView.reloadData()
            case .failure(let error):
                print("Error fetching coins info: \(error.localizedDescription)")
            }
        }
    }

    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        firstView.setConstraintsToParent(view)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoCollectionViewCell.identifier, for: indexPath) as! CryptoCollectionViewCell
        
        let coin = coinData[indexPath.item]
        
        DispatchQueue.main.async {
            if let imageURL = URL(string: coin.image) {
                cell.iconImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
            } else {
                cell.iconImageView.image = UIImage(named: "placeholder")
            }
        }

        cell.CvloadData(name: coin.symbol.uppercased(), icon: UIImage(named: "placeholder"), value: "\(coin.currentPrice.formatAsCurrency())")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < coinData.count else { return }
        
        let selectedCoinInfo = coinData[indexPath.item]
        let nextView = SecondViewController()
        nextView.selectedCoinInfo = selectedCoinInfo
        navigationController?.pushViewController(nextView, animated: true)
    }
}

