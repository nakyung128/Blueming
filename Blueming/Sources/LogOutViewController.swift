import UIKit

class LogOutViewController: UIViewController {
    
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var okBtn: UIButton!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ok(_ sender: Any) {
        UserDefaults.standard.setValue("", forKey: "user_email")
        UserDefaults.standard.setValue("", forKey: "user_pwd")
        
        // 메인 화면으로 돌아가기
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        
        // dismiss 후에 메인 화면으로 돌아가기
        dismiss(animated: true) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = vcName
                window.makeKeyAndVisible()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 상태 버튼
        cancelBtn.applyOriginToButton(color: UIColor.Text05!)
        okBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
    }

}
