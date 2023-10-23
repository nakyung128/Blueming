import UIKit

class MainArticleCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var script: UILabel!
    @IBOutlet var img: UIImageView!
    
    func configureCell() {
        // 원하는 자간 값을 설정합니다.
        let titleSpacing: CGFloat = -0.8
        let scriptSpacing: CGFloat = -0.6
        
        // Attributed 문자열을 생성하고 자간을 설정합니다.
        let attributedText = NSAttributedString(string: title.text ?? "", attributes: [NSAttributedString.Key.kern: titleSpacing])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        
        script.attributedText = NSMutableAttributedString(string: script.text!, attributes: [NSAttributedString.Key.kern: scriptSpacing, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        // 레이블에 적용합니다.
        title.attributedText = attributedText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
