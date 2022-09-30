//
//  SevenDayPriceChange.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 8.09.22.
//

import Foundation
import SpreadsheetView

final class SevenDayPercentCell: Cell {
    static let identifier = "SevenDayPercentCell"
    
    private var sevenDayPercentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        stack.spacing = 7
        stack.clipsToBounds = true
        
        stack.addArrangedSubview(downArrowImage)
        stack.addArrangedSubview(upperArrowImage)
        stack.addArrangedSubview(sevenDayPercentLabel)
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
        
        
//        if upperArrowImage.isHidden {
//            sevenDayPercentLabel.anchor(top: contentView.topAnchor,
//                                      leading: downArrowImage.trailingAnchor,
//                                      bottom: contentView.bottomAnchor,
//                                      trailing: contentView.trailingAnchor,
//                                      padding: .init(top: 3, left: 0, bottom: 5, right: 5)
//            )
//        } else {
//            sevenDayPercentLabel.anchor(top: contentView.topAnchor,
//                                      leading: upperArrowImage.trailingAnchor,
//                                      bottom: contentView.bottomAnchor,
//                                      trailing: contentView.trailingAnchor,
//                                      padding: .init(top: 10, left: 0, bottom: 5, right: 5)
//            )
//        }
        stackView.centerInSuperview()
//        sevenDayPercentLabel.anchor(top: contentView.topAnchor,
//                                  leading: downArrowImage.trailingAnchor,
//                                  bottom: contentView.bottomAnchor,
//                                  trailing: contentView.trailingAnchor,
//                                  padding: .init(top: 3, left: 0, bottom: 5, right: 5)
//                                    )
//
//        sevenDayPercentLabel.anchor(top: contentView.topAnchor,
//                                  leading: upperArrowImage.trailingAnchor,
//                                  bottom: contentView.bottomAnchor,
//                                  trailing: contentView.trailingAnchor,
//                                  padding: .init(top: 10, left: 0, bottom: 5, right: 5)
//        )
//
//        upperArrowImage.anchor(top: contentView.topAnchor,
//                               leading: contentView.leadingAnchor,
//                               bottom: contentView.bottomAnchor,
//                               trailing: sevenDayPercentLabel.leadingAnchor,
//                               padding: .init(top: 3, left: 20, bottom: 5, right: 0)
//        )
//        downArrowImage.anchor(top: contentView.topAnchor,
//                              leading: contentView.leadingAnchor,
//                              bottom: contentView.bottomAnchor,
//                              trailing: sevenDayPercentLabel.leadingAnchor,
//                              padding: .init(top: 3, left: 20, bottom: 5, right: 0)
//        )
        
                //sevenDayPercentLabel.sizeToFit()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        sevenDayPercentLabel.text = nil
        
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
        //contentView.addSubview(sevenDayPercentLabel)
        
        sevenDayPercentLabel.text = viewModel.sevenDayChangePct
        
        
        [stackView].forEach { contentView.addSubview($0)
        }

//        [sevenDayPercentLabel, upperArrowImage, downArrowImage].forEach { contentView.addSubview($0)
//        }
        sevenDayPercentLabel.text = viewModel.sevenDayChangePct
        let editedLabel = sevenDayPercentLabel.text?.replacingOccurrences(of: "-", with: "")
        sevenDayPercentLabel.text = editedLabel
        
        if viewModel.sevenDayChangePct.contains("-") {
            
            downArrowImage.isHidden = false
            upperArrowImage.isHidden = true
            sevenDayPercentLabel.textColor = .systemRed
        } else {
            downArrowImage.isHidden = true
            upperArrowImage.isHidden = false
            sevenDayPercentLabel.textColor = .systemGreen
        }
        
    }
    }

