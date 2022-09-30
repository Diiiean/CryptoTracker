//
//  VolumeCell.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 8.09.22.
//

import Foundation
import SpreadsheetView

final class VolumeCell: Cell {
    static let identifier = "VolumeCell"
    
    private var volumeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
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
        
        
        volumeLabel.edgesToSuperview()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        volumeLabel.text = nil
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
        contentView.addSubview(volumeLabel)
        
        volumeLabel.text = viewModel.volume + " $"
    }
    }

