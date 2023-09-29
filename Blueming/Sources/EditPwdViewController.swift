//
//  EditPwdViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/30.
//

import UIKit

class EditPwdViewController: UIViewController {

    @IBOutlet var script: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 타이틀 자간, 행간 설정
        script.lineBreakMode = .byWordWrapping
        script.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        script.attributedText = NSMutableAttributedString(string: "변경할 비밀번호를\n입력해 주세요.", attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
