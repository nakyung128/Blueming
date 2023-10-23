import UIKit

class MypageViewController: UIViewController {

    @IBOutlet var editBtn: UIButton!
    
    @IBOutlet var editPwd: UIImageView!
    @IBOutlet var logOut: UIImageView!
    @IBOutlet var signOut: UIImageView!
    @IBOutlet var profile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(handleProfileUpdate), name: .profileUpdated, object: nil)
        
        // 뒤로가기 색상 변경
        navigationController?.navigationBar.tintColor = .Text01
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        let title = "프로필 편집"
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttributes([NSAttributedString.Key.kern: -0.4, NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 8)!], range: NSRange(location: 0, length: title.count))
        editBtn.setAttributedTitle(attributedString, for: .normal)
        
        // 비밀번호 변경 화면으로 이동
        let gesture = UITapGestureRecognizer(target: self, action: #selector(edit))
        editPwd.isUserInteractionEnabled = true
        editPwd.addGestureRecognizer(gesture)
        
        // 로그아웃 팝업 띄우기
        let logoutGesture = UITapGestureRecognizer(target: self, action: #selector(logout))
        logOut.isUserInteractionEnabled = true
        logOut.addGestureRecognizer(logoutGesture)
        
        // 회원 탈퇴 팝업 띄우기
        let signoutGesture = UITapGestureRecognizer(target: self, action: #selector(signout))
        signOut.isUserInteractionEnabled = true
        signOut.addGestureRecognizer(signoutGesture)
        
        // 이미지 불러오기
        let fileManager = FileManager.default

        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imagePath = documentDirectory.appendingPathComponent("savedImg.png")
            
            if let loadedImageData = try? Data(contentsOf: imagePath) {
                let loadedImage = UIImage(data: loadedImageData)
                // 이미지 원형으로 표시
                profile.layer.cornerRadius = self.profile.frame.height/2
                profile.layer.borderWidth = 1
                profile.clipsToBounds = true
                profile.layer.borderColor = UIColor.clear.cgColor
                profile.image = loadedImage
            }
        }
    }
    
    // 옵저버 해제
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleProfileUpdate() {
        // 이미지 불러오기
        let fileManager = FileManager.default

        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imagePath = documentDirectory.appendingPathComponent("savedImg.png")
            
            if let loadedImageData = try? Data(contentsOf: imagePath) {
                let loadedImage = UIImage(data: loadedImageData)
                // 이미지 원형으로 표시
                profile.layer.cornerRadius = self.profile.frame.height/2
                profile.layer.borderWidth = 1
                profile.clipsToBounds = true
                profile.layer.borderColor = UIColor.clear.cgColor
                profile.image = loadedImage
            }
        }
    }
    
    @objc func edit(sender: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "EditPwdVC") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logout(sender: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "logoutVC") else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func signout(sender: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "signoutVC") else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

}
