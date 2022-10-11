import Foundation

//CoinGecko Api info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 */
final class APICaller {
    
    static var shared = APICaller()
    
    private struct Constants {
        //COINGECKO CONST
        static let geckoURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=1h%2C24h%2C7d"
        static let geckoURLForChart = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    }
    private init() {}
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
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
}


