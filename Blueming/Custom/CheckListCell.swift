//
//  CheckListCell.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/11.
//

import UIKit

class CheckListCell: UICollectionViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var goalTitle: UILabel!
    @IBOutlet var goalScript: UILabel!
    @IBOutlet var first: UIButton!
    @IBOutlet var second: UIButton!
    @IBOutlet var third: UIButton!
    
    @IBAction func checkboxTapped(_ sender: UIButton) {
        if sender == first {
            if first.isSelected {
                first.isSelected = false
                first.setImage(UIImage(named: "unchecked"), for: .normal)
            } else {
                first.isSelected = true
                first.setImage(UIImage(named: "checked"), for: .normal)
            }
        } else if sender == second {
            if second.isSelected {
                second.isSelected = false
                second.setImage(UIImage(named: "unchecked"), for: .normal)
            } else {
                second.isSelected = true
                second.setImage(UIImage(named: "checked"), for: .normal)
            }
        } else {
            if third.isSelected {
                third.isSelected = false
                third.setImage(UIImage(named: "unchecked"), for: .normal)
            } else {
                third.isSelected = true
                third.setImage(UIImage(named: "checked"), for: .normal)
            }
        }
    }
    
    func configureCell() {
        // 원하는 자간 값을 설정합니다.
        let scriptSpacing: CGFloat = -0.7
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        
        goalScript.attributedText = NSMutableAttributedString(string: goalScript.text!, attributes: [NSAttributedString.Key.kern: scriptSpacing, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        goalScript.textAlignment = .center
    }
    
    func isChecked() {
        if first.isSelected == true {
            first.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            first.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        
        if third.isSelected == true {
            third.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            third.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        
        if second.isSelected == true {
            second.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            second.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
