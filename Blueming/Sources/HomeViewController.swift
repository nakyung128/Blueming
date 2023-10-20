//
//  HomeViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/09.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 더미 데이터 불러오기
    let list = Article.data
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainArticleCell
        let target = list[indexPath.row]
        
        cell.img.image = UIImage(named: target.img)
        cell.title.text = target.title
        cell.script.text = target.script
        cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        // 자간 설정
        cell.configureCell()
        
        return cell
    }
    
    // header 높이 0으로 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var alertBtn: UIImageView!
    @IBOutlet var healthLabel: UILabel!
    @IBOutlet var emotionLabel: UILabel!
    @IBOutlet var keywordLabel: UILabel!
    @IBOutlet var todayEmotion: UILabel!
    @IBOutlet var todayHealth: UILabel!
    @IBOutlet var todayGoal: UILabel!
    @IBOutlet var todayRead: UILabel!
    @IBOutlet var goal1: UILabel!
    @IBOutlet var goal2: UILabel!
    @IBOutlet var goalCnt1: UILabel!
    @IBOutlet var goalCnt2: UILabel!
    
    // table View
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var emotion: UIImageView!
    @IBOutlet var health: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 오늘 선택한 감정, 건강일 때만 저장된 값 불러오기. 아니면 초기화
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayString = formatter.string(from: today)
        
        if UserDefaults.standard.string(forKey: "date") != nil {
            if let lastSavedDate = UserDefaults.standard.string(forKey: "date"), lastSavedDate != todayString {
                // 날짜가 다르면 값을 초기화
                UserDefaults.standard.removeObject(forKey: "emotion_keyword")
                UserDefaults.standard.removeObject(forKey: "health_keyword")
                UserDefaults.standard.removeObject(forKey: "emotion_img")
                UserDefaults.standard.removeObject(forKey: "health_img")
            } else {
                // 같은 날짜일 경우, 저장돼 있는 값 불러오기
                let emotionKeyword = UserDefaults.standard.string(forKey: "emotion_keyword")
                let healthKeyword = UserDefaults.standard.string(forKey: "health_keyword")
                let emotionImg = UserDefaults.standard.string(forKey: "emotion_img")
                let healthImg = UserDefaults.standard.string(forKey: "health_img")
                
                print(emotionKeyword)
                print(healthKeyword)
                
                if emotionKeyword != nil && healthKeyword == nil {
                    print("감정만 선택됨")
                    emotion.image = UIImage(named: emotionImg!)
                    emotionLabel.attributedText = NSMutableAttributedString(string: emotionKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    emotionLabel.textAlignment = .center
                } else if healthKeyword != nil && emotionKeyword == nil {
                    print("건강만 선택됨")
                    health.image = UIImage(named: healthImg!)
                    healthLabel.attributedText = NSMutableAttributedString(string: healthKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    healthLabel.textAlignment = .center
                } else if healthKeyword != nil && emotionKeyword != nil {
                    print("둘 다 선택됨")
                    emotion.image = UIImage(named: emotionImg!)
                    emotionLabel.attributedText = NSMutableAttributedString(string: emotionKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    emotionLabel.textAlignment = .center
                    health.image = UIImage(named: healthImg!)
                    healthLabel.attributedText = NSMutableAttributedString(string: healthKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    healthLabel.textAlignment = .center
                }
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(handleEmotionUpdate), name: .selectEmotion, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleHealthUpdate), name: .selectHealth, object: nil)
        
        keywordLabel.attributedText = NSAttributedString(string: "✍🏻 오늘의 키워드", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        todayGoal.attributedText = NSAttributedString(string: "💙 오늘의 목표", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        todayRead.attributedText = NSAttributedString(string: "👀 오늘의 읽을거리", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        
        todayEmotion.attributedText = NSAttributedString(string: "오늘의 감정", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        todayHealth.attributedText = NSAttributedString(string: "오늘의 건강", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        goal1.attributedText = NSAttributedString(string: "체크리스트 1 내용", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        goal2.attributedText = NSAttributedString(string: "체크리스트 2 내용", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        
        goalCnt1.attributedText = NSAttributedString(string: "1회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
        goalCnt2.attributedText = NSAttributedString(string: "2회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        let nibName = UINib(nibName: "MainArticleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "mainCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false // 스크롤 막기
        tableView.backgroundColor = UIColor.clear // 배경 투명
        tableView.allowsSelection = false // 셀 선택 막기
        tableView.separatorStyle = .none // table view 구분선 없애기
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 원본 문자열
        let originalString = "파랑 님,\n오늘도 힘내세요!"
        
        // 원본 문자열을 NSAttributedString으로 변환
        let attributedString = NSMutableAttributedString(string: originalString)
        
        // '파랑' 단어의 범위 찾기
        if let range = originalString.range(of: "파랑") {
            let nsRange = NSRange(range, in: originalString)
            
            // 색상을 변경할 부분에 대한 속성을 설정
            let colorAttribute: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(named: "Blue01") ?? UIColor.blue // 원하는 색상으로 변경
            ]
            
            attributedString.addAttributes(colorAttribute, range: nsRange)
        }
        
        // 나머지 텍스트에 대한 스타일을 설정합니다.
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        attributedString.addAttributes([NSAttributedString.Key.kern: -1.2, NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attributedString.length))
        
        mainLabel.attributedText = attributedString
        
        // 검색 화면으로 이동
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToAlert))
        alertBtn.isUserInteractionEnabled = true
        alertBtn.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(selectEmotion))
        emotion.isUserInteractionEnabled = true
        emotion.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(selectHealth))
        health.isUserInteractionEnabled = true
        health.addGestureRecognizer(tapGesture3)
    }
    
    // 옵저버 해제
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleEmotionUpdate() {
        let emotionKeyword = UserDefaults.standard.string(forKey: "emotion_keyword")
        let emotionImg = UserDefaults.standard.string(forKey: "emotion_img")
        emotion.image = UIImage(named: emotionImg!)
        emotionLabel.attributedText = NSMutableAttributedString(string: emotionKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
    }
    
    @objc func handleHealthUpdate() {
        let healthKeyword = UserDefaults.standard.string(forKey: "health_keyword")
        let healthImg = UserDefaults.standard.string(forKey: "health_img")
        health.image = UIImage(named: healthImg!)
        healthLabel.attributedText = NSMutableAttributedString(string: healthKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
    }
    
    // 알람 화면으로 이동
    @objc func goToAlert(sender: UITapGestureRecognizer) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "alertVC")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
    // 감정 선택 팝업창
    @objc func selectEmotion(sender: UITapGestureRecognizer) {
        // 약간의 딜레이 후 팝업 띄우기
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let popup = SelectEmotionViewController(nibName: "SelectEmotionViewController", bundle: nil)
            popup.modalPresentationStyle = .overCurrentContext
            self.present(popup, animated: false)
        }
    }
    
    // 감정 선택 팝업창
    @objc func selectHealth(sender: UITapGestureRecognizer) {
        // 약간의 딜레이 후 팝업 띄우기
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let popup = SelectHealthViewController(nibName: "SelectHealthViewController", bundle: nil)
            popup.modalPresentationStyle = .overCurrentContext
            self.present(popup, animated: false)
        }
    }
    
    func createViewWithShadowsAndShapes(parent: UIView, leadingConstant: CGFloat, topConstant: NSLayoutAnchor<NSLayoutYAxisAnchor>, Constant: CGFloat) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 168, height: 186)
        
        let shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)
        
        let shadowPath = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
        let shadowLayer = CALayer()
        shadowLayer.shadowPath = shadowPath.cgPath
        shadowLayer.shadowColor = UIColor(red: 0.579, green: 0.697, blue: 1, alpha: 0.2).cgColor
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 9
        shadowLayer.shadowOffset = CGSize(width: 0, height: 4)
        shadowLayer.bounds = shadows.bounds
        shadowLayer.position = shadows.center
        shadows.layer.addSublayer(shadowLayer)
        
        let shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)
        
        let shapeLayer = CALayer()
        shapeLayer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shapeLayer.bounds = shapes.bounds
        shapeLayer.position = shapes.center
        shapes.layer.addSublayer(shapeLayer)
        
        shapes.layer.cornerRadius = 20
        
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 168).isActive = true
        view.heightAnchor.constraint(equalToConstant: 186).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: leadingConstant).isActive = true
        view.topAnchor.constraint(equalTo: topConstant, constant: Constant).isActive = true
        
        return view
    }
    
}
