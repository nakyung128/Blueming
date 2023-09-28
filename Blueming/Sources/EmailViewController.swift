//
//  SignUpViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/23.
//

import UIKit

class EmailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var script: UILabel!
    @IBOutlet var email: UITextField!
    @IBOutlet var nextBtn: UIButton!
    
    @IBAction func goToPwd(_ sender: Any) {
        if email.text == "" {
            let alert = UIAlertController(title: "이메일을 입력해 주세요", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "pwdVC") else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // 입력 시 텍스트필드 테두리 색상 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        email.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        email.setOriginalBorderColor(color: UIColor.Text05!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        email.delegate = self
        
        // 타이틀 자간, 행간 설정
        script.lineBreakMode = .byWordWrapping
        script.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        script.attributedText = NSMutableAttributedString(string: "로그인에 사용할\n이메일을 입력해 주세요.", attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        email.borderStyle = .none
        email.setOriginalBorderColor(color: UIColor.Text05!)
        
        // 텍스트필드 왼쪽 여백 만들기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: email.frame.height))
        
        email.leftView = paddingView
        email.leftViewMode = .always
        
        email.attributedPlaceholder = NSAttributedString(string: "이메일", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        // 초기 상태 버튼
        nextBtn.applyOriginToButton(color: UIColor.Text05!)
        
        // editingChanged 이벤트를 위한 타겟-액션 설정
        email.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 이메일과 비밀번호 텍스트필드의 현재 값 가져오기
        let email = email.text ?? ""
        
        // 둘 중 하나라도 비어 있으면
        if email.isEmpty  {
            nextBtn.applyOriginToButton(color: UIColor.Text05!)
        } else {
            nextBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        }
    }
    
}
