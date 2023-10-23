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
        let score = UserDefaults.standard.integer(forKey: "score")
        var text = ""
        var targetString = ""
        var emoji = ""
        
        scoreLabel.text = "\(score)점"
        
        switch score {
        case 0...8: 
            text = "파랑 님의 결과는 정상 수준으로\n대체로 평안한 상태입니다.\n앞으로도 스스로를 잘 돌봐 주세요 \u{1F970}\u{200B}"
            targetString = "정상 수준"
            emoji = "\u{1F970}"
        case 9...12:
            text = "파랑 님의 결과는 경계성 수준으로\n상담이 필요한 상태입니다.\n심각한 단계가 아니니, 전문의와 대화해 보세요 \u{263A}\u{200B}"
            targetString = "경계성 수준"
            emoji = "\u{263A}"
        case 13...:
            text = "파랑 님의 결과는 심각 수준으로\n치료가 필요한 상태입니다.\n전문의의 진단 및 처방이 반드시 필요합니다 \u{1F625}\u{200B}"
            targetString = "심각 수준"
            emoji = "\u{1F625}"
        default: return
        }
        let attributedText = NSMutableAttributedString(string: text)
        
        print(text)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        
        attributedText.addAttribute(.font, value: UIFont(name: "Pretendard-Medium", size: 14)!, range: NSMakeRange(0, text.count))
        attributedText.addAttribute(.kern, value: -0.8, range: NSMakeRange(0, text.count))
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, text.count))
        
        // 그 다음 특정 부분에 대한 스타일 변경
        let range1 = (text as NSString).range(of: "파랑")
        attributedText.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 14)!, range: range1)
        
        let range2 = (text as NSString).range(of: targetString)
        attributedText.addAttribute(.font, value: UIFont(name: "Pretendard-Bold", size: 14)!, range: range2)
        attributedText.addAttribute(.foregroundColor, value: UIColor.Blue01!, range: range2)
        
        let emojiRange = (text as NSString).range(of: emoji)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: emojiRange)

        // UILabel에 적용
        resultLabel.numberOfLines = 0
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
