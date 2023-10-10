//
//  NoteViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/09.
//

import UIKit

class CheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정

        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
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
