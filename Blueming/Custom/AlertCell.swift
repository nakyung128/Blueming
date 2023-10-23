import UIKit

class AlertCell: UITableViewCell {

    @IBOutlet var cellImg: UIImageView!
    @IBOutlet var lineImg: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var script: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        // 원하는 자간 값을 설정합니다.
        let titleSpacing: CGFloat = -0.7
        let scriptSpacing: CGFloat = -0.6
        
        
        title.attributedText = NSMutableAttributedString(string: title.text!, attributes: [NSAttributedString.Key.kern: titleSpacing])
        title.textAlignment = .center
        
        script.attributedText = NSMutableAttributedString(string: script.text!, attributes: [NSAttributedString.Key.kern: scriptSpacing])
        script.textAlignment = .center
    }
    
}
