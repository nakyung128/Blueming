import UIKit

class TagCell: UICollectionViewCell {
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        if let labelText = label.text {
            label.attributedText = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: -0.7])
        } else { }
        label.textColor = .Text03
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagLabel)
        contentView.backgroundColor = .articleColor
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.Text05!.cgColor
        
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectionStyle()
        }
    }
    
    private func updateSelectionStyle() {
        if isSelected {
            // 선택됐을 때의 스타일
            contentView.layer.borderColor = UIColor.select!.cgColor
            tagLabel.textColor = .select
        } else {
            // 선택되지 않았을 때의 스타일
            contentView.layer.borderColor = UIColor.Text05!.cgColor
            tagLabel.textColor = .Text03
        }
    }
    
    func setConstraint() {
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tagLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
