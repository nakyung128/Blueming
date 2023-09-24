//
//  PwdViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/23.
//

import UIKit

class PwdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var script: UILabel!
    @IBOutlet var passField: UITextField!
    @IBOutlet var repassField: UITextField!
    @IBOutlet var pwdBtn: UIButton!
    
    @IBAction func goToName(_ sender: Any) {
        // 비밀번호 일치하지 않을 때
        if passField.text != repassField.text {
            let alert = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "다시 한 번 입력해 주세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else if passField.text == "" || repassField.text == "" {
            let alert = UIAlertController(title: "비밀번호를 입력해 주세요", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "nameVC") else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    // 입력 시 텍스트필드 테두리 색상 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passField {
            passField.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        } else {
            repassField.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passField {
            passField.setOriginalBorderColor(color: UIColor.Text05!)
        } else {
            repassField.setOriginalBorderColor(color: UIColor.Text05!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        passField.delegate = self
        repassField.delegate = self
        
        // 타이틀 자간, 행간 설정
        script.lineBreakMode = .byWordWrapping
        script.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        script.attributedText = NSMutableAttributedString(string: "로그인에 사용할\n비밀번호를 입력해 주세요.", attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        passField.borderStyle = .none
        passField.setOriginalBorderColor(color: UIColor.Text05!)
        
        repassField.borderStyle = .none
        repassField.setOriginalBorderColor(color: UIColor.Text05!)
        
        // 텍스트필드 왼쪽 여백 만들기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: passField.frame.height))
        
        passField.leftView = paddingView
        passField.leftViewMode = .always
        
        repassField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: repassField.frame.height))
        repassField.leftViewMode = .always
        
        // 초기 상태 버튼
        pwdBtn.applyOriginToButton(color: UIColor.Text05!)
        
        // editingChanged 이벤트를 위한 타겟-액션 설정
        passField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        repassField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 이메일과 비밀번호 텍스트필드의 현재 값 가져오기
        let pwd = passField.text ?? ""
        let rePwd = repassField.text ?? ""
        
        // 둘 중 하나라도 비어 있으면
        if pwd.isEmpty || rePwd.isEmpty {
            pwdBtn.applyOriginToButton(color: UIColor.Text05!)
        } else {
            pwdBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        }
    }
    
}
