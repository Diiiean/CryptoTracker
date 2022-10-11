import Foundation
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
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        circulatingLabel.text = nil
    }
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        contentView.addSubview(circulatingLabel)
        circulatingLabel.text = viewModel.circulatingSupply + "\n" + viewModel.symbol
    }
}

