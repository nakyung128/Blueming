//
//  SearchViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/27.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var backBtn: UIImageView!
    @IBOutlet var searchField: UITextField!
    
    @IBOutlet var recommendView: UIStackView!
    @IBOutlet var famousView: UIStackView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        // 검색 화면으로 이동
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(back))
        backBtn.isUserInteractionEnabled = true
        backBtn.addGestureRecognizer(tapGesture)
        
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
        
    }
    
    // 검색 화면으로 이동
    @objc func back(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }

}
