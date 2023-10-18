//
//  SelectEmotionViewController.swift
//  Blueming
//
//  Created by 이나경 on 10/18/23.
//

import UIKit

class SelectEmotionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data = Keyword.emotion
    
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
    

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emotionView: UICollectionView!
    @IBOutlet var saveBtn: UIButton!
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func saveEmotion(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "EmotionCell", bundle: nil)
        emotionView.register(nib, forCellWithReuseIdentifier: "emotionCell")

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
        layout.itemSize = CGSize(width: emotionView.frame.width/3 - 12, height: emotionView.frame.height/4 - 25)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        emotionView.collectionViewLayout = layout
        
        saveBtn.applyOriginToButton(color: UIColor.Text05!)
        saveBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))

    }

}
