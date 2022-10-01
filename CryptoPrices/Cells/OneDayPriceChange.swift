//
//  OneDayPriceChange.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 7.09.22.
//

import Foundation
import SpreadsheetView

final class OneDayPriceChangeCell: Cell {
    static let identifier = "OneDayPriceChangeCell"
    
    private var oneDayPercentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private var prct: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.numberOfLines = 0
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    private let upperArrowImage: UIImageView = {
        let image = UIImage(systemName: "arrowtriangle.up.fill")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGreen
        imageView.isHidden = false
        //imageView.backgroundColor = .green
         //scaleToFill //
        //imageView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        return imageView
    }()

    private let downArrowImage: UIImageView = {
        let image = UIImage(systemName: "arrowtriangle.down.fill")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemRed
        imageView.isHidden = true
        //imageView.backgroundColor = .green
         //scaleToFill //
        //imageView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        return imageView
    }()
    //Stack View
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = 4
        stack.clipsToBounds = true
        
        stack.addArrangedSubview(downArrowImage)
        stack.addArrangedSubview(upperArrowImage)
        stack.addArrangedSubview(oneDayPercentLabel)
        stack.addArrangedSubview(prct)
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
        stackView.centerInSuperview()
//            oneDayPercentLabel.anchor(top: contentView.topAnchor,
//                                      leading: downArrowImage.trailingAnchor,
//                                      bottom: contentView.bottomAnchor,
//                                      trailing: contentView.trailingAnchor,
//                                      padding: .init(top: 5, left: 0, bottom: 5, right: 5)
//            )
//
//            oneDayPercentLabel.anchor(top: contentView.topAnchor,
//                                      leading: upperArrowImage.trailingAnchor,
//                                      bottom: contentView.bottomAnchor,
//                                      trailing: contentView.trailingAnchor,
//                                      padding: .init(top: 5, left: 0, bottom: 5, right: 5)
//            )
//
//
//        upperArrowImage.anchor(top: contentView.topAnchor,
//                               leading: contentView.leadingAnchor,
//                               bottom: contentView.bottomAnchor,
//                               trailing: oneDayPercentLabel.leadingAnchor,
//                               padding: .init(top: 5, left: 20, bottom: 5, right: 0)
//        )
//        downArrowImage.anchor(top: contentView.topAnchor,
//                              leading: contentView.leadingAnchor,
//                              bottom: contentView.bottomAnchor,
//                              trailing: oneDayPercentLabel.leadingAnchor,
//                              padding: .init(top: 5, left: 20, bottom: 5, right: 0)
//        )
//
//                oneDayPercentLabel.sizeToFit()
////        upperArrowImage.sizeToFit()
////        downArrowImage.sizeToFit()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        oneDayPercentLabel.text = nil
        //upperArrowImage.image = nil
        //downArrowImage.image = nil
    }
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        [stackView].forEach { contentView.addSubview($0)
        }
        oneDayPercentLabel.text = viewModel.oneDayChangePct
        let editedLabel = oneDayPercentLabel.text?.replacingOccurrences(of: "-", with: "")
        oneDayPercentLabel.text = editedLabel
        
        if viewModel.oneDayChangePct.contains("-") {
            
            downArrowImage.isHidden = false
            upperArrowImage.isHidden = true
            oneDayPercentLabel.textColor = .systemRed
            prct.textColor = .systemRed
        }
        else {
            downArrowImage.isHidden = true
            upperArrowImage.isHidden = false
            oneDayPercentLabel.textColor = .systemGreen
            prct.textColor = .systemGreen
        }
    }
    }

