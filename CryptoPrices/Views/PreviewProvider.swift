//
//  PreviewProvider.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 17.09.22.
//
//import Foundation
//import SwiftUI
//
//
//extension PreviewProvider {
//    static var dev: DeveloperPreview {
//        return DeveloperPreview.instance
//    }
//}
//class DeveloperPreview {
//    static let instance = DeveloperPreview()
//    private var viewModels = [CryptoTableViewCellViewModel]()
//    private var chartModels = [ChartModel]()
//    private init() {}
//    
//    APICaller.shared.getpriceArrayIn7D(completion: <#T##(Result<[PricesIn7D], Error>) -> Void#>) { [weak self] result in
//        switch result {
//        case .success(let models):
//            self?.viewModels = models.compactMap({ model in
//                //  NUMBER FORMATTER price
//                let price = Float(model.price ?? "0.0")
//                let priceString = price?.asCurrencyWithFormatter()
//                //  NUMBER FORMATTER market cap
//                let marketCap = Double(model.marketCap ?? "0.00")
//                let marketCapString = marketCap?.asCurrencyWithFormatter()
//                // Percent formatter for 1d
//                let oneDayChangePct = Float(model.oneDay?.priceChangePct ?? "0.00%")
//                let oneDayPctString = oneDayChangePct?.asPctChangesWithFormatter()
//                // Percent formatter for 7d
//                let sevenDaysChangePct = Float(model.sevenDay?.priceChangePct ?? "0.00%")
//                let sevenDaysPctString = sevenDaysChangePct?.asPctChangesWithFormatter()
//                let iconURL = URL(
//                    string:
//                        APICaller.shared.icons.filter { icon in
//                        icon.asset_id == model.id
//                    }.first?.url ?? "")
//                let pricesIn7D = APICaller.shared.pricesIn7D.filter { price in
//                    
//                    price.name == model.name
//                }.first?.sparklineIn7D?.price ?? []
//                
//                ChartData.shared.priceIn7D = pricesIn7D
////                    let pricesArray: [Double] = pricesIn7D.compactMap { price in
////
////                        return price.sparklineIn7D?.price
////
////                    }
//                
//               
//                return ChartModel(priceIn7D: pricesIn7D)
//              
//                
//                
//            })
//          
//        case .failure(let error):
//            print("error no response + \(error)")
//            
//        }
//    }
//}
    
//    private func fetchData() {
//         APICaller.shared.getAllCryptoData { [weak self] result in
//            switch result {
//            case .success(let models):
//                self?.viewModels = models.compactMap({ model in
//                    //  NUMBER FORMATTER price
//                    let price = Float(model.price ?? "0.0")
//                    let priceString = price?.asCurrencyWithFormatter()
//                    //  NUMBER FORMATTER market cap
//                    let marketCap = Double(model.marketCap ?? "0.00")
//                    let marketCapString = marketCap?.asCurrencyWithFormatter()
//                    // Percent formatter for 1d
//                    let oneDayChangePct = Float(model.oneDay?.priceChangePct ?? "0.00%")
//                    let oneDayPctString = oneDayChangePct?.asPctChangesWithFormatter()
//                    // Percent formatter for 7d
//                    let sevenDaysChangePct = Float(model.sevenDay?.priceChangePct ?? "0.00%")
//                    let sevenDaysPctString = sevenDaysChangePct?.asPctChangesWithFormatter()
//                    let iconURL = URL(
//                        string:
//                            APICaller.shared.icons.filter { icon in
//                            icon.asset_id == model.id
//                        }.first?.url ?? "")
//                    let pricesIn7D = APICaller.shared.pricesIn7D.filter { price in
//
//                        price.name == model.name
//                    }.first?.sparklineIn7D?.price ?? []
//
//                    ChartData.shared.priceIn7D = pricesIn7D
////                    let pricesArray: [Double] = pricesIn7D.compactMap { price in
////
////                        return price.sparklineIn7D?.price
////
////                    }
//
//                    //print("pricesIn7D############: \(pricesIn7D)")
//                    return CryptoTableViewCellViewModel(name: model.name ?? "N/A",
//                                                        symbol: model.symbol ?? "", iconURL: iconURL,
//                                                        price: priceString ?? "N/A",
//                                                        marketCap: marketCapString ?? "N/A", oneDayChangePct: oneDayPctString ?? "N/A", sevenDayChangePct: sevenDaysPctString ?? "N/A", circulatingSupply: model.circulatingSupply ?? "N/A", volume: model.oneDay?.volume ?? "N/A", priceIn7D: pricesIn7D)
//
//
//
//                })
//
//            case .failure(let error):
//                print("error no response + \(error)")
//
//            }
 //       }
   // }

