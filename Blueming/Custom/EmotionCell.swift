//
//  EmotionCell.swift
//  Blueming
//
//  Created by 이나경 on 10/18/23.
//

import UIKit

class EmotionCell: UICollectionViewCell {
    
//    private var gradientLayer: CAGradientLayer?
//    
//    func setGradientBorder(colors: [CGColor], width: CGFloat) {
//        // 기존 그라데이션 레이어 제거
//        gradientLayer?.removeFromSuperlayer()
//        
//        // 그라데이션 레이어 생성
//        let gradient = CAGradientLayer()
//        gradient.frame = bounds
//        gradient.colors = colors
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//        
//        let shape = CAShapeLayer()
//        shape.lineWidth = width
//        shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//        
//        gradient.mask = shape
//        layer.addSublayer(gradient)
//        gradientLayer = gradient
//    }
//    
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                setGradientBorder(colors: [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor], width: 5)
//            } else {
//                gradientLayer?.removeFromSuperlayer()
//                gradientLayer = nil
//            }
//        }
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        gradientLayer?.removeFromSuperlayer()
//        gradientLayer = nil
//    }
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var emotion: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setViewShadow(backView: view)
        configureCell()
    }
    
    func configureCell() {
        // Attributed 문자열을 생성하고 자간을 설정합니다.
        let attributedText = NSAttributedString(string: emotion.text ?? "", attributes: [NSAttributedString.Key.kern: -0.7])
        
        // 레이블에 적용합니다.
        emotion.attributedText = attributedText
    }
    
}

extension UIView {
    func setViewShadow(backView: UIView) {
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 20
        
        layer.masksToBounds = false
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor(red: 0.835, green: 0.898, blue: 1, alpha: 1).cgColor
    }
}
