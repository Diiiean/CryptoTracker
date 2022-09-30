//
//  CryptoPriceCell.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 3.09.22.
//
import Foundation
import SpreadsheetView
import TinyConstraints

final class CryptoPriceCell: Cell {
    static let identifier = "CryptoPriceCell"
    
    private var cryptoPriceLabel: UILabel = {
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
    
    
    cryptoPriceLabel.edgesToSuperview()
        
           
    

}
override func prepareForReuse() {
    super.prepareForReuse()
    cryptoPriceLabel.text = nil
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
    contentView.addSubview(cryptoPriceLabel)
    
    cryptoPriceLabel.text = viewModel.price + " $"
}
}

