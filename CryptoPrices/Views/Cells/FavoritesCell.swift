import Foundation
import SpreadsheetView
import TinyConstraints

final class FavoritesCell: Cell {
    static let identifier = "FavoritesCell"
    private lazy var countLabel: UILabel = {
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
        countLabel.edgesToSuperview()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        countLabel.text = ""
    }
    func configure(with count: Int) {
        contentView.addSubview(countLabel)
        countLabel.text = "\(count)"
    }
    
}
