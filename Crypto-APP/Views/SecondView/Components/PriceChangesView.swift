//  PriceChangesView.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 11/03/24.

import UIKit
import Foundation

class PriceChangesView: UIView {
    
    private lazy var changesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var hourChange: UILabel = {
        let label = UILabel()
        label.text = "1 Hour"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hourChangeValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dayChange: UILabel = {
        let label = UILabel()
        label.text = "1 Day"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dayChangeValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weekChange: UILabel = {
        let label = UILabel()
        label.text = "7 Days"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weekChangeValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var twoWeeksChange: UILabel = {
        let label = UILabel()
        label.text = "14 Days"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var twoWeeksChangeValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var monthChange: UILabel = {
        let label = UILabel()
        label.text = "30 Days "
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var monthChangeValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearChange: UILabel = {
        let label = UILabel()
        label.text = "365 Days"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearChangeValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
    
    func loadData(changeData: [CoinsInfo] = []) {
        guard let coinInfo = changeData.first else {
            return
        }

        hourChangeValue.text = "\(Int(coinInfo.priceChangePercentage1HInCurrency))%"
        dayChangeValue.text = "\(Int(coinInfo.priceChangePercentage24HInCurrency))%"
        weekChangeValue.text = "\(Int(coinInfo.priceChangePercentage7DInCurrency))%"
        twoWeeksChangeValue.text = "\(Int(coinInfo.priceChangePercentage14DInCurrency))%"
        
        if let monthChangePercentage30D = coinInfo.priceChangePercentage30DInCurrency {
            let roundedValue = Int(round(monthChangePercentage30D))
            monthChangeValue.text = "\(roundedValue)%"
        } else {
            monthChangeValue.text = "N/A"
        }

        if let yearChangePercentage1Y = coinInfo.priceChangePercentage1YInCurrency {
            let roundedValue = Int(round(yearChangePercentage1Y))
            yearChangeValue.text = "\(roundedValue)%"
        } else {
            yearChangeValue.text = "N/A"
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(changesView)
        
        changesView.addSubview(hourChange)
        changesView.addSubview(hourChangeValue)
        changesView.addSubview(dayChange)
        changesView.addSubview(dayChangeValue)
        changesView.addSubview(weekChange)
        changesView.addSubview(weekChangeValue)
        
        changesView.addSubview(twoWeeksChange)
        changesView.addSubview(twoWeeksChangeValue)
        changesView.addSubview(monthChange)
        changesView.addSubview(monthChangeValue)
        changesView.addSubview(yearChange)
        changesView.addSubview(yearChangeValue)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            hourChange.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hourChange.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hourChange.widthAnchor.constraint(equalToConstant: 80),
            hourChange.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            hourChangeValue.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hourChangeValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            hourChangeValue.widthAnchor.constraint(equalToConstant: 80),
            hourChangeValue.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            dayChange.topAnchor.constraint(equalTo: hourChange.bottomAnchor, constant: 5),
            dayChange.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dayChange.widthAnchor.constraint(equalToConstant: 80),
            dayChange.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            dayChangeValue.topAnchor.constraint(equalTo: hourChangeValue.bottomAnchor, constant: 5),
            dayChangeValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            dayChangeValue.widthAnchor.constraint(equalToConstant: 80),
            dayChangeValue.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            weekChange.topAnchor.constraint(equalTo: dayChange.bottomAnchor, constant: 5),
            weekChange.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weekChange.widthAnchor.constraint(equalToConstant: 80),
            weekChange.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            weekChangeValue.topAnchor.constraint(equalTo: dayChangeValue.bottomAnchor, constant: 5),
            weekChangeValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            weekChangeValue.widthAnchor.constraint(equalToConstant: 80),
            weekChangeValue.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            twoWeeksChange.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            twoWeeksChange.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            twoWeeksChange.widthAnchor.constraint(equalToConstant: 80),
            twoWeeksChange.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            twoWeeksChangeValue.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            twoWeeksChangeValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            twoWeeksChangeValue.widthAnchor.constraint(equalToConstant: 80),
            twoWeeksChangeValue.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            monthChange.topAnchor.constraint(equalTo: twoWeeksChange.bottomAnchor, constant: 5),
            monthChange.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            monthChange.widthAnchor.constraint(equalToConstant: 80),
            monthChange.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            monthChangeValue.topAnchor.constraint(equalTo: twoWeeksChangeValue.bottomAnchor, constant: 5),
            monthChangeValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            monthChangeValue.widthAnchor.constraint(equalToConstant: 80),
            monthChangeValue.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            yearChange.topAnchor.constraint(equalTo: monthChange.bottomAnchor, constant: 5),
            yearChange.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            yearChange.widthAnchor.constraint(equalToConstant: 80),
            yearChange.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        NSLayoutConstraint.activate([
            yearChangeValue.topAnchor.constraint(equalTo: monthChangeValue.bottomAnchor, constant: 5),
            yearChangeValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            yearChangeValue.widthAnchor.constraint(equalToConstant: 80),
            yearChangeValue.heightAnchor.constraint(equalToConstant: 20)
        
        ])
    }
}
