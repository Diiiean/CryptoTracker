//
//  APICaller.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 2.09.22.
//

import Foundation

//CoinGecko Api info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 */
//CoinMarket APIKey

//953ee4cc-cbe0-401e-80d2-b779a9d3ada4
//Nomics
//https://api.nomics.com/v1/currencies/ticker?key=82a4a7455ff09e23db541c70f4e4e07e05205cf3
final class APICaller {
    
    static var shared = APICaller()
    
    private struct Constants {
        //NOMICS API CONST
        static let nomicsApiKey = "82a4a7455ff09e23db541c70f4e4e07e05205cf3"
        static let nomicsAssetsEndPoint = "https://api.nomics.com/v1/currencies/"
        //COINAPI CONST
        static let iconsApiKey = "EF5F03FE-488C-4533-9BA9-77A2270F11AF"
        static let iconsEndPoint = "https://rest.coinapi.io/v1/assets/icons/"
        static let iconsSize = "30/"
        //COINGECKO CONST
        static let geckoURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d"
        static let geckoURLForChart = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
       
       
      
        
        
    }
    private init() {
        
    }
   
   
    


    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        
//        guard let url = URL(string: Constants.assetsEndPoint + "ticker?key=" + Constants.apiKey + "&ranks=1&interval=1d,30d&convert=USD&per-page=10&page=1") else {
//            return
//        }
        guard let url = URL(string: Constants.geckoURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(jsonResult.sorted { first, second -> Bool in
                    return first.price ?? 0 > second.price ?? 0
                }))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
  
    
//    public func getpriceArrayIn7D(completion: @escaping (Result<[PricesIn7D], Error>) -> Void) {
//        guard let url = URL(string: Constants.geckoURL) else { return }
//            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//                guard let data = data, error == nil else {
//                    return
//                }
//                do {
//                    //Decode responce
//                    let pricesIn7D = try JSONDecoder().decode([PricesIn7D].self, from: data)
//                    completion(.success(pricesIn7D))
//
//
//                } catch {
//                    completion(.failure(error))
//                    //print(error)
//                }
//            }
//
//            task.resume()
//    }
 
    
    
    }


