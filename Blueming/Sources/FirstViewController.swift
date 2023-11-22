import UIKit
import GoogleSignIn

class FirstViewController: UIViewController, UIScrollViewDelegate {
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet var emailLogin: UIButton!
    @IBOutlet var ggLogin: UIButton!
    @IBOutlet var imageScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var signUp: UILabel!
    @IBOutlet var script: UILabel!
    
    @IBAction func google(_ sender: Any) {
        // 구글 로그인
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            
            guard let signInResult = signInResult else { return }

            let user = signInResult.user
            if let email = user.profile?.email {
                UserDefaults.standard.setValue(email, forKey: "user_email")
            }
            
            // 프로필 완성 화면으로 전환
            guard let vcName = self.storyboard?.instantiateViewController(withIdentifier: "nameVC") else { return }
            self.navigationController?.pushViewController(vcName, animated: true)
        }
    }
    
    // 스크롤 뷰 데이터
    var images = [ UIImage(named: "onboarding1.png"), UIImage(named: "onboarding2.png"), UIImage(named: "onboarding3.png") ]
    var titles = [ "맞춤형 정보 제공", "간편한 자가진단", "매일 만나는 체크리스트" ]
    var scripts = [ "매일 그날의 감정, 건강 상태를 선택하면\n맞춤형 아티클을 만날 수 있어요", "본인의 상태를 쉽고 빠르게 진단하고\n검사 결과를 확인해 보세요", "작은 것을 이루며 성취감을 느끼고\n생활 습관을 형성해 보세요" ]
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = UserDefaults.standard.string(forKey: "user_email"), email != "" {
            // 홈으로 이동
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC")
            vcName?.modalPresentationStyle = .fullScreen
            vcName?.modalTransitionStyle = .crossDissolve
            self.present(vcName!, animated: true, completion: nil)
        }
        
        // 뒤로가기 색상 변경
        navigationController?.navigationBar.tintColor = .Text01
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        // 스크롤뷰 설정
        imageScroll.translatesAutoresizingMaskIntoConstraints = false
        imageScroll.delegate = self
        
        // 이메일 로그인 그라데이션 배경
        emailLogin.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        
        // 구글 로그인 버튼 디자인
        ggLogin.layer.masksToBounds = true
        ggLogin.layer.cornerRadius = 14
        ggLogin.layer.borderWidth = 2
        ggLogin.layer.borderColor = UIColor.Text05?.cgColor
        ggLogin.configuration?.imagePadding = 80
        
        // 로그인 버튼 자간 설정
        let attributedTitle = NSMutableAttributedString(string: "구글로 로그인하기", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-SemiBold", size: 16)!])
        ggLogin.setAttributedTitle(attributedTitle, for: .normal)
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 스크롤뷰
        addContentScrollView()
        setPageControl()
        
        script.attributedText = NSAttributedString(string: "블루밍 이용이 처음이신가요?", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        // 회원가입 라벨
        let labelText = "회원가입 하기"
        let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: -0.7])
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: labelText.count))
        
        signUp.attributedText = attributedString
        
        // 회원가입 클릭 시 페이지 이동
        let goSignUp = UITapGestureRecognizer(target: self, action: #selector(goToSignUp))
        signUp.isUserInteractionEnabled = true
        signUp.addGestureRecognizer(goSignUp)
        
        
    }
    
    @objc func goToSignUp() {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func addContentScrollView() {
        var contentX: CGFloat = 0.0 // 컨텐츠의 x 좌표를 초기화합니다.
        
        for i in 0..<images.count {
            // 이미지와 레이블을 담을 컨테이너 뷰 생성
            let containerView = UIView()
            
            // 이미지 뷰 생성 및 설정
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.image = images[i]

            // 컨테이너 뷰에 이미지 뷰 추가
            containerView.addSubview(image)

            // 이미지 뷰의 오토레이아웃 제약 설정
            NSLayoutConstraint.activate([
                image.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                image.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 70),
                image.widthAnchor.constraint(equalToConstant: 160),
                image.heightAnchor.constraint(equalToConstant: 160)
            ])

            
            // titleLabel과 scriptLabel을 생성하고 컨테이너 뷰에 추가
            let titleLabel = UILabel()
            let scriptLabel = UILabel()
            
            titleLabel.text = titles[i]
            scriptLabel.text = scripts[i]
            
            titleLabel.frame = CGRect(x: containerView.bounds.width/2, y: 0, width: imageScroll.bounds.width, height: 30)
            titleLabel.textColor = .Blue01
            titleLabel.font = UIFont(name: "Pretendard-Bold", size: 24)
            titleLabel.attributedText = NSMutableAttributedString(string: titles[i], attributes: [NSAttributedString.Key.kern: -1.2])
            titleLabel.textAlignment = .center
            
            scriptLabel.frame = CGRect(x: containerView.bounds.width/2, y: 30, width: imageScroll.bounds.width, height: 70)
            scriptLabel.textColor = .script
            scriptLabel.font = UIFont(name: "Pretendard-Medium", size: 14)
            scriptLabel.numberOfLines = 0
            scriptLabel.lineBreakMode = .byWordWrapping
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.26
            
            scriptLabel.attributedText = NSMutableAttributedString(string: scripts[i], attributes: [NSAttributedString.Key.kern: -0.7, NSAttributedString.Key.paragraphStyle: paragraphStyle])
            
            scriptLabel.textAlignment = .center
            
            //containerView.addSubview(image)
            containerView.addSubview(titleLabel)
            containerView.addSubview(scriptLabel)
            
            // 컨테이너 뷰를 스크롤 뷰에 추가
            containerView.frame = CGRect(x: contentX, y: 0, width: imageScroll.bounds.width, height: imageScroll.bounds.height)
            imageScroll.addSubview(containerView)
            
            contentX += imageScroll.bounds.width // x 좌표를 증가시켜 다음 컨텐츠 위치를 지정합니다.
        }
        
        // 스크롤뷰의 contentSize 설정
        imageScroll.contentSize.width = imageScroll.frame.width * CGFloat(images.count)
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
}

extension UIButton {
    // 그라데이션 배경 적용
    func applyGradientToButton(startColor: UIColor, endColor: UIColor) {
        self.layer.sublayers?.removeAll { $0 is CAShapeLayer }
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        gradientLayer.masksToBounds = true
        self.layer.cornerRadius = 14
        
        // 버튼의 모서리 둥글게 설정
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        
        self.layer.addSublayer(gradientLayer)
        self.configuration?.imagePadding = 78
        
        let attributedTitle = NSMutableAttributedString(string: (self.titleLabel?.text)!, attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.white])
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func applyGradientToLabel(startColor: UIColor, endColor: UIColor) {
        self.layer.sublayers?.removeAll { $0 is CAShapeLayer }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        gradientLayer.masksToBounds = true
        self.layer.cornerRadius = 15
        
        // 버튼의 모서리 둥글게 설정
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        let attributedTitle = NSMutableAttributedString(string: (self.titleLabel?.text)!, attributes: [NSAttributedString.Key.kern: -0.7, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.white])
        self.setAttributedTitle(attributedTitle, for: .normal)
        
        self.titleLabel?.textAlignment = .center
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
    }
    
    func applyOriginToButton(color: UIColor) {
        self.layer.sublayers?.removeAll { $0 is CAGradientLayer }
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.Text05?.cgColor
        layer.strokeColor = UIColor.Text05?.cgColor
        
        layer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        layer.masksToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 14
        
        // 버튼의 모서리 둥글게 설정
        layer.cornerRadius = self.layer.cornerRadius
        layer.masksToBounds = true
        
        self.layer.addSublayer(layer)
        self.configuration?.imagePadding = 78
        
        let attributedTitle = NSMutableAttributedString(string: (self.titleLabel?.text)!, attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.white])
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
}
