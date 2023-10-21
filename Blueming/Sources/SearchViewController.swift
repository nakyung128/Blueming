//
//  SearchViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/27.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    enum SearchState {
        case idle
        case result
    }
    
    // 모든 데이터
    let allData = Article.allData
    
    // 필터링된 데이터 담을 배열
    var list: [Article] = []
    
    @IBOutlet var backBtn: UIImageView!
    @IBOutlet var searchField: UITextField!
    @IBOutlet var searchBtn: UIImageView!
    
    @IBOutlet var recLabel: UILabel!
    @IBOutlet var famLabel: UILabel!
    @IBOutlet var recommendView: UIStackView!
    @IBOutlet var famousView: UIStackView!
    
    @IBOutlet var resultTableView: UITableView!
    @IBOutlet var noResult: UILabel!
    
    let recommendData = Keyword.recommend
    let famousData1 = Keyword.famous1
    let famousData2 = Keyword.famous2
    
    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        if let labelText = label.text {
            label.attributedText = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: -0.7])
        } else { }
        label.textColor = .Text03
        
        return label
    }()
    
    // 현재 검색 상태
    var currentState: SearchState = .idle {
        didSet {
            updateViewForState()
        }
    }
    
    func updateViewForState() {
        switch currentState {
        case .idle:
            recommendView.isHidden = false
            famousView.isHidden = false
            recLabel.isHidden = false
            famLabel.isHidden = false
            noResult.isHidden = true
            resultTableView.isHidden = true
        case .result:
            recommendView.isHidden = true
            famousView.isHidden = true
            recLabel.isHidden = true
            famLabel.isHidden = true
            
            if list.isEmpty {
                resultTableView.isHidden = true
                noResult.isHidden = false
            } else {
                resultTableView.isHidden = false
                noResult.isHidden = true
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "article-back.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가
        view.insertSubview(backgroundImage, at: 0)
        
        // 검색어를 기반으로 데이터 필터링
        if let searchText = searchField.text, !searchText.isEmpty {
            list = allData.filter {$0.title.contains(searchText)}
            currentState = .result
        } else {
            list = []
            currentState = .result
        }
        resultTableView.reloadData()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.delegate = self
        
        // 검색 필드 스타일
        searchField.attributedPlaceholder = NSAttributedString(string: "어떤 아티클을 찾고 계신가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        searchField.borderStyle = .none
        searchField.backgroundColor = UIColor.white
        
        // corner Radius
        searchField.layer.cornerRadius = 18
        searchField.layer.borderColor = UIColor.white.cgColor
        searchField.layer.borderWidth = 1
        
        // shadow
        searchField.layer.shadowOpacity = 0.7
        searchField.layer.shadowRadius = 5
        searchField.layer.shadowOffset = CGSize(width: 0, height: 0)
        searchField.layer.shadowColor = UIColor(red: 0.835, green: 0.898, blue: 1, alpha: 1).cgColor
        
        // padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: searchField.frame.height))
        
        searchField.leftView = paddingView
        searchField.leftViewMode = .always
        
        // 이전 화면으로 이동
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(back))
        backBtn.isUserInteractionEnabled = true
        backBtn.addGestureRecognizer(tapGesture)
        
        recLabel.attributedText = NSAttributedString(string: "추천 키워드", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-Semibold", size: 16)!])
        famLabel.attributedText = NSAttributedString(string: "많이 찾는 검색어", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.font: UIFont(name: "Pretendard-Semibold", size: 16)!])
        
        // 추천 키워드 라벨 추가
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        
        for i in 0..<4 {
            let label = KeywordLabel()
            label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            if let labelText = label.text {
                label.attributedText = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: -0.7])
            } else { }
            label.textColor = .Text03
            label.text = recommendData[i].keyword
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 17
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.Text05!.cgColor
            stackView.addArrangedSubview(label)
        }
        
        recommendView.addArrangedSubview(stackView)
        
        
        // 많이 찾는 검색어 라벨 추가
        let famous1 = UIStackView()
        famous1.axis = .horizontal
        famous1.spacing = 5
        famous1.distribution = .fill
        famous1.alignment = .fill
        
        let famous2 = UIStackView()
        famous2.axis = .horizontal
        famous2.spacing = 5
        famous2.distribution = .fill
        famous2.distribution = .fill
        
        for i in 0..<4 {
            let label = KeywordLabel()
            label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            if let labelText = label.text {
                label.attributedText = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: -0.7])
            } else { }
            label.textColor = .Text03
            label.text = famousData1[i].keyword
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 17
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.Text05!.cgColor
            famous1.addArrangedSubview(label)
        }
        
        for i in 0..<5 {
            let label = KeywordLabel()
            label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            if let labelText = label.text {
                label.attributedText = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: -0.7])
            } else { }
            label.textColor = .Text03
            label.text = famousData2[i].keyword
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 17
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.Text05!.cgColor
            famous2.addArrangedSubview(label)
        }
        
        // 두 줄의 폭을 맞춰주기 위해서
        let dummyView1 = UIView()
        famous1.addArrangedSubview(dummyView1)
        
        let dummyView2 = UIView()
        famous2.addArrangedSubview(dummyView2)
        
        famousView.addArrangedSubview(famous1)
        famousView.addArrangedSubview(famous2)
        
        // 검색
        let tap = UITapGestureRecognizer(target: self, action: #selector(search))
        searchBtn.isUserInteractionEnabled = true
        searchBtn.addGestureRecognizer(tap)
        
        updateViewForState()
        
        let nibName = UINib(nibName: "MainArticleCell", bundle: nil)
        resultTableView.register(nibName, forCellReuseIdentifier: "mainCell")
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        resultTableView.backgroundColor = .clear
        resultTableView.separatorStyle = .none // table view 구분선 없애기
        resultTableView.keyboardDismissMode = .onDrag
        
        // 탭 제스처 인식기 생성 및 설정
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGesture2.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture2)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // 아티클 검색
    @objc func search(sender: UITapGestureRecognizer) {
        
        searchField.resignFirstResponder()
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "article-back.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가
        view.insertSubview(backgroundImage, at: 0) 
        
        // 검색어를 기반으로 데이터 필터링
        if let searchText = searchField.text, !searchText.isEmpty {
            list = allData.filter {$0.title.contains(searchText)}
            currentState = .result
        } else {
            list = []
            currentState = .result
        }
        resultTableView.reloadData()
    }
    
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
    
    // 검색 화면으로 이동
    @objc func back(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
