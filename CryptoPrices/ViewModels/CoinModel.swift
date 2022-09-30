//
//  Models.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 3.09.22.
//

import Foundation

struct SpreadSheetConstants {
    enum Headers: String {
        case name = "Name",
             marketCap = "Market Cap",
             price = "Price",
             volume = "Volume (24h)",
             circulatingSupply = "Circulating Supply",
             last7days = "Last 7 Days",
             change24h = "Change (24h)"
    }

}

// MARK: - Crypto
struct Crypto: Codable, Identifiable {
    let id: String
    
    let currency: String?
    let price: String?
    let symbol: String?
    let name: String?
    let marketCap: String?
    let oneDay: OneDayChanges?
    let sevenDay: SevenDayChanges?
    let circulatingSupply: String?
    let priceChangePercentage24HInCurrency: Double?
    //let sparklineIn7D: SparklineIn7D?

    enum CodingKeys: String, CodingKey {
        case id
        case currency
        case price
        case symbol
        case name
        case circulatingSupply = "circulating_supply"
        case marketCap = "market_cap"
        case oneDay = "1d"
        case sevenDay = "7d"
        //case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        
    }
}

struct PricesIn7D: Codable {
    let id: String
    let name: String
    let athChangePrct: Float
    let sparklineIn7D: SparklineIn7D?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sparklineIn7D = "sparkline_in_7d"
        case athChangePrct = "ath_change_percentage"
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}

// MARK: - OneDayChanges
struct OneDayChanges: Codable {
    let priceChangePct: String
    let volume: String
    enum CodingKeys: String, CodingKey {
        case priceChangePct = "price_change_pct"
        case volume
    }
}

// MARK: - SevenDayChanges
struct SevenDayChanges: Codable {
    let priceChangePct: String
    
    enum CodingKeys: String, CodingKey {
        case priceChangePct = "price_change_pct"
    }
}



// MARK: - Icon
struct Icon: Codable {
    let asset_id: String
    let url: String
}
