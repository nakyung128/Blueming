//
//  EditPwdViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/30.
//

import UIKit

class EditPwdViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var script: UILabel!
    @IBOutlet var nowPwd: UITextField!
    @IBOutlet var newPwd: UITextField!
    @IBOutlet var reNewPwd: UITextField!
    @IBOutlet var finishBtn: UIButton!
    
    @IBAction func finish(_ sender: Any) {
        // 비밀번호 일치하지 않을 때
        if newPwd.text != reNewPwd.text {
            let alert = UIAlertController(title: "새로운 비밀번호를 다시 입력해 주세요", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else if newPwd.text == "" || reNewPwd.text == "" || nowPwd.text == "" {
            let alert = UIAlertController(title: "비어 있는 칸이 존재합니다", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // 입력 시 텍스트필드 테두리 색상 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nowPwd {
            nowPwd.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        } else if textField == newPwd {
            newPwd.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        } else {
            reNewPwd.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nowPwd {
            nowPwd.setOriginalBorderColor(color: UIColor.Text05!)
        } else if textField == newPwd {
            newPwd.setOriginalBorderColor(color: UIColor.Text05!)
        } else {
            reNewPwd.setOriginalBorderColor(color: UIColor.Text05!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 타이틀 자간, 행간 설정
        script.lineBreakMode = .byWordWrapping
        script.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        script.attributedText = NSMutableAttributedString(string: "변경할 비밀번호를\n입력해 주세요.", attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        nowPwd.borderStyle = .none
        nowPwd.setOriginalBorderColor(color: UIColor.Text05!)
        
        newPwd.borderStyle = .none
        newPwd.setOriginalBorderColor(color: UIColor.Text05!)
        
        reNewPwd.borderStyle = .none
        reNewPwd.setOriginalBorderColor(color: UIColor.Text05!)
        
        // 텍스트필드 왼쪽 여백 만들기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: nowPwd.frame.height))
        
        nowPwd.leftView = paddingView
        nowPwd.leftViewMode = .always
        
        newPwd.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: newPwd.frame.height))
        newPwd.leftViewMode = .always
        
        reNewPwd.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: reNewPwd.frame.height))
        reNewPwd.leftViewMode = .always
        
        nowPwd.attributedPlaceholder = NSAttributedString(string: "현재 비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        newPwd.attributedPlaceholder = NSAttributedString(string: "신규 비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        reNewPwd.attributedPlaceholder = NSAttributedString(string: "신규 비밀번호 재확인", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        // 초기 상태 버튼
        finishBtn.applyOriginToButton(color: UIColor.Text05!)
        
        // editingChanged 이벤트를 위한 타겟-액션 설정
        nowPwd.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        newPwd.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        reNewPwd.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 이메일과 비밀번호 텍스트필드의 현재 값 가져오기
        let pwd = nowPwd.text ?? ""
        let newPwd = newPwd.text ?? ""
        let reNew = reNewPwd.text ?? ""
        
        // 둘 중 하나라도 비어 있으면
        if pwd.isEmpty || newPwd.isEmpty || reNew.isEmpty {
            finishBtn.applyOriginToButton(color: UIColor.Text05!)
        } else {
            finishBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        }
    }

}
