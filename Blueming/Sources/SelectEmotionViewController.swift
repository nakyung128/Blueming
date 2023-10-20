//
//  SelectEmotionViewController.swift
//  Blueming
//
//  Created by 이나경 on 10/18/23.
//

import UIKit

class SelectEmotionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data = Keyword.emotion
    var keyword: String = ""
    var img: String = ""
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! EmotionCell
        let target = data[indexPath.row]
        
        cell.img.image = UIImage(named: target.img!)
        cell.emotion.text = target.keyword
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = emotionView.cellForItem(at: indexPath) {
//            let gradientLayer = createGradientLayer()
//            gradientLayer.frame = cell.bounds.insetBy(dx: -4, dy: -4)
//            gradientLayer.cornerRadius = 20
//            gradientLayer.name = "gradientBorder"
//            cell.layer.insertSublayer(gradientLayer, at: 0)
            cell.layer.borderWidth = 4
            cell.layer.borderColor = UIColor.Blue01?.cgColor
            cell.layer.cornerRadius = 20
            
            keyword = data[indexPath.row].keyword
            img = data[indexPath.row].img!
        }
    }
    
    func createGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1).cgColor, UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return gradientLayer
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
//            if let gradientLayer = cell.layer.sublayers?.first(where: { $0.name == "gradientBorder" }) {
//                gradientLayer.removeFromSuperlayer()
//            }
        }
    }
    
    func addGradientBorder(to view: UICollectionViewCell, colors: [CGColor], width: CGFloat) {
        // 1. CAGradientLayer 생성
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5) // Horizontal gradient
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = colors
        
        // 2. CAShapeLayer 생성
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(rect: view.bounds).cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor // strokeColor는 실제로 사용되지 않지만 필요합니다.
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        // 3. CAShapeLayer를 사용하여 그라데이션 레이어 마스킹
        gradientLayer.mask = shapeLayer
        
        // 4. 그라데이션 레이어를 뷰에 추가
        view.layer.addSublayer(gradientLayer)
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
    }
    
    // 사용 방법:
    // let myView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
    //  addGradientBorder(to: myView, colors: [UIColor.red.cgColor, UIColor.blue.cgColor], width: 5)
    
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emotionView: UICollectionView!
    @IBOutlet var saveBtn: UIButton!
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func saveEmotion(_ sender: Any) {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayString = formatter.string(from: today)
        
        UserDefaults.standard.setValue(todayString, forKey: "date")
        UserDefaults.standard.setValue(keyword, forKey: "emotion_keyword")
        UserDefaults.standard.setValue(img, forKey: "emotion_img")
        
        NotificationCenter.default.post(name: .selectEmotion, object: nil)
        
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "EmotionCell", bundle: nil)
        emotionView.register(nib, forCellWithReuseIdentifier: "emotionCell")
        
        emotionView.backgroundColor = UIColor.white
        
        let originalString = "오늘의 감정"
        let attributedString = NSMutableAttributedString(string: originalString)
        
        if let range = originalString.range(of: "감정") {
            let nsRange = NSRange(range, in: originalString)
            
            let colorAttribute: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(named: "Blue01") ?? UIColor.blue // 원하는 색상으로 변경
            ]
            
            attributedString.addAttributes(colorAttribute, range: nsRange)
        }
 
        attributedString.addAttributes([NSAttributedString.Key.kern: -1], range: NSRange(location: 0, length: attributedString.length))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        titleLabel.attributedText = attributedString
        
        emotionView.delegate = self
        emotionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: emotionView.frame.width/3 - 12, height: emotionView.frame.height/4 - 15)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        emotionView.collectionViewLayout = layout
        
        saveBtn.applyOriginToButton(color: UIColor.Text05!)
        saveBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        
    }
    
}
