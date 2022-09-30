//
//  ChartViewCell.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 15.09.22.
//

import Foundation
import UIKit
import Charts
import TinyConstraints
import SpreadsheetView


final class ChartViewCell: Cell, ChartViewDelegate {
    static let identifier = "ChartViewCell"
    static var shared = ChartViewCell()
    private var priceData: [Double]? = [Double]()
    
   // private var viewModel: CryptoTableViewCellViewModel
    
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
//        //horizontal max/min
//        chartView.xAxis.axisMinimum = 0
//        chartView.xAxis.axisMaximum = Double(ChartDataEntry.shared.priceIn7D.count)
//        //vertical max/min
//        chartView.leftAxis.axisMinimum = 0
//        chartView.leftAxis.axisMaximum = ChartDataEntry.shared.priceIn7D.max() ?? 0
        return chartView
    }()
  
    private var viewModels = [CryptoTableViewCellViewModel]()
//    private let api = ChartAPICaller()
//    private func fetchPriceData() {
//        api.getData { [self] el, error in
//            self.data = el?.first?.sparklineIn7D?.price ?? []
//            print("elemenhj------------t: \(data)")
//
//            DispatchQueue.main.async {
//                self.setupChart()
//            }
//        }
//        
//          
//        
//    }
//
//    var dataEntry = [ChartDataEntry]()
//    func setupChart() {
//        guard let priceData = data else
//        {return}
//
//            for index in 0..<priceData.count {
//                dataEntry.append(ChartDataEntry(x: Double(index), y: Double(priceData[index])))
//            }
//        let set1 = LineChartDataSet(entries: dataEntry)
//        set1.drawCirclesEnabled = false
//        set1.lineWidth = 3
//        set1.setColor(.red)
//        set1.fillColor = .red
//        set1.fillAlpha = 0.8
//       // set1.drawFilledEnabled = true
//        let data = LineChartData(dataSet: set1)
//        data.setDrawValues(false)
//        lineChartView.data = data
//
//
//    }

    
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
               
//                set1.fillColor = .red
//                set1.fillAlpha = 0.8
//                set1.drawFilledEnabled = true
                let data = LineChartData(dataSet: set1)
                data.setDrawValues(false)
                lineChartView.data = data
//        lineChartView.marker = nil
//        lineChartView.delegate = self
//        lineChartView.setScaleEnabled(false)
//        lineChartView.pinchZoomEnabled = false
//        lineChartView.legend.enabled = false
//        lineChartView.leftAxis.enabled = false
//        lineChartView.rightAxis.enabled = false
//        lineChartView.xAxis.enabled = true
//        lineChartView.xAxis.labelPosition = .bottom
//
//        // horisontal maximum and minimum
//        lineChartView.xAxis.axisMinimum = 0
//        lineChartView.xAxis.axisMaximum = Double(data.count)
//
//        // vertical maximum and minimum
//        lineChartView.leftAxis.axisMinimum = 0
//        lineChartView.leftAxis.axisMaximum = (data.max() ?? 0) + 100
//
//        lineChartView.xAxis.drawGridLinesEnabled = false
//        lineChartView.leftAxis.drawGridLinesEnabled = true
//        lineChartView.leftAxis.drawAxisLineEnabled = false
//        lineChartView.leftAxis.labelPosition = .insideChart
//        lineChartView.extraLeftOffset = 0
//        lineChartView.leftAxis.labelXOffset = 0
//        lineChartView.leftAxis.gridColor = .lightGray.withAlphaComponent(0.5)
//        lineChartView.highlightPerTapEnabled = true
//        lineChartView.highlightPerDragEnabled = true
//        lineChartView.drawMarkers = true
//        lineChartView.extraTopOffset = 150
//
//        // расстояние между горизонтальными пунктами
//        lineChartView.xAxis.labelCount = 10
//
//        lineChartView.xAxis.granularityEnabled = true
//        lineChartView.xAxis.granularity = 1800
//        lineChartView.xAxis.labelTextColor = .darkGray
//        lineChartView.isUserInteractionEnabled = true
//        lineChartView.setScaleEnabled(false)
//
//        var dataEntry = [ChartDataEntry]()
//
//        for index in 0..<data.count {
//            dataEntry.append(ChartDataEntry(x: Double(index), y: Double(data[index])))
//        }
//
//        let dataSet = LineChartDataSet(entries: dataEntry)
//        dataSet.mode = .cubicBezier
//        dataSet.drawCirclesEnabled = false
//        dataSet.valueTextColor = .clear
//        dataSet.lineWidth = 4.5
//        dataSet.colors = [.blue]
//
//        lineChartView.drawMarkers = true
//
//        lineChartView.notifyDataSetChanged()
//
//        // если не нужно, чтобы весь график был сжат, а можно было перемещаться по нему право-лево
//        lineChartView.setVisibleXRangeMaximum(30)
//        lineChartView.setVisibleXRangeMinimum(0)
//
//        lineChartView.data = LineChartData(dataSets: [dataSet])
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
//            guard let self = self else {
//                return
//            }
//            self.lineChartView.centerViewTo(xValue: 100, yValue: 200, axis: .right)
        }
    
//    let yValues: [ChartDataEntry] = [ChartDataEntry(x: <#T##Int#>, y: <#T##Double#>)]
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
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
        
//        [
//            lineChartView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
//            lineChartView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
//            lineChartView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//            lineChartView.heightAnchor.constraint(equalToConstant: 100)
//        ].forEach {
//            $0.isActive = true
//        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }

    //    public func setup(with text: String) {
    //        cryptoNameLabel.text = text
    //        contentView.addSubview(cryptoNameLabel)
    //    }

    //    override func layoutSubviews() {
    //        super.layoutSubviews()
    //        cryptoNameLabel.frame = contentView.bounds
    //
    //
    //}
    func configure(with viewModel: ChartModel) {
        contentView.addSubview(lineChartView)
       
        
        if let priceArray = viewModel.priceIn7D {
            DispatchQueue.main.async {
                self.setupChart(priceData: priceArray)
                
            }
        }
//
//        volumeLabel.text = viewModel.volume
        
    }
    }
//if let url = viewModel.iconURL {
//    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
//        if let data = data {
//            DispatchQueue.main.async {
//                self?.iconImageView.image = UIImage(data: data)
//            }
//        }
//    }
//    task.resume()
