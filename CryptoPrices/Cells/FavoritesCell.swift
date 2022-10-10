import Foundation
import SpreadsheetView
import TinyConstraints



final class FavoritesCell: Cell {
    static let identifier = "FavoritesCell"
//    lazy var favButton: UIButton = {
//        let butt = UIButton(type: .system)
//        butt.setImage(UIImage(systemName: "heart"), for: .normal)
//        butt.tintColor = .systemGray
//        butt.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
//        return butt
//    }()
//    @objc func handleMarkAsFavorite() {
//        print("handleMarkAsFavorite")
//    }
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "jkljklj"
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
        //contentView.addSubview(countLabel)
        countLabel.edgesToSuperview()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        //countLabel.text = nil
    }
    func configure(with count: Int) {
        contentView.addSubview(countLabel)
       
        countLabel.text = "\(count)"
//        for i in 1...23 {
//            print(i)
//            countLabel.text = "\(i)"
//        }
    }
    
}
