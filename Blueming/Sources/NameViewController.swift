import UIKit

class NameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var script: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var nameBtn: UIButton!
    
    // 다음 (홈으로 이동)
    @IBAction func goToMain(_ sender: Any) {
        if nameField.text == "" {
            let alert = UIAlertController(title: "닉네임을 입력해 주세요", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            // UserDefaults에 닉네임 저장
            let dataSave = UserDefaults.standard
            dataSave.setValue(self.nameField.text, forKey: "user_name")
            UserDefaults.standard.synchronize()
            
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC")
            vcName?.modalPresentationStyle = .fullScreen
            vcName?.modalTransitionStyle = .crossDissolve
            self.present(vcName!, animated: true, completion: nil)
        }
    }
    
    // 입력 시 텍스트필드 테두리 색상 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameField.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameField.setOriginalBorderColor(color: UIColor.Text05!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self

        // 타이틀 자간, 행간 설정
        script.lineBreakMode = .byWordWrapping
        script.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.26
        script.attributedText = NSMutableAttributedString(string: "블루밍에서 사용할\n닉네임을 입력해 주세요.", attributes: [NSAttributedString.Key.kern: -1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        nameField.borderStyle = .none
        nameField.setOriginalBorderColor(color: UIColor.Text05!)
        
        // 텍스트필드 왼쪽 여백 만들기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: nameField.frame.height))
        
        nameField.leftView = paddingView
        nameField.leftViewMode = .always
        
        nameField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        // 초기 상태 버튼
        nameBtn.applyOriginToButton(color: UIColor.Text05!)
        
        // editingChanged 이벤트를 위한 타겟-액션 설정
        nameField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 닉네임 텍스트필드의 현재 값 가져오기
        let name = nameField.text ?? ""
        
        // 둘 중 하나라도 비어 있으면
        if name.isEmpty  {
            nameBtn.applyOriginToButton(color: UIColor.Text05!)
        } else {
            nameBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        }
    }

}
