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
        marketCapLabel.edgesToSuperview()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        marketCapLabel.text = nil
    }
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        contentView.addSubview(marketCapLabel)
        marketCapLabel.text = viewModel.marketCap + " $"
    }
}

