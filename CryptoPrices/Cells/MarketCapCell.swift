//
//  MarketCapCell.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 3.09.22.
//

import Foundation
import SpreadsheetView
import TinyConstraints

final class MarketCapCell: Cell {
    static let identifier = "MarketCapCell"
    
    private var marketCapLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
      
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        marketCapLabel.centerInSuperview()
//        marketCapLabel.width(to: contentView)
//        marketCapLabel.height(to: contentView)
        marketCapLabel.edgesToSuperview()
        
//        marketCapLabel.anchor(top: contentView.topAnchor,
//                           leading: contentView.leadingAnchor,
//                                bottom: contentView.bottomAnchor,
//                           trailing: contentView.trailingAnchor,
//                           padding: .init(top: 5, left: 5, bottom: 5, right: 5)
//        )
            
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        marketCapLabel.text = nil
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
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        contentView.addSubview(marketCapLabel)
        
        marketCapLabel.text = viewModel.marketCap + " $"
    }
    }

