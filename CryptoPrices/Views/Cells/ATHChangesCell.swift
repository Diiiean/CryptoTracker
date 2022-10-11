import Foundation
import SpreadsheetView

final class ATHChangesCell: Cell {
    static let identifier = "ATHChangesCell"
    
    private var athPrctLabel: UILabel = {
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
        return imageView
    }()
    private var prct: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.sizeToFit()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    private let downArrowImage: UIImageView = {
        let image = UIImage(systemName: "arrowtriangle.down.fill")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemRed
        imageView.isHidden = true
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
        stack.addArrangedSubview(athPrctLabel)
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        athPrctLabel.text = nil
        athPrctLabel.textColor = nil
    }
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        [stackView].forEach { contentView.addSubview($0)
        }
        athPrctLabel.text = viewModel.ath
        let editedLabel = athPrctLabel.text?.replacingOccurrences(of: "-", with: "")
        athPrctLabel.text = editedLabel
        
        if viewModel.ath == "N/A" {
            athPrctLabel.text = viewModel.ath
            downArrowImage.isHidden = true
            upperArrowImage.isHidden = true
        } else if  viewModel.ath.contains("-") {
            downArrowImage.isHidden = false
            upperArrowImage.isHidden = true
            athPrctLabel.textColor = .systemRed
            prct.textColor = .systemRed
        }
        else {
            downArrowImage.isHidden = true
            upperArrowImage.isHidden = false
            athPrctLabel.text = editedLabel
            athPrctLabel.textColor = .systemGreen
            prct.textColor = .systemGreen
        }
    }
}

