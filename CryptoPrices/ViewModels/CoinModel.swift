//
//  Models.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 3.09.22.
//

import Foundation

//struct SpreadSheetConstants {
//    enum Headers: String {
//        case name = "Name",
//             marketCap = "Market Cap",
//             price = "Price",
//             volume = "Volume (24h)",
//             circulatingSupply = "Circulating Supply",
//             last7days = "Last 7 Days",
//             change24h = "Change (24h)"
//    }
//
//}

// MARK: - Crypto
struct Crypto: Codable, Identifiable {
    let id: String
    let image: String
    let volume: Double?
    let price: Float?
    let symbol: String?
    let name: String?
    let marketCap: Double?
    let oneDay: Float?
    let sevenDay: Float?
    let circulatingSupply: Double?
    let athChangePrct: Float?
    let sparklineIn7D: SparklineIn7D?
    
    //let sparklineIn7D: SparklineIn7D?

    enum CodingKeys: String, CodingKey {
        case id
        case image
        case volume = "total_volume"
        case price = "current_price"
        case symbol
        case name
        case circulatingSupply = "circulating_supply"
        case marketCap = "market_cap"
        case oneDay = "price_change_percentage_24h_in_currency"
        case sevenDay = "price_change_percentage_7d_in_currency"
        case athChangePrct = "ath_change_percentage"
        case sparklineIn7D = "sparkline_in_7d"
        
        
    }
}



// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}


