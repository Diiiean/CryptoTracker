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
    private var prct: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.sizeToFit()
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
        stack.spacing = 4
        stack.clipsToBounds = true
        
        stack.addArrangedSubview(downArrowImage)
        stack.addArrangedSubview(upperArrowImage)
        stack.addArrangedSubview(sevenDayPercentLabel)
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
        sevenDayPercentLabel.text = nil
    }
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        sevenDayPercentLabel.text = viewModel.sevenDayChangePct
        [stackView].forEach { contentView.addSubview($0)
        }
        sevenDayPercentLabel.text = viewModel.sevenDayChangePct
        let editedLabel = sevenDayPercentLabel.text?.replacingOccurrences(of: "-", with: "")
        sevenDayPercentLabel.text = editedLabel
        if viewModel.sevenDayChangePct.contains("-") {
            downArrowImage.isHidden = false
            upperArrowImage.isHidden = true
            sevenDayPercentLabel.textColor = .systemRed
            prct.textColor = .systemRed
        } else {
            downArrowImage.isHidden = true
            upperArrowImage.isHidden = false
            prct.textColor = .systemGreen
            sevenDayPercentLabel.textColor = .systemGreen
        }
    }
}

