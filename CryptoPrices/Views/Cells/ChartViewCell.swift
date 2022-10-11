import Foundation
import UIKit
import Charts
import TinyConstraints
import SpreadsheetView

final class ChartViewCell: Cell, ChartViewDelegate {
    static let identifier = "ChartViewCell"
    static var shared = ChartViewCell()
    private var priceData: [Double]? = [Double]()
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.animate(xAxisDuration: 2.5)
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.xAxis.enabled = false
        chartView.xAxis.labelPosition = .bottom
        chartView.setScaleEnabled(false)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(chartView)
        return chartView
    }()
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    public func setupChart(priceData: [Double]?) {
        guard let priceData = priceData else { return }
        var dataEntry = [ChartDataEntry]()
        for index in 0..<priceData.count {
            dataEntry.append(ChartDataEntry(x: Double(index), y: Double(priceData[index])))
        }
        let set1 = LineChartDataSet(entries: dataEntry)
        set1.drawCirclesEnabled = false
        set1.lineWidth = 0.5
        let priceChange = (priceData.last ?? 0 ) - (priceData.first ?? 0)
        priceChange > 0 ? set1.setColor(.systemGreen) :  set1.setColor(.systemRed)
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        lineChartView.centerInSuperview()
        lineChartView.width(to: contentView)
        lineChartView.height(to: contentView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        contentView.addSubview(lineChartView)
        
        
        if let priceArray = viewModel.priceIn7D {
            DispatchQueue.main.async {
                self.setupChart(priceData: priceArray)
                
            }
        }
    }
}

