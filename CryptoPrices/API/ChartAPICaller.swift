//
//  ChartAPICaller.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 16.09.22.
//

//import Foundation
// class ChartAPICaller {
//    //static var shared = ChartAPICaller()
//
//    func getData(completion: @escaping (Result<[PricesIn7D], Error>) -> Void) {
//        let link = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
//        guard let url = URL(string: link) else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let data = data {
//                let element = try! JSONDecoder().decode([PricesIn7D].self, from: data)
//                completion(.success(element))
//
//            } else {
//                completion(.failure(error!))
//            }
//        }.resume()
//    }
//}
