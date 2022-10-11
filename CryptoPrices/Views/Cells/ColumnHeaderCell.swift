import Foundation
import SpreadsheetView

final class ColumnHeaderCell: Cell {
    static let identifier = "ColumnHeaderCell"
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLabel.text = ""
    }
    
    public func setup(with text: String) {
        headerLabel.text = text
        contentView.addSubview(headerLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = contentView.bounds
    }
}
