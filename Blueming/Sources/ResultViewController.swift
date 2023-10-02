//
//  ResultViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var homeBtn: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func goToMain(_ sender: Any) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "question_background.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        homeBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        
        self.navigationItem.title = ""
        
        // 점수 label
        scoreLabel.text = UserDefaults.standard.string(forKey: "score")
        
        let text = "파랑 님의 결과는 경계성 수준으로\n상담이 필요한 상태입니다."
        let attributedText = NSMutableAttributedString(string: text)
        
        resultLabel.numberOfLines = 0
        resultLabel.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26

        // '파랑'에 대한 스타일
        let range1 = (text as NSString).range(of: "파랑")
        attributedText.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 16)!, range: range1)
        // '경계성 수준'에 대한 스타일
        let range2 = (text as NSString).range(of: "경계성 수준")
        attributedText.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 16)!, range: range2)
        attributedText.addAttribute(.foregroundColor, value: UIColor.Blue01!, range: range2)
        attributedText.addAttribute(.kern, value: -0.8, range: NSMakeRange(0, text.count))
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, text.count))

        // UILabel에 적용
        resultLabel.attributedText = attributedText
        resultLabel.textAlignment = .center
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
