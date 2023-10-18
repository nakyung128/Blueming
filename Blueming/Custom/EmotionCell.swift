//
//  EmotionCell.swift
//  Blueming
//
//  Created by 이나경 on 10/18/23.
//

import UIKit

class EmotionCell: UICollectionViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var emotion: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setViewShadow(backView: view)
        configureCell()
    }
    
    func configureCell() {
        // Attributed 문자열을 생성하고 자간을 설정합니다.
        let attributedText = NSAttributedString(string: emotion.text ?? "", attributes: [NSAttributedString.Key.kern: -0.7])
        
        // 레이블에 적용합니다.
        emotion.attributedText = attributedText
    }

}

extension UIView {
    func setViewShadow(backView: UIView) {
            backView.layer.masksToBounds = true
            backView.layer.cornerRadius = 20
            
            layer.masksToBounds = false
            layer.shadowOpacity = 0.7
            layer.shadowOffset = CGSize(width: 0, height: 0)
            layer.shadowRadius = 4
            layer.shadowColor = UIColor(red: 0.835, green: 0.898, blue: 1, alpha: 1).cgColor
        }
}
