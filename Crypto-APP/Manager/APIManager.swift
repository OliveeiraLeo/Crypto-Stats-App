//  APIManager.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 06/03/24.

import Alamofire
import Foundation

class APIManager {
    
    func fetchCoinsInfo(completion: @escaping (Result<[CoinsInfo], Error>) -> Void) {
        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d%2C14d%2C30d%2C1y&locale=en"
        
        AF.request(url, method: .get).responseDecodable(of: [CoinsInfo].self) { response in
            switch response.result {
            case .success(let coinsInfoArray):
                print("Sucesso na request")
                completion(.success(coinsInfoArray))
            case .failure(let error):
                print("Alamofire Request Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
