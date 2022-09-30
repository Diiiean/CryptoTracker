//
//  ChartView.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 11.09.22.
//

//import Foundation
//import UIKit
//import Charts
//
//var chtCharts: LineChartView
//final class ChartView: UIView {
//    let data: [Double]
//    let maxY: Double
//    let minY: Double
//    let lineColor: UIColor
//    
//    
//    init(viewModel: CryptoTableViewCellViewModel) {
//        
//        data = viewModel.priceIn7D
//        maxY = data.max() ?? 0
//        minY = data.min() ?? 0
//        let priceChange = (data.last ?? 0) - (data.first ?? 0)
//        lineColor = priceChange > 0 ? .systemGreen : .systemRed
//        super.init()
//        setupViews()
//    }
//    func hg() {
//        for index in data.indices {
//            let xPosition = UIScreen.main.bounds.size.width / CGFloat(data.count) * CGFloat(index + 1)
//            let yAxis = maxY - minY
//        }
//    }
//    
//    override func layoutSubviews() {
//        // Adjust subviews
//        super.layoutSubviews()
//        
//        
//        
//    }
//    private func setupViews() {
//    // add view setup code
//    }
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////        setupViews()
////    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//import SwiftUI
//import Charts
//
//struct ChartView: View {
//    let data = ChartData.shared.priceIn7D
//    var maxY: Double { get {data.max() ?? 0} }
//    var minY: Double { get {data.min() ?? 0} }
//
//    
//    
//    var body: some View {
//        GeometryReader { geometry in
//            Path { path in
//                for index in data.indices {
//                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
//                    let yAxis = maxY - minY
//                    let yPosition = CGFloat((data[index] - minY) / yAxis) * geometry.size.height
//                    if index == 0 {
//                        path.move(to: CGPoint(x: 0, y: 0))
//                    }
//                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
//                    //            let yAxis = maxY - minY
//                }
//            }
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        }
//    }
//}
//
//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView(price: dev.coin)
//
//    }
//}
//
