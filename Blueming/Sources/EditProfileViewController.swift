//
//  EditProfileViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/30.
//

import UIKit

class EditProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var editProfile: UIButton!
    @IBOutlet var nickname: UITextField!
    @IBOutlet var finishBtn: UIButton!
    
    // 프로필 사진 수정 버튼 클릭 시
    @IBAction func editImg(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "프로필 사진 설정", preferredStyle: .actionSheet)
        // 이미지 피커 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        alert.addAction(UIAlertAction(title: "앨범에서 선택", style: .default) {
            (_) in self.present(picker, animated: false)
        })
        alert.addAction(UIAlertAction(title: "카메라로 촬영", style: .default) {
            (_) in picker.sourceType = .camera
            self.present(picker, animated: true)
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    // 이미지 선택 완료했을 때 호출하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 선택한 이미지를 미리보기에 표시
        self.profileImg.image = info[.editedImage] as? UIImage
        
        // 이미지 저장
        let img = self.profileImg.image
        let imageData = img?.pngData()
        let fileManager = FileManager.default
        
        // 샌드박스의 Document 디렉토리 경로를 가져옵니다.
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imagePath = documentDirectory.appending(path: "savedImg.png")
            
            // 이미지 저장
            do {
                try imageData?.write(to: imagePath)
                print("이미지 저장 완료")
            } catch {
                print("이미지 저장 에러: ", error)
            }
        }
        
        // 버튼 색상 변경
        finishBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))

        // 이미지 피커 컨트롤러 닫기
        picker.dismiss(animated: false)
    }
    
    // 완료 버튼 클릭 시
    @IBAction func finish(_ sender: Any) {
        // 프로필 화면으로 돌아가기
        // 마이페이지로 이동
        NotificationCenter.default.post(name: .profileUpdated, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    // 입력 시 텍스트필드 테두리 색상 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nickname.setGradientBorderColor(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nickname.setOriginalBorderColor(color: UIColor.Text05!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // 이미지 불러오기
        let fileManager = FileManager.default

        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imagePath = documentDirectory.appendingPathComponent("savedImg.png")
            
            if let loadedImageData = try? Data(contentsOf: imagePath) {
                let loadedImage = UIImage(data: loadedImageData)
                // 이미지 원형으로 표시
                profileImg.image = loadedImage
                profileImg.layer.cornerRadius = self.profileImg.frame.height/2
                profileImg.layer.borderWidth = 1
                profileImg.clipsToBounds = true
                profileImg.layer.borderColor = UIColor.clear.cgColor
            }
        }
        
        nickname.borderStyle = .none
        nickname.setOriginalBorderColor(color: UIColor.Text05!)
        
        // 텍스트필드 왼쪽 여백 만들기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: nickname.frame.height))
        
        nickname.leftView = paddingView
        nickname.leftViewMode = .always
        
        nickname.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.Text03!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 14)!, NSAttributedString.Key.kern: -0.7])
        
        // 초기 상태 버튼
        finishBtn.applyOriginToButton(color: UIColor.Text05!)
        
        // editingChanged 이벤트를 위한 타겟-액션 설정
        nickname.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        // 닉네임 수정 버튼 스타일
        editProfile.layer.borderColor = UIColor.Blue01?.cgColor
        editProfile.layer.borderWidth = 1
        editProfile.layer.cornerRadius = 16
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        // 닉네임 텍스트필드의 현재 값 가져오기
        let name = nickname.text ?? ""
        
        if name.isEmpty  {
            finishBtn.applyOriginToButton(color: UIColor.Text05!)
        } else {
            finishBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        }
    }
    
}
