//
//  ViewController.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 1.09.22.
//

import UIKit
import SpreadsheetView
class ViewController: UIViewController {

    private let spreadsheetView: SpreadsheetView = {
        let spreadsheetView = SpreadsheetView()
        spreadsheetView.backgroundColor = .systemBackground
        spreadsheetView.gridStyle = .solid(width: 1, color: .black)
        //Cells register
        spreadsheetView.register(ColumnHeaderCell.self,
                                 forCellWithReuseIdentifier: ColumnHeaderCell.identifier)
        spreadsheetView.register(CryptoNameCell.self,
                                 forCellWithReuseIdentifier: CryptoNameCell.identifier)
        spreadsheetView.register(CryptoPriceCell.self, forCellWithReuseIdentifier: CryptoPriceCell.identifier)
        spreadsheetView.register(MarketCapCell.self, forCellWithReuseIdentifier: MarketCapCell.identifier)
        spreadsheetView.register(OneDayPriceChangeCell.self, forCellWithReuseIdentifier: OneDayPriceChangeCell.identifier)
        spreadsheetView.register(SevenDayPercentCell.self, forCellWithReuseIdentifier: SevenDayPercentCell.identifier)
        spreadsheetView.register(CirculatingSupplyCell.self, forCellWithReuseIdentifier: CirculatingSupplyCell.identifier)
        spreadsheetView.register(VolumeCell.self, forCellWithReuseIdentifier: VolumeCell.identifier)
        spreadsheetView.register(ChartViewCell.self, forCellWithReuseIdentifier: ChartViewCell.identifier)
        spreadsheetView.register(ATHChangesCell.self, forCellWithReuseIdentifier: ATHChangesCell.identifier)
        return spreadsheetView
    }()
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    private var chartModels = [ChartModel]()
    private var athChangeModel = [ATHModel]()
    let columnHeaderData = [
        "#",
        "Name",
        "Market Cap",
        "Price",
        "1d%",
        "7d%",
        "Volume (24h)",
        "Circulating Supply",
        "Last 7 Days",
        "Change since ATH"
    ]
    private var data: [Double]? = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpViews()
        fetchData()
        fetchChartData()
        fetchATHChangeData()
            }
    private func fetchATHChangeData() {
        APICaller.shared.getATHChangePct { [weak self] result in
            switch result {
            case .success(let models):
                self?.athChangeModel = models.compactMap({ model in
                    let athChangeString = model.athChangePrct.asCurrencyWithFormatter()
                    return ATHModel(athChange: athChangeString)
                })
            case .failure(let error):
                print("error no ath_change_percent response + \(error)")
            }
        }
    }
    private func fetchChartData() {
        let api = ChartAPICaller()
         
             api.getData { [weak self] result in
                 switch result {
                 case .success(let models):
                     self?.chartModels = models.compactMap({ model  in
                         let priceArray = model.sparklineIn7D?.price ?? []
                         return ChartModel(priceIn7D: priceArray)
                        
                     })
                 case .failure(let error):
                     print("error no chart response + \(error)")
                    }
                 }
             }
    public func fetchData() {
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({ model in
                    //  NUMBER FORMATTER price
                    let price = Float(model.price ?? "0.0")
                    let priceString = price?.asCurrencyWithFormatter()
                    //  NUMBER FORMATTER market cap
                    let marketCap = Double(model.marketCap ?? "0.00")
                    let marketCapString = marketCap?.asCurrencyWithFormatter()
                    // Percent formatter for 1d
                    let oneDayChangePct = Float(model.oneDay?.priceChangePct ?? "0.00%")
                    let oneDayPctString = oneDayChangePct?.asPctChangesWithFormatter()
                    // Percent formatter for 7d
                    let sevenDaysChangePct = Float(model.sevenDay?.priceChangePct ?? "0.00%")
                    let sevenDaysPctString = sevenDaysChangePct?.asPctChangesWithFormatter()
                    //Volume formatter
                    let volume = Double(model.oneDay?.volume ?? "0.00")
                    let volumeString = volume?.asCurrencyWithFormatter()
                    //circulatingSupply formatter
                    let circulatingSupply = Double(model.circulatingSupply ?? "0.00")
                    let circulatingString = circulatingSupply?.asCurrencyWithFormatter()

                    let iconURL = URL(
                        string:
                            APICaller.shared.icons.filter { icon in
                            icon.asset_id == model.id
                        }.first?.url ?? "https://upload.wikimedia.org/wikipedia/commons/9/97/Cryptocurrency_Gold.png")
                    let pricesIn7D = APICaller.shared.pricesIn7D.filter { price in
                        price.name == model.name
                    }.first?.sparklineIn7D?.price ?? []
                    let ath = APICaller.shared.pricesIn7D.filter { price in
                        price.name == model.name
                    }.first?.athChangePrct.asCurrencyWithFormatter()
                    
                    return CryptoTableViewCellViewModel(name: model.name ?? "N/A",
                                                        symbol: model.symbol ?? "", iconURL: iconURL,
                                                        price: priceString ?? "N/A",
                                                        marketCap: marketCapString ?? "N/A", oneDayChangePct: oneDayPctString ?? "N/A", sevenDayChangePct: sevenDaysPctString ?? "N/A", circulatingSupply: circulatingString ?? "N/A", volume: volumeString ?? "N/A", priceIn7D: pricesIn7D, ath: ath ?? "N/A")
                    
                })
                DispatchQueue.main.async {
                    self?.spreadsheetView.reloadData()
                    
                }
            case .failure(let error):
                print("error no fetchData() response + \(error)")
            }
        }
    }
    func setUp() {
        view.backgroundColor = .systemBackground
//        view.backgroundColor =
//          // 1
//          UIColor { traitCollection in
//            // 2
//            switch traitCollection.userInterfaceStyle {
//            case .dark:
//              // 3
//              return UIColor(white: 0.3, alpha: 1.0)
//            default:
//              // 4
//              return UIColor(white: 0.7, alpha: 1.0)
//            }
//          }
        self.navigationItem.title = "Crypto Prices"
    }
    func setUpViews() {
        //SpreadsheetView
        spreadsheetView.dataSource = self
        spreadsheetView.delegate = self

        self.view.addSubview(spreadsheetView)
        
        spreadsheetView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        spreadsheetView.backgroundColor = .systemBackground
        
        
    }
  
}

extension ViewController: SpreadsheetViewDelegate, SpreadsheetViewDataSource  {
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {

        //HeaderColumns placement
        if indexPath.row == 0 {
            let headerCell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: ColumnHeaderCell.identifier, for: indexPath) as! ColumnHeaderCell
            headerCell.backgroundColor = .systemBackground
            headerCell.gridlines.top = .solid(width: 1, color: .black)
            headerCell.gridlines.left = .none
            headerCell.gridlines.bottom = .solid(width: 1, color: .black)
            headerCell.gridlines.right = .none
            headerCell.setup(with: columnHeaderData[indexPath.section])
            return headerCell
        } //Names cell
        if indexPath.section == 0 && indexPath.row > 0 {
            
        }
        if indexPath.section == 1 && indexPath.row > 0 {
            let cryptoNamesCell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: CryptoNameCell.identifier, for: indexPath) as! CryptoNameCell
            cryptoNamesCell.backgroundColor = .systemBackground
            
//            cryptoNamesCell.gridlines.top = .solid(width: 1, color: .black)
//            cryptoNamesCell.gridlines.left = .none
//            cryptoNamesCell.gridlines.bottom = .solid(width: 1, color: .black)
//            cryptoNamesCell.gridlines.right = .none
           
            cryptoNamesCell.configure(with: viewModels[indexPath.row])
            return cryptoNamesCell
        }// market cap
        if indexPath.section == 2 && indexPath.row > 0 {
            let marketCapCell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: MarketCapCell.identifier, for: indexPath) as! MarketCapCell
            marketCapCell.backgroundColor = .systemBackground
            
//            cryptoPriceCell.gridlines.top = .solid(width: 1, color: .black)
//            cryptoPriceCell.gridlines.left = .none
//            cryptoPriceCell.gridlines.bottom = .solid(width: 1, color: .black)
//            cryptoPriceCell.gridlines.right = .none
            marketCapCell.configure(with: viewModels[indexPath.row])
            
            return marketCapCell
        }
        //Price cell
        if indexPath.section == 3 && indexPath.row > 0 {
            let cryptoPriceCell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: CryptoPriceCell.identifier, for: indexPath) as! CryptoPriceCell
            cryptoPriceCell.backgroundColor = .systemBackground
            
//            cryptoPriceCell.gridlines.top = .solid(width: 1, color: .black)
//            cryptoPriceCell.gridlines.left = .none
//            cryptoPriceCell.gridlines.bottom = .solid(width: 1, color: .black)
//            cryptoPriceCell.gridlines.right = .none
            cryptoPriceCell.configure(with: viewModels[indexPath.row])
            
            return cryptoPriceCell
        } //1d%
        if indexPath.section == 4 && indexPath.row > 0 {
            let oneDayPercent = spreadsheetView.dequeueReusableCell(withReuseIdentifier: OneDayPriceChangeCell.identifier, for: indexPath) as! OneDayPriceChangeCell
            oneDayPercent.backgroundColor = .systemBackground
            oneDayPercent.configure(with: viewModels[indexPath.row])
            
            return oneDayPercent
        } //7d%
        if indexPath.section == 5 && indexPath.row > 0 {
            let sevenDayPercent = spreadsheetView.dequeueReusableCell(withReuseIdentifier: SevenDayPercentCell.identifier, for: indexPath) as! SevenDayPercentCell
            sevenDayPercent.backgroundColor = .systemBackground
            sevenDayPercent.configure(with: viewModels[indexPath.row])
            
            return sevenDayPercent
        } //Volume (24h)
        if indexPath.section == 6 && indexPath.row > 0 {
            let volumeCell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: VolumeCell.identifier, for: indexPath) as! VolumeCell
            volumeCell.backgroundColor = .systemBackground
            volumeCell.configure(with: viewModels[indexPath.row])
            
            return volumeCell
        }
        //Circulating Supply
        if indexPath.section == 7 && indexPath.row > 0 {
            let circulatingSupply = spreadsheetView.dequeueReusableCell(withReuseIdentifier: CirculatingSupplyCell.identifier, for: indexPath) as! CirculatingSupplyCell
            circulatingSupply.backgroundColor = .systemBackground
            circulatingSupply.configure(with: viewModels[indexPath.row])
            
            return circulatingSupply
        } //
        //Last 7 Days
        if indexPath.section == 8 && indexPath.row > 0 {
            let priceChart = spreadsheetView.dequeueReusableCell(withReuseIdentifier: ChartViewCell.identifier, for: indexPath) as! ChartViewCell
            priceChart.backgroundColor = .systemBackground
            priceChart.configure(with: chartModels[indexPath.row])
            
            return priceChart
        }
        //All time high
        if indexPath.section == 9 && indexPath.row > 0 {
            let athCell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: ATHChangesCell.identifier, for: indexPath) as! ATHChangesCell
            athCell.backgroundColor = .systemBackground
            athCell.configure(with: viewModels[indexPath.row])
            
            return athCell
        }
        
//        let columnHeaderData = [
//            "#",
//            "Name",
//            "Market Cap",
//            "Price",
//            "1d%",
//            "7d%",
//            "Volume (24h)",
//            "Circulating Supply",
//            "Last 7 Days",
//            "Change (24h)"
//        ]
        
        return nil
    }
    
    //self.spreadsheetView(spreadsheetView, cryptoNameCellForItemAt: IndexPath)
    
    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 2
    }
    
    
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        1
    }
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return max(1, viewModels.count)
    }
    
    
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return columnHeaderData.count
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        if column == 0 {
            return 50
        }
        if column == 1 {
            return 140
        }
        if column == 2 {
            return 150
        }
        if column == 6 {
            return 150
        }
        else { return 130 }
    }
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        return 60
        
    }
}

extension SpreadsheetView {
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: top).isActive = true
        leadingAnchor.constraint(equalTo: leading).isActive = true
        bottomAnchor.constraint(equalTo: bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing).isActive = true
    }
}
