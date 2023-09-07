//
//  HomeViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var keywordLabel: UILabel!
    @IBOutlet var emotionLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    @IBOutlet var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "backImg.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정

        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 원본 문자열
        let originalString = "수림 님,\n오늘도 힘내세요!"

        // 원본 문자열을 NSAttributedString으로 변환
        let attributedString = NSMutableAttributedString(string: originalString)

        // '수림' 단어의 범위 찾기
        if let range = originalString.range(of: "수림") {
            let nsRange = NSRange(range, in: originalString)
            
            // 색상을 변경할 부분에 대한 속성을 설정
            let colorAttribute: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(named: "blueming") ?? UIColor.blue // 원하는 색상으로 변경
            ]
            
            attributedString.addAttributes(colorAttribute, range: nsRange)
        }

        // 나머지 텍스트에 대한 스타일을 설정합니다.
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        attributedString.addAttributes([NSAttributedString.Key.kern: -1.2, NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attributedString.length))
        
        mainLabel.attributedText = attributedString
        
        keywordLabel.attributedText = NSMutableAttributedString(string: "✍🏻 오늘의 키워드", attributes: [NSAttributedString.Key.kern: -0.8])
        targetLabel.attributedText = NSMutableAttributedString(string: "💙 오늘의 목표", attributes: [NSAttributedString.Key.kern: -0.8])
        
        // Create the first view
//        let view1 = createViewWithShadowsAndShapes(parent: self.view, leadingConstant: 20, topConstant: keywordLabel.bottomAnchor, Constant: 10)
//
//        // Create the second view
//        let view2 = createViewWithShadowsAndShapes(parent: self.view, leadingConstant: 202, topConstant: mainLabel.bottomAnchor, Constant: 61)
        
        emotionLabel.textColor = UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1)
        emotionLabel.font = UIFont(name: "Pretendard-Bold", size: 14)
        emotionLabel.attributedText = NSMutableAttributedString(string: "오늘의 감정", attributes: [NSAttributedString.Key.kern: -0.7])
        
        healthLabel.textColor = UIColor(red: 0.342, green: 0.342, blue: 0.342, alpha: 1)
        healthLabel.font = UIFont(name: "Pretendard-Bold", size: 14)
        healthLabel.attributedText = NSMutableAttributedString(string: "오늘의 건강", attributes: [NSAttributedString.Key.kern: -0.7])

    }
    
    func createViewWithShadowsAndShapes(parent: UIView, leadingConstant: CGFloat, topConstant: NSLayoutAnchor<NSLayoutYAxisAnchor>, Constant: CGFloat) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 168, height: 186)
        
        let shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)
        
        let shadowPath = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
        let shadowLayer = CALayer()
        shadowLayer.shadowPath = shadowPath.cgPath
        shadowLayer.shadowColor = UIColor(red: 0.579, green: 0.697, blue: 1, alpha: 0.2).cgColor
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 9
        shadowLayer.shadowOffset = CGSize(width: 0, height: 4)
        shadowLayer.bounds = shadows.bounds
        shadowLayer.position = shadows.center
        shadows.layer.addSublayer(shadowLayer)
        
        let shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)
        
        let shapeLayer = CALayer()
        shapeLayer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        shapeLayer.bounds = shapes.bounds
        shapeLayer.position = shapes.center
        shapes.layer.addSublayer(shapeLayer)
        
        shapes.layer.cornerRadius = 20
        
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 168).isActive = true
        view.heightAnchor.constraint(equalToConstant: 186).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: leadingConstant).isActive = true
        view.topAnchor.constraint(equalTo: topConstant, constant: Constant).isActive = true
        
        return view
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
