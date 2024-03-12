//  APIModel.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 06/03/24.

import SDWebImage
import Foundation

// MARK: - CoinsInfo

struct CoinsInfo: Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double
    let sparklineIn7D: SparklineIn7D
    let priceChangePercentage14DInCurrency, priceChangePercentage1HInCurrency: Double
    let priceChangePercentage1YInCurrency: Double?
    let priceChangePercentage24HInCurrency: Double
    let priceChangePercentage30DInCurrency: Double?
    let priceChangePercentage7DInCurrency: Double

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage14DInCurrency = "price_change_percentage_14d_in_currency"
        case priceChangePercentage1HInCurrency = "price_change_percentage_1h_in_currency"
        case priceChangePercentage1YInCurrency = "price_change_percentage_1y_in_currency"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case priceChangePercentage30DInCurrency = "price_change_percentage_30d_in_currency"
        case priceChangePercentage7DInCurrency = "price_change_percentage_7d_in_currency"
    }
}

enum Currency: String, Codable {
    case btc = "btc"
    case eth = "eth"
    case usd = "usd"
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]
}

