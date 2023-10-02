//
//  QuestionViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/10/02.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var totalScore: Int = 0
    
    @IBOutlet var nextBtn: UIButton!
    
    @IBAction func next(_ sender: Any) {
        // 다음 질문으로 넘어갑니다.
        if currentQuestionIndex < maxQuestions {
            currentQuestionIndex += 1
            // 각 답변당 점수
            totalScore += answerData[currentQuestionIndex-1].point[selectedIndex!.row]
            updateUI()
            selectedIndex = nil
            answerTableView.reloadData()
        } else {
            totalScore += answerData[currentQuestionIndex-1].point[selectedIndex!.row]
            UserDefaults.standard.setValue("\(totalScore)점", forKey: "score")
            guard let vc = self.storyboard?.instantiateViewController(identifier: "resultVC") else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // 답변 데이터
    let answerData = Answer.data
    
    // 선택한 인덱스
    var selectedIndex: IndexPath?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.nextBtn.applyOriginToButton(color: .Text05!)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! AnswerCell
        let target = answerData[currentQuestionIndex-1].answer[indexPath.row]
        
        cell.answer.text = target
        
        if indexPath == selectedIndex {
            cell.configureSelectedState()
        } else {
            cell.configureDeselectedState()
        }
        
        cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AnswerCell else { return }
        selectedIndex = indexPath
        cell.configureSelectedState()
        nextBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AnswerCell else { return }
        cell.configureDeselectedState()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerTableView: UITableView!
    
    // 진행 상태를 저장하는 변수
    var currentQuestionIndex: Int = 1 {
        didSet {
            updateUI()
        }
    }
    
    // 최대 질문 수
    let maxQuestions = 10
    
    // 질문 배열
    let questions = ["우스운 것이 눈에 잘 띄고\n웃을 수 있었나요?", "어떤 일들을\n기쁜 마음으로 기다렸나요?",  "어떠한 일이 잘못될 때\n공연히 자신을 탓했나요?", "특별한 이유 없이\n불안하거나 걱정스러웠나요?", "특별한 이유 없이\n무섭거나 안절부절 못했나요?", "지난 일주일 간\n많은 일들이 힘겹게 느껴졌나요?", "너무 불행하다고 느껴져\n잠을 잘 수 없었나요?", "슬프거나 비참하다고\n느껴졌나요?", "내 자신이 불행하다고 느껴져\n운 적이 있나요?", "자해하고 싶은 마음이\n생긴 적이 있나요?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "question_background.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 탭 바 없애기
        self.tabBarController?.tabBar.isHidden = true
        
        let nibName = UINib(nibName: "AnswerCell", bundle: nil)
        answerTableView.register(nibName, forCellReuseIdentifier: "answerCell")
        
        // delegate 상속
        answerTableView.delegate = self
        answerTableView.dataSource = self
        
        answerTableView.backgroundColor = .clear
        answerTableView.separatorStyle = .none // table view 구분선 없애기
        answerTableView.isScrollEnabled = false
        
        nextBtn.applyOriginToButton(color: .Text05!)
        
        // 약간의 딜레이 후 팝업 띄우기
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let popup = QuestionPopUp(nibName: "QuestionPopUp", bundle: nil)
            popup.modalPresentationStyle = .overCurrentContext
            self.present(popup, animated: false)
        }
        
    }
    
    // UI 업데이트
    func updateUI() {
        progressLabel.text = "\(currentQuestionIndex) / \(maxQuestions)"
        progressBar.setProgress(Float(currentQuestionIndex) / Float(maxQuestions), animated: true)
        
        questionLabel.numberOfLines = 0
        questionLabel.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        questionLabel.attributedText = NSMutableAttributedString(string: questions[currentQuestionIndex-1], attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        if currentQuestionIndex == 10 {
            let attributedTitle = NSMutableAttributedString(string: "결과 확인", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.white])
            nextBtn.setAttributedTitle(attributedTitle, for: .normal)
        }
    }
    
}
