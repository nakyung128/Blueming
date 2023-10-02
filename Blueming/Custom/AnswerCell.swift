//
//  AnswerCell.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/02.
//

import UIKit

class AnswerCell: UITableViewCell {

    @IBOutlet var selectImg: UIImageView!
    @IBOutlet var answer: UILabel!
    
    func resetState() {
        selectImg.image = UIImage(named: "answer_view.png")
        answer.textColor = .Text01
    }
    
    // 선택되지 않았을 때의 상태를 설정하는 메서드
    func configureDeselectedState() {
        selectImg.image = UIImage(named: "answer_view.png")
        answer.textColor = .Text02
    }
    
    // 선택되었을 때의 상태를 설정하는 메서드
    func configureSelectedState() {
        selectImg.image = UIImage(named: "select_background.png")
        answer.textColor = .Blue01
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
