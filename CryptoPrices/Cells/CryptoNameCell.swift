//
//  CryptoNameCell.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 3.09.22.
//

import Foundation
import SpreadsheetView
import TinyConstraints
import SDWebImage
import UIKit

final class CryptoNameCell: Cell {
    
    static let identifier = "CryptoNameCell"
    let placeHolderImage = UIImage(named: "placeHolderImage")
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
//        imageView.image = image
//        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFit //scaleToFill //
        //imageView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        return imageView
    }()
    private var cryptoNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
//        label.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
//        label.setContentHuggingPriority(.defaultLow - 1, for: .horizontal)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.contentMode = .scaleToFill
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 14
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    //Stack View
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 0
        stack.distribution = .fillProportionally
        stack.clipsToBounds = true
        stack.addArrangedSubview(cryptoNameLabel)
        stack.addArrangedSubview(symbolLabel)
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.anchor(top: contentView.topAnchor,
                             leading: contentView.leadingAnchor,
                             bottom: contentView.bottomAnchor,
                             trailing: cryptoNameLabel.leadingAnchor,
                             padding: .init(top: 0,
                                            left: 5,
                                            bottom: 0,
                                            right: -13),
                            size: .init(width: 35, height: 35)
            )
        stackView.anchor(top: contentView.topAnchor,
                                         leading: iconImageView.trailingAnchor,
                         bottom: contentView.bottomAnchor,
                                         trailing: contentView.trailingAnchor,
                         padding: .init(top: 2,
                                        left: 0,
                                        bottom: -2,
                                        right: -2)
                  )
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        cryptoNameLabel.text = nil
        symbolLabel.text = nil
    }
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        [stackView, iconImageView].forEach { contentView.addSubview($0) }
        
        cryptoNameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol

        if let url = URL(string: viewModel.icon) {
            iconImageView.sd_setImage(with: url, placeholderImage: nil, options: [.refreshCached], completed: { [weak self] downloadedImage, downloadException, cacheType, downloadURL in
                if let downloadException = downloadException {
                    
                    print("Error downloading iconImage: \(downloadException.localizedDescription)")
                }
                else {
                    self?.iconImageView.image = downloadedImage
                } 
            })
        }
        
        
        }
            
//            iconImageView.sd_setImage(with: url, placeholderImage: placeHolderImage, options: .highPriority, completed: { [weak self] downloadedImage, downloadException, cacheType, downloadURL in
//                                if let downloadException = downloadException {
//                                    self?.iconImageView.image = self?.placeHolderImage
//                                    print("Error downloading iconImage: \(downloadException.localizedDescription)")
//                                } else {
//                                    self?.iconImageView.image = self?.placeHolderImage
//                                    print("Successfully downloaded image: \(String(describing: downloadURL?.absoluteString))")
//                                }
//
//            })
        
    
    
}


