import Foundation

class CryptoTableViewCellViewModel {
    
    let name: String
    let symbol: String
    let price: String
    let icon: String
    let marketCap: String
    let oneDayChangePct: String
    let sevenDayChangePct: String
    let circulatingSupply: String
    let volume: String
    let priceIn7D: [Double]?
    let ath: String
    var iconData: Data?
    var chartData: Data?
    
    init(name: String, symbol: String, icon: String, price: String, marketCap: String, oneDayChangePct
         : String, sevenDayChangePct: String, circulatingSupply: String, volume: String, priceIn7D: [Double]?, ath: String) {
        self.name = name
        self.symbol = symbol
        self.icon = icon
        self.marketCap = marketCap
        self.price = price
        self.oneDayChangePct = oneDayChangePct
        self.circulatingSupply = circulatingSupply
        self.volume = volume
        self.sevenDayChangePct = sevenDayChangePct
        self.priceIn7D = priceIn7D
        self.ath = ath
    }

}
