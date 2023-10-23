import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet var label1: UIButton!
    @IBOutlet var label2: UIButton!
    @IBOutlet var testScript: UILabel!
    @IBOutlet var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation 뒤로가기 색상 변경
        navigationController?.navigationBar.tintColor = .Text01
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        label1.applyOriginToButton(color: .Text05!)
        label2.applyOriginToButton(color: .Text05!)
        
        // 라벨 스타일 설정
        label1.applyGradientToLabel(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        label2.applyGradientToLabel(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        
        // 본 테스트는 문구 스타일
        testScript.numberOfLines = 0
        testScript.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        testScript.attributedText = NSMutableAttributedString(string: "*본 테스트는 산후우울증 선별 검사 및 평가를 위해\n가장 널리 쓰이고 있는 에든버러 산후우울 테스트입니다.", attributes: [NSAttributedString.Key.kern: -0.6, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        testScript.textAlignment = .center
        
        startBtn.applyOriginToButton(color: UIColor.Text05!)
        // 시작하기 버튼 스타일
        startBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
