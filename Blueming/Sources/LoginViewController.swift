//
//  LoginViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/20.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    
    @IBAction func login(_ sender: Any) {
        // 홈으로 이동
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
    // 입력 시 텍스트필드 테두리 색상 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailField {
            emailField.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        } else {
            passField.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailField {
            emailField.setOriginalBorderColor(color: UIColor.Text05!)
        } else {
            passField.setOriginalBorderColor(color: UIColor.Text05!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passField.delegate = self
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "LoginBack.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 텍스트필드 스타일 설정
        emailField.borderStyle = .none
        emailField.setOriginalBorderColor(color: UIColor.Text05!)
        
        passField.borderStyle = .none
        passField.setOriginalBorderColor(color: UIColor.Text05!)
        
        // 텍스트필드 왼쪽 여백 만들기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: emailField.frame.height))
        
        emailField.leftView = paddingView
        emailField.leftViewMode = .always
        
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: passField.frame.height))
        passField.leftViewMode = .always
        
        // 초기 상태 버튼
        loginBtn.applyOriginToButton(color: UIColor.Text05!)
        
        // editingChanged 이벤트를 위한 타겟-액션 설정
        emailField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 이메일과 비밀번호 텍스트필드의 현재 값 가져오기
        let email = emailField.text ?? ""
        let pw = passField.text ?? ""
        
        // 둘 중 하나라도 비어 있으면
        if email.isEmpty || pw.isEmpty {
            loginBtn.applyOriginToButton(color: UIColor.Text05!)
        } else {
            loginBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        }
    }
}

extension UITextField {
    private func applyGradientBorder(colors: [CGColor]) {
        let lineWidth: CGFloat = 2
        let rect = self.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 14)
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        self.layer.addSublayer(gradient)
    }
    
    private func applyOriginalBorder(color: UIColor) {
        let rect = self.bounds.insetBy(dx: 1, dy: 1)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 14)
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        
        shape.path = path.cgPath
        shape.strokeColor = UIColor.Text05?.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(shape)
    }
    
    func setGradientBorderColor(colors: [CGColor]) {
        self.layer.sublayers?.removeAll { $0 is CAShapeLayer }
        applyGradientBorder(colors: colors)
    }
    
    func setOriginalBorderColor(color: UIColor) {
        self.layer.sublayers?.removeAll { $0 is CAGradientLayer }
        applyOriginalBorder(color: color)
    }
}
