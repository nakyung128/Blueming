//
//  QuestionPopUp.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/03.
//

import UIKit

class QuestionPopUp: UIViewController {

    @IBOutlet var script1: UILabel!
    @IBOutlet var script2: UILabel!
    @IBOutlet var okBtn: UIButton!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let text1 = "테스트는 주 1회 주기적으로 시행하고\n자가진단 결과는 참고용으로 활용하시는 것을 권장합니다."
        let attributedText = NSMutableAttributedString(string: text1)
        
        script1.numberOfLines = 0
        script1.lineBreakMode = .byWordWrapping
        script2.numberOfLines = 0
        script2.lineBreakMode = .byWordWrapping
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26

        let range1 = (text1 as NSString).range(of: "주 1회")
        attributedText.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 14)!, range: range1)
        attributedText.addAttribute(.kern, value: -0.7, range: NSMakeRange(0, text1.count))
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, text1.count))

        // UILabel에 적용
        script1.attributedText = attributedText
        script1.textAlignment = .center
        
        let text2 = "오늘의 심리상태뿐만 아니라\n최근 7일 동안의 감정과 가까운 답변을 선택해주세요."
        let attributedText2 = NSMutableAttributedString(string: text2)
        
        let range2 = (text2 as NSString).range(of: "최근 7일 동안의 감정과 가까운 답변")
        attributedText2.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 14)!, range: range2)
        attributedText2.addAttribute(.kern, value: -0.7, range: NSMakeRange(0, text2.count))
        attributedText2.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, text2.count))
        
        script2.attributedText = attributedText2
        script2.textAlignment = .center
        
        okBtn.applyOriginToButton(color: UIColor.Text05!)
        okBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
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
