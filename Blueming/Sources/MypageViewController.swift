//
//  MypageViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/09.
//

import UIKit

class MypageViewController: UIViewController {

    @IBOutlet var editBtn: UIButton!
    
    @IBOutlet var editPwd: UIImageView!
    @IBOutlet var logOut: UIImageView!
    @IBOutlet var signOut: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    @objc func edit(sender: UITapGestureRecognizer) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "EditPwdVC") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
