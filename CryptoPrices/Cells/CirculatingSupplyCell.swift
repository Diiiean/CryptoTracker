//
//  CirculatingSupplyCell.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 8.09.22.
//

import Foundation
//CirculatingSupplyCell

import SpreadsheetView

final class CirculatingSupplyCell: Cell {
    static let identifier = "CirculatingSupplyCell"
    
    private var circulatingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
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
        circulatingLabel.edgesToSuperview()
        
//        circulatingLabel.anchor(top: contentView.topAnchor,
//                           leading: contentView.leadingAnchor,
//                                bottom: contentView.bottomAnchor,
//                           trailing: contentView.trailingAnchor,
//                           padding: .init(top: 5, left: 5, bottom: 5, right: 5)
//        )
//                circulatingLabel.sizeToFit()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        circulatingLabel.text = nil
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
        contentView.addSubview(circulatingLabel)
        
        circulatingLabel.text = viewModel.circulatingSupply + "\n" + viewModel.symbol
    }
    }

