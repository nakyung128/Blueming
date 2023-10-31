import UIKit
import SafariServices

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var list: [Article] = []
    var todayGoals: [Goals] = []
    var count1: Int = 0
    var count2: Int = 0
    var more1: Int = 0
    var more2: Int = 0
    
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
        cell.selectionStyle = .none
        
        // 자간 설정
        cell.configureCell()
        
        return cell
    }
    
    // header 높이 0으로 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = NSURL(string: list[indexPath.row].link)
        let safariView: SFSafariViewController = SFSafariViewController(url: url! as URL)
        self.present(safariView, animated: true, completion: nil)
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
    @IBOutlet var moreCnt1: UILabel!
    @IBOutlet var moreCnt2: UILabel!
    
    // table View
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var emotion: UIImageView!
    @IBOutlet var health: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.alerts(forKey: "alertsDataKey") == nil {
            UserDefaults.standard.setAlerts(Alert.data, forKey: "alertsDataKey")
        }
        
        goal1.attributedText = NSAttributedString(string: "아직 목표가 없어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        goal2.attributedText = NSAttributedString(string: "아직 목표가 없어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        
        moreCnt1.clipsToBounds = true
        moreCnt2.clipsToBounds = true
        
        moreCnt1.backgroundColor = UIColor.Blue05
        moreCnt2.backgroundColor = UIColor.Blue05
        moreCnt1.layer.cornerRadius = 5
        moreCnt2.layer.cornerRadius = 5
        
        moreCnt1.attributedText = NSAttributedString(string: "오늘의 키워드가 필요해요", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
        moreCnt2.attributedText = NSAttributedString(string: "오늘의 키워드가 필요해요", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
        
        // 맨 처음 앱 실행했을 때 오늘 날짜 저장
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayString = formatter.string(from: today)
        
        UserDefaults.standard.setValue(todayString, forKey: "todayDate")
        
        // 오늘 선택한 감정, 건강일 때만 저장된 값 불러오기. 아니면 초기화
        if UserDefaults.standard.string(forKey: "date") != nil {
            if let lastSavedDate = UserDefaults.standard.string(forKey: "date"), lastSavedDate != todayString {
                // 날짜가 다르면 값을 초기화
                UserDefaults.standard.removeObject(forKey: "emotion_keyword")
                UserDefaults.standard.removeObject(forKey: "health_keyword")
                UserDefaults.standard.removeObject(forKey: "emotion_img")
                UserDefaults.standard.removeObject(forKey: "health_img")
                UserDefaults.standard.removeObject(forKey: "firstGoal")
                UserDefaults.standard.removeObject(forKey: "secondGoal")
                
                goalCnt1.isHidden = true
                goalCnt2.isHidden = true
                
                goal1.attributedText = NSAttributedString(string: "아직 목표가 없어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
                goal2.attributedText = NSAttributedString(string: "아직 목표가 없어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
                moreCnt1.attributedText = NSAttributedString(string: "오늘의 키워드가 필요해요", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                moreCnt2.attributedText = NSAttributedString(string: "오늘의 키워드가 필요해요", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                
                let newAlert = Alert(date: todayString, title: "오늘의 키워드가 아직 완성되지 않았어요!", script: "오늘의 키워드를 완성하면 맞춤형 아티클을 제공받을 수 있어요.", isRead: false, vc: "TabBarVC")
                
                if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                    var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                    if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                        alerts.insert(newAlert, at: 0)
                    }
                    UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                } else {
                    UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                }
 
            } else {
                let emotionKeyword = UserDefaults.standard.string(forKey: "emotion_keyword")
                let healthKeyword = UserDefaults.standard.string(forKey: "health_keyword")
                let emotionImg = UserDefaults.standard.string(forKey: "emotion_img")
                let healthImg = UserDefaults.standard.string(forKey: "health_img")
                
                if emotionKeyword != nil && healthKeyword == nil {
                    emotion.image = UIImage(named: emotionImg!)
                    emotionLabel.attributedText = NSMutableAttributedString(string: emotionKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    emotionLabel.textAlignment = .center
                } else if healthKeyword != nil && emotionKeyword == nil {
                    health.image = UIImage(named: healthImg!)
                    healthLabel.attributedText = NSMutableAttributedString(string: healthKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    healthLabel.textAlignment = .center
                } else if healthKeyword != nil && emotionKeyword != nil {
                    emotion.image = UIImage(named: emotionImg!)
                    emotionLabel.attributedText = NSMutableAttributedString(string: emotionKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    emotionLabel.textAlignment = .center
                    health.image = UIImage(named: healthImg!)
                    healthLabel.attributedText = NSMutableAttributedString(string: healthKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
                    healthLabel.textAlignment = .center
                }
                
                // 오늘의 목표
                goalCnt1.isHidden = false
                goalCnt2.isHidden = false
                
                let firstGoal = UserDefaults.standard.string(forKey: "firstGoal")
                let secondGoal = UserDefaults.standard.string(forKey: "secondGoal")
                
                if let firstGoal = UserDefaults.standard.string(forKey: "firstGoal") {
                    goal1.attributedText = NSAttributedString(string: firstGoal, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
                }
                
                if let secondGoal = UserDefaults.standard.string(forKey: "secondGoal") {
                    goal2.attributedText = NSAttributedString(string: secondGoal, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
                }
                
                if firstGoal != nil && secondGoal != nil {
                    counter()
                }
                
            }
        } else {
            goalCnt1.isHidden = true
            goalCnt2.isHidden = true
            
            goal1.attributedText = NSAttributedString(string: "아직 목표가 없어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
            goal2.attributedText = NSAttributedString(string: "아직 목표가 없어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
            moreCnt1.attributedText = NSAttributedString(string: "오늘의 키워드가 필요해요", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
            moreCnt2.attributedText = NSAttributedString(string: "오늘의 키워드가 필요해요", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
        }
        
        // 오늘의 키워드를 선택하지 않았을 때 알람 생성하기
        let newAlert = Alert(date: todayString, title: "오늘의 키워드가 아직 완성되지 않았어요!", script: "오늘의 키워드를 완성하면 맞춤형 아티클을 제공받을 수 있어요.", isRead: false, vc: "TabBarVC")
        let articleAlert = Alert(date: todayString, title: "오늘 아티클을 열람하지 않았어요", script: "아티클을 확인하러 가볼까요?", isRead: false, vc: "ArticleVC")

        if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
            var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
            if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                alerts.insert(newAlert, at: 0)
            }
            if !alerts.contains(where: { $0.date == articleAlert.date && $0.title == articleAlert.title }) {
                alerts.insert(articleAlert, at: 0)
            }
            UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
        } else {
            UserDefaults.standard.setAlerts([newAlert, articleAlert], forKey: "alertsDataKey")
        }
        
        // 만약에 아예 첫 실행자라면 list에 데이터 넣어주기
        if UserDefaults.standard.data(forKey: "todayArticles") == nil {
            list.append(Article.depressed[Int.random(in: 0...12)])
            list.append(Article.unrest[Int.random(in: 0...6)])
            list.append(Article.confusion[Int.random(in: 0...5)])
            list.append(Article.sad[Int.random(in: 0...6)])
            list.append(Article.stress[Int.random(in: 0...7)])
            list.append(Article.body[Int.random(in: 0...19)])
            list.append(Article.family[Int.random(in: 0...17)])
            list.append(Article.baby[Int.random(in: 0...18)])
            list.append(Article.ect[Int.random(in: 0...5)])
            
            if let encodedData = try? JSONEncoder().encode(list) {
                UserDefaults.standard.set(encodedData, forKey: "todayArticles")
            }
            tableView.reloadData()
        }

        // 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(handleEmotionUpdate), name: .selectEmotion, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleHealthUpdate), name: .selectHealth, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(counter), name: .checked, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleProfileUpdate), name: .profileUpdated, object: nil)
        
        keywordLabel.attributedText = NSAttributedString(string: "✍🏻 오늘의 키워드", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        todayGoal.attributedText = NSAttributedString(string: "💙 오늘의 목표", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        todayRead.attributedText = NSAttributedString(string: "👀 오늘의 읽을거리", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
        
        todayEmotion.attributedText = NSAttributedString(string: "오늘의 감정", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        todayHealth.attributedText = NSAttributedString(string: "오늘의 건강", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        
        if UserDefaults.standard.string(forKey: "firstGoal") != nil{
            goalCnt1.isHidden = false
            goalCnt2.isHidden = false
            
            counter()
            
        } else {
            goalCnt1.isHidden = true
            goalCnt2.isHidden = true
        }
        
        let nibName = UINib(nibName: "MainArticleCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "mainCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false // 스크롤 막기
        tableView.backgroundColor = UIColor.clear // 배경 투명
        tableView.separatorStyle = .none // table view 구분선 없애기
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 원본 문자열
        if let name = UserDefaults.standard.string(forKey: "user_name") {
            let originalString = "\(name) 님,\n오늘도 힘내세요!"
            
            // 원본 문자열을 NSAttributedString으로 변환
            let attributedString = NSMutableAttributedString(string: originalString)
            
            // '파랑' 단어의 범위 찾기
            if let range = originalString.range(of: "\(name)") {
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
        }
        
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
        
        // 홈 화면 들어왔을 때 날짜 저장하고 오늘 날짜랑 다르면 데이터 변경하기
        // 아티클 각 카테고리에서 하나씩 랜덤 추천
        if UserDefaults.standard.string(forKey: "todayDate") != nil {
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let todayString = formatter.string(from: today)
            
            if let lastSavedDate = UserDefaults.standard.string(forKey: "todayDate"), lastSavedDate != todayString {
                list = []
                list.append(Article.depressed[Int.random(in: 0...13)])
                list.append(Article.unrest[Int.random(in: 0...6)])
                list.append(Article.confusion[Int.random(in: 0...5)])
                list.append(Article.sad[Int.random(in: 0...6)])
                list.append(Article.stress[Int.random(in: 0...7)])
                list.append(Article.body[Int.random(in: 0...19)])
                list.append(Article.family[Int.random(in: 0...17)])
                list.append(Article.baby[Int.random(in: 0...18)])
                list.append(Article.ect[Int.random(in: 0...5)])
                
                if let encodedData = try? JSONEncoder().encode(list) {
                    UserDefaults.standard.set(encodedData, forKey: "todayArticles")
                }
                tableView.reloadData()
            } else {
                if let savedData = UserDefaults.standard.data(forKey: "todayArticles") {
                    if let decodedArray = try? JSONDecoder().decode([Article].self, from: savedData) {
                        list = decodedArray
                        tableView.reloadData()
                    }
                }
            }
            
        }
    }
    
    
    // 옵저버 해제
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleEmotionUpdate() {
        let emotionKeyword = UserDefaults.standard.string(forKey: "emotion_keyword")
        let emotionImg = UserDefaults.standard.string(forKey: "emotion_img")
        let healthKeyword = UserDefaults.standard.string(forKey: "health_keyword")
        
        emotion.image = UIImage(named: emotionImg!)
        emotionLabel.attributedText = NSMutableAttributedString(string: emotionKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
        
        // 만약 감정, 건강 다 선택한 경우
        if emotionKeyword != nil && healthKeyword != nil {
            // 맨 처음 앱 실행했을 때 오늘 날짜 저장
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let todayString = formatter.string(from: today)
            
            // 알람 생성하기
            let newAlert = Alert(date: todayString, title: "오늘의 키워드를 완성했어요!", script: "오늘의 키워드를 반영한 맞춤형 체크리스트를 확인해 보세요!", isRead: false, vc: "checkVC")
            
            if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                    alerts.insert(newAlert, at: 0)
                }
                UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
            } else {
                UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
            }
            
            
            // 오늘의 감정, 건강에 따른 목표 추가해 주기
            switch emotionKeyword {
            case "감정기복", "두려움", "불안/초조", "스트레스", "슬픔": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "나를 위한 격려 해주기", script: "나를 위한 따뜻한 격려를 해 보세요!\n충분히 잘 하고 있으니까요.", first: false, second: false, third: false))
            case "죄책감", "혼란", "무기력": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "가벼운 운동 하기", script: "가벼운 홈트레이닝도 좋아요.\n지친 몸을 풀어 봅시다!", first: false))
            case "예민/짜증", "우울": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "산책하기", script: "잠깐이라도 광합성은 필수!\n산책 나가 볼까요?", first: false))
            case "분노", "절망감": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "명상 시간 가지기", script: "잠시나마 여유를 챙기며\n스스로의 마음을 살펴 보아요.", first: false))
            default:
                return
            }
            
            switch healthKeyword {
            case "식욕 변화", "배변 장애": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "식사 세 번 챙기기", script: "바쁘고 지치는 하루여도\n끼니 챙기기는 필수예요!", first: false, second: false, third: false))
            case "수면 장애", "복통", "부종", "메스꺼움", "요통", "젖몸살": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "따뜻한 차 세 잔 마시기", script: "지친 몸을 녹여 줄\n따뜻한 티타임을 가져 보아요!", first: false, second: false, third: false))
            case "건망증", "위장장애", "탈모", "질분비물", "관절통", "피부질환": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "영양제 먹기", script: "건강 관리를 위해\n적절한 영양제 섭취는 필수!", first: false))
            case "훗배앓이", "외상", "피로", "두통/어지럼증": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "7시간 이상 취침하기", script: "바쁜 일상일지라도 7시간 이상\n취침하기 위해 노력해 보아요.", first: false, second: false, third: false))
            default:
                return
            }
            
            if UserDefaults.standard.goals(forKey: "goalsDataKey") == nil {
                UserDefaults.standard.setValue(todayGoals[0].title, forKey: "firstGoal")
                UserDefaults.standard.setValue(todayGoals[1].title, forKey: "secondGoal")
                UserDefaults.standard.setGoals(todayGoals, forKey: "goalsDataKey")
            }  else {
                var goals = UserDefaults.standard.goals(forKey: "goalsDataKey") ?? []
                
                // 중복 체크 후 추가
                for goal in todayGoals {
                    if !goals.contains(where: { $0.date == goal.date && $0.title == goal.title }) {
                        goals.append(goal)
                    }
                }
                
                UserDefaults.standard.setValue(todayGoals[0].title, forKey: "firstGoal")
                UserDefaults.standard.setValue(todayGoals[1].title, forKey: "secondGoal")
                UserDefaults.standard.setGoals(goals, forKey: "goalsDataKey")
            }
            
            if let firstGoal = UserDefaults.standard.string(forKey: "firstGoal") {
                goal1.attributedText = NSAttributedString(string: firstGoal, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
            }
            if let secondGoal = UserDefaults.standard.string(forKey: "secondGoal") {
                goal2.attributedText = NSAttributedString(string: secondGoal, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
            }
            
            counter()
        }
    }
    
    @objc func handleHealthUpdate() {
        let emotionKeyword = UserDefaults.standard.string(forKey: "emotion_keyword")
        let healthKeyword = UserDefaults.standard.string(forKey: "health_keyword")
        let healthImg = UserDefaults.standard.string(forKey: "health_img")
        
        health.image = UIImage(named: healthImg!)
        healthLabel.attributedText = NSMutableAttributedString(string: healthKeyword!, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.Blue01!, NSAttributedString.Key.kern: -0.9])
        
        // 만약 감정, 건강 다 선택한 경우
        if emotionKeyword != nil && healthKeyword != nil {
            // 맨 처음 앱 실행했을 때 오늘 날짜 저장
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let todayString = formatter.string(from: today)
            
            // 알람 생성하기
            let newAlert = Alert(date: todayString, title: "오늘의 키워드를 완성했어요!", script: "오늘의 키워드를 반영한 맞춤형 체크리스트를 확인해 보세요!", isRead: false, vc: "checkVC")
            
            if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                    alerts.insert(newAlert, at: 0)
                }
                UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
            } else {
                UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
            }
            
            
            // 오늘의 감정, 건강에 따른 목표 추가해 주기
            switch emotionKeyword {
            case "감정기복", "두려움", "불안/초조", "스트레스", "슬픔": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "나를 위한 격려 해주기", script: "나를 위한 따뜻한 격려를 해 보세요!\n충분히 잘 하고 있으니까요.", first: false, second: false, third: false))
            case "죄책감", "혼란", "무기력": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "가벼운 운동 하기", script: "가벼운 홈트레이닝도 좋아요.\n지친 몸을 풀어 봅시다!", first: false, second: nil, third: nil))
            case "예민/짜증", "우울": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "산책하기", script: "잠깐이라도 광합성은 필수!\n산책 나가 볼까요?", first: false, second: nil, third: nil))
            case "분노", "절망감": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "명상 시간 가지기", script: "잠시나마 여유를 챙기며\n스스로의 마음을 살펴 보아요.", first: false, second: nil, third: nil))
            default:
                return
            }
            
            switch healthKeyword {
            case "식욕 변화", "배변 장애": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "식사 세 번 챙기기", script: "바쁘고 지치는 하루여도\n끼니 챙기기는 필수예요!", first: false, second: false, third: false))
            case "수면 장애", "복통", "부종", "메스꺼움", "요통", "젖몸살": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "따뜻한 차 세 잔 마시기", script: "지친 몸을 녹여 줄\n따뜻한 티타임을 가져 보아요!", first: false, second: false, third: false))
            case "건망증", "위장장애", "탈모", "질분비물", "관절통", "피부질환": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "영양제 먹기", script: "건강 관리를 위해\n적절한 영양제 섭취는 필수!", first: false, second: nil, third: nil))
            case "훗배앓이", "외상", "피로", "두통/어지럼증": todayGoals.append(Goals(date: todayString, img: "check_sample.png", title: "7시간 이상 취침하기", script: "바쁜 일상일지라도 7시간 이상\n취침하기 위해 노력해 보아요.", first: false, second: false, third: false))
            default:
                return
            }
            
            if UserDefaults.standard.goals(forKey: "goalsDataKey") == nil {
                let goals = Goals.data
                UserDefaults.standard.setGoals(goals + todayGoals, forKey: "goalsDataKey")
                UserDefaults.standard.setValue(todayGoals[0].title, forKey: "firstGoal")
                UserDefaults.standard.setValue(todayGoals[1].title, forKey: "secondGoal")
            } else {
                var goals = UserDefaults.standard.goals(forKey: "goalsDataKey") ?? []
                
                // 중복 체크 후 추가
                for goal in todayGoals {
                    if !goals.contains(where: { $0.date == goal.date && $0.title == goal.title }) {
                        goals.append(goal)
                    }
                }
                
                UserDefaults.standard.setValue(todayGoals[0].title, forKey: "firstGoal")
                UserDefaults.standard.setValue(todayGoals[1].title, forKey: "secondGoal")
                UserDefaults.standard.setGoals(goals, forKey: "goalsDataKey")
            }
            
            if let firstGoal = UserDefaults.standard.string(forKey: "firstGoal") {
                goal1.attributedText = NSAttributedString(string: firstGoal, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
            }
            if let secondGoal = UserDefaults.standard.string(forKey: "secondGoal") {
                goal2.attributedText = NSAttributedString(string: secondGoal, attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.kern: -0.8])
            }
            
            counter()
        }
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
    
    // 카운트 함수
    @objc func counter() {
        if let goals = UserDefaults.standard.goals(forKey: "goalsDataKey") {
            goalCnt1.isHidden = false
            goalCnt2.isHidden = false
            
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let todayString = formatter.string(from: today)
            
            let todayGoals = goals.filter { $0.date == todayString }
            
            let firstGoal = todayGoals[0]
            let secondGoal = todayGoals[1]
            
            if firstGoal.second != nil {
                count1 = [firstGoal.first, firstGoal.second!, firstGoal.third!].filter { $0 }.count
                more1 = 3 - count1
                
                if count1 == 0 && more1 == 3 {
                    goalCnt1.attributedText = NSAttributedString(string: "도전하기!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt1.attributedText = NSAttributedString(string: "3번 해 보세요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                } else if count1 > 0 && count1 < 3 {
                    goalCnt1.attributedText = NSAttributedString(string: "\(count1)회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt1.attributedText = NSAttributedString(string: "\(more1)번 더 해 보세요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    
                    if count1 == 2 {
                        // 알람 생성하기
                        let newAlert = Alert(date: todayString, title: "'\(firstGoal.title)' 체크리스트 달성까지 1번 남았어요", script: "마지막 한 번까지 파이팅! :)!", isRead: false, vc: "checkVC")
                        
                        if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                            var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                            if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                                alerts.insert(newAlert, at: 0)
                            }
                            UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                        } else {
                            UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                        }
                    }
                } else if more1 == 0 {
                    goalCnt1.attributedText = NSAttributedString(string: "\(count1)회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt1.attributedText = NSAttributedString(string: "목표에 도달했어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                
                    let newAlert = Alert(date: todayString, title: "'\(firstGoal.title)' 체크리스트를 완성했어요!", script: "정말 대단해요!", isRead: false, vc: "checkVC")
                    
                    if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                        var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                        if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                            alerts.insert(newAlert, at: 0)
                        }
                        UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                    } else {
                        UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                    }
                }
            } else {
                if firstGoal.first {
                    count1 = 1
                    more1 = 0
                    
                    goalCnt1.attributedText = NSAttributedString(string: "\(count1)회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt1.attributedText = NSAttributedString(string: "목표에 도달했어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    
                    let newAlert = Alert(date: todayString, title: "'\(firstGoal.title)' 체크리스트를 완성했어요!", script: "정말 대단해요!", isRead: false, vc: "checkVC")
                    
                    if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                        var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                        if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                            alerts.insert(newAlert, at: 0)
                        }
                        UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                    } else {
                        UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                    }
                } else {
                    count1 = 0
                    more1 = 1
                    
                    goalCnt1.attributedText = NSAttributedString(string: "도전하기!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt1.attributedText = NSAttributedString(string: "\(more1)번 해 보세요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    
                    let newAlert = Alert(date: todayString, title: "'\(firstGoal.title)' 체크리스트를 아직 달성하지 못했어요", script: "체크리스트를 완성하고 내 생활을 알차게 채워봐요!", isRead: false, vc: "checkVC")
                    
                    if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                        var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                        if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                            alerts.insert(newAlert, at: 0)
                        }
                        UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                    } else {
                        UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                    }
                }
            }
            
            if secondGoal.second != nil {
                count2 = [secondGoal.first, secondGoal.second!, secondGoal.third!].filter { $0 }.count
                more2 = 3 - count2
                
                if count2 == 0 && more2 == 3 {
                    goalCnt2.attributedText = NSAttributedString(string: "도전하기!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt2.attributedText = NSAttributedString(string: "3번 해 보세요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                } else if count2 > 0 && count2 < 3 {
                    goalCnt2.attributedText = NSAttributedString(string: "\(count2)회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt2.attributedText = NSAttributedString(string: "\(more2)번 더 해 보세요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    
                    if count2 == 2 {
                        let newAlert = Alert(date: todayString, title: "'\(secondGoal.title)' 체크리스트 달성까지 1번 남았어요", script: "마지막 한 번까지 파이팅! :)!", isRead: false, vc: "checkVC")
                        
                        if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                            var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                            if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                                alerts.insert(newAlert, at: 0)
                            }
                            UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                        } else {
                            UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                        }
                    }
                } else if more2 == 0 {
                    goalCnt2.attributedText = NSAttributedString(string: "\(count2)회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt2.attributedText = NSAttributedString(string: "목표에 도달했어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    let newAlert = Alert(date: todayString, title: "'\(secondGoal.title)' 체크리스트를 완성했어요!", script: "정말 대단해요!", isRead: false, vc: "checkVC")
                    
                    if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                        var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                        if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                            alerts.insert(newAlert, at: 0)
                        }
                        UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                    } else {
                        UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                    }
                }
                
            } else {
                if secondGoal.first {
                    count2 = 1
                    more2 = 0
                    
                    goalCnt2.attributedText = NSAttributedString(string: "\(count2)회 완료!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt2.attributedText = NSAttributedString(string: "목표에 도달했어요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    let newAlert = Alert(date: todayString, title: "'\(secondGoal.title)' 체크리스트를 완성했어요!", script: "정말 대단해요!", isRead: false, vc: "checkVC")
                    
                    if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                        var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                        if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                            alerts.insert(newAlert, at: 0)
                        }
                        UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                    } else {
                        UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                    }
                } else {
                    count2 = 0
                    more2 = 1
                    
                    goalCnt2.attributedText = NSAttributedString(string: "도전하기!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 14)!, NSAttributedString.Key.kern: -0.7])
                    moreCnt2.attributedText = NSAttributedString(string: "\(more2)번 해 보세요!", attributes: [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 10)!, NSAttributedString.Key.kern: -0.5])
                    
                    let newAlert = Alert(date: todayString, title: "'\(secondGoal.title)' 체크리스트를 아직 달성하지 못했어요", script: "체크리스트를 완성하고 내 생활을 알차게 채워봐요!", isRead: false, vc: "checkVC")
                    
                    if UserDefaults.standard.alerts(forKey: "alertsDataKey") != nil {
                        var alerts = UserDefaults.standard.alerts(forKey: "alertsDataKey")!
                        if !alerts.contains(where: { $0.date == newAlert.date && $0.title == newAlert.title }) {
                            alerts.insert(newAlert, at: 0)
                        }
                        UserDefaults.standard.setAlerts(alerts, forKey: "alertsDataKey")
                    } else {
                        UserDefaults.standard.setAlerts([newAlert], forKey: "alertsDataKey")
                    }
                }
            }
        }
    }
    
    @objc func handleProfileUpdate() {
        if let name = UserDefaults.standard.string(forKey: "user_name") {
            let originalString = "\(name) 님,\n오늘도 힘내세요!"
            
            // 원본 문자열을 NSAttributedString으로 변환
            let attributedString = NSMutableAttributedString(string: originalString)
            
            // '파랑' 단어의 범위 찾기
            if let range = originalString.range(of: "\(name)") {
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
