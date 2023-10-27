import UIKit

class SelectHealthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data = Keyword.health
    var keyword: String = ""
    var img: String = ""
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! EmotionCell
        let target = data[indexPath.row]
        
        cell.img.image = UIImage(named: target.img!)
        cell.emotion.text = target.keyword
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = healthView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 4
            cell.layer.borderColor = UIColor.Blue01?.cgColor
            cell.layer.cornerRadius = 20
            
            keyword = data[indexPath.row].keyword
            img = data[indexPath.row].img!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = healthView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
        }
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func saveHealth(_ sender: Any) {
        if keyword == "" {
            let alert = UIAlertController(title: "건강을 선택해 주세요", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            UserDefaults.standard.setValue(keyword, forKey: "health_keyword")
            UserDefaults.standard.setValue(img, forKey: "health_img")
            
            NotificationCenter.default.post(name: .selectHealth, object: nil)
            
            dismiss(animated: false, completion: nil)
        }
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var healthView: UICollectionView!
    @IBOutlet var saveBtn: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        healthView.flashScrollIndicators()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "EmotionCell", bundle: nil)
        healthView.register(nib, forCellWithReuseIdentifier: "emotionCell")
        
        healthView.backgroundColor = UIColor.white

        let originalString = "오늘의 건강"
        let attributedString = NSMutableAttributedString(string: originalString)
        
        if let range = originalString.range(of: "건강") {
            let nsRange = NSRange(range, in: originalString)
    
            let colorAttribute: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(named: "Blue01") ?? UIColor.blue // 원하는 색상으로 변경
            ]
            
            attributedString.addAttributes(colorAttribute, range: nsRange)
        }
    
        attributedString.addAttributes([NSAttributedString.Key.kern: -1], range: NSRange(location: 0, length: attributedString.length))
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        titleLabel.attributedText = attributedString

        healthView.delegate = self
        healthView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: healthView.frame.width/3 - 12, height: 85)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        healthView.collectionViewLayout = layout
        
        saveBtn.applyOriginToButton(color: UIColor.Text05!)
        saveBtn.applyGradientToButton(startColor: UIColor(red: 0.393, green: 0.538, blue: 0.983, alpha: 1), endColor: UIColor(red: 0.557, green: 0.667, blue: 1, alpha: 1))
        
    }

}
