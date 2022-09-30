//
//  ChartModel.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 11.09.22.
//

import Foundation

class ChartModel {
    //static var shared = CryptoTableViewCellViewModel()
    
//let name: String
//    let symbol: String
//    let price: String
//    let iconURL: URL?
//    let marketCap: String
//    let oneDayChangePct: String
//    let sevenDayChangePct: String
//    let circulatingSupply: String
//    let volume: String
    let priceIn7D: [Double]?
   // var iconData: Data? = nil
    
    
    init(priceIn7D: [Double]) {
      //  self.name = name
        self.priceIn7D = priceIn7D
        //self.iconData = iconData
    }

}
