//
//  ArticleViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/07.
//

import UIKit

class ArticleViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // 아티클 담을 배열
    var selectedData: [Article] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainArticleCell
        let target = selectedData[indexPath.row]
        
        cell.img.image = UIImage(named: target.img)
        cell.title.text = target.title
        cell.script.text = target.script
        cell.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        // 자간 설정
        cell.configureCell()
        
        return cell
    }
    
    // header 높이 0으로 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    // 태그 데이터 불러오기
    var collectionViewData: [Tags] = []
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var imageScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var articleView: UIView!
    @IBOutlet var mainScroll: UIScrollView!
    @IBOutlet var table: CustomTable!
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // 선택한 세그먼트 인덱스를 기반으로 선택한 카테고리를 식별합니다.
        let selectedCategory = sender.selectedSegmentIndex
        
        // 선택한 카테고리에 따라 데이터를 업데이트하고 컬렉션 뷰를 새로고침합니다.
        updateCollectionViewWithCategory(selectedCategory)
        changeSegmentedControlLinePosition()
        
        // 해당 카테고리의 첫 번째 태그를 자동으로 선택
        let firstIndexPath = IndexPath(item: 0, section: 0)
            
        // 첫 번째 태그를 프로그래매틱하게 선택
        collectionView.selectItem(at: firstIndexPath, animated: true, scrollPosition: .left)
        
        // 선택된 태그에 따라 selectedData 변경
        updateDataForSelectedTag(collectionViewData[0])
        
        // 테이블 뷰 갱신
        table.reloadData()
    }
    
    func updateCollectionViewWithCategory(_ category: Int) {
        // 선택한 카테고리에 따라 데이터를 필터링하거나 다른 데이터로 교체합니다.
        switch category {
        case 0:
            // 첫 번째 카테고리의 데이터를 사용
            collectionViewData = Tags.emotion
        case 1:
            // 두 번째 카테고리의 데이터를 사용
            collectionViewData = Tags.body
        case 2:
            // 두 번째 카테고리의 데이터를 사용
            collectionViewData = Tags.baby
        case 3:
            collectionViewData = Tags.family
        case 4:
            collectionViewData = Tags.etc
        default:
            break
        }
        
        // 컬렉션 뷰를 새로고침합니다.
        collectionView.reloadData()
    }
    
    // 컬렉션 뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    // 컬렉션 뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagCell
        cell.tagLabel.text = collectionViewData[indexPath.row].tagName
        
        return cell
    }
    
    // 태그 선택 시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTag = collectionViewData[indexPath.row]
        
        // 선택된 태그에 따라 selectedData 변경
        updateDataForSelectedTag(selectedTag)
        
        // 테이블 뷰 갱신
        table.reloadData()
    }
    
    func updateDataForSelectedTag(_ tag: Tags) {
        // 예: 태그에 따라 다른 데이터를 가져오는 로직
        // 이 예제에서는 단순화된 로직을 사용하였습니다.
        switch tag.tagName {
        case "우울":
            selectedData = Article.depressed
        case "불안/초조":
            selectedData = Article.unrest
        case "슬픔":
            selectedData = Article.sad
        case "혼란":
            selectedData = Article.confusion
        case "스트레스":
            selectedData = Article.stress
        case "신체 1":
            selectedData = Article.body1
        case "신체 2":
            selectedData = Article.body2
        case "신체 3":
            selectedData = Article.body3
        case "육아 1":
            selectedData = Article.baby1
        case "육아 2":
            selectedData = Article.baby2
        case "가족 1":
            selectedData = Article.family1
        case "가족 2":
            selectedData = Article.family2
        case "기타 1":
            selectedData = Article.ect1
        case "기타 2":
            selectedData = Article.ect2
        case "기타 3":
            selectedData = Article.ect3
        default:
            selectedData = []
        }
    }
    
    var images = [ UIImage(named: "example_img.png"), UIImage(named: "example_img.png"), UIImage(named: "example_img.png") ]
    var titles = [ "불안함을 잠재우기 위한 마음가짐1", "불안함을 잠재우기 위한 마음가짐2", "불안함을 잠재우기 위한 마음가짐3" ]
    var scripts = [ "자세한 내용입니다 자세한 내용입니다 자세한 내용입니다", "자세한 내용입니다 자세한 내용입니다 자세한 내용입니다", "자세한 내용입니다 자세한 내용입니다 자세한 내용입니다" ]
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == imageScroll { // 이미지 슬라이드를 위한 스크롤뷰인 경우
            let value = scrollView.contentOffset.x/scrollView.frame.size.width
            setPageControlSelectedPage(currentPage: Int(round(value)))
        }
    }
    
    private enum Constants {
        static let segmentedControlHeight: CGFloat = 35
        static let underlineViewColor: UIColor = .select!
        static let underlineViewHeight: CGFloat = 3
    }
    
    // Container view of the segmented control
    private lazy var segmentedControlContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    // The underline view below the segmented control
    private lazy var bottomUnderlineView: UIView = {
        let underlineView = UIView()
        underlineView.backgroundColor = Constants.underlineViewColor
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        return underlineView
    }()
    
    private lazy var leadingDistanceConstraint: NSLayoutConstraint = {
        return bottomUnderlineView.leftAnchor.constraint(equalTo: segment.leftAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "MainArticleCell", bundle: nil)
        table.register(nibName, forCellReuseIdentifier: "mainCell")
        
        table.delegate = self
        table.dataSource = self
        
        table.isScrollEnabled = false // 스크롤 막기
        table.backgroundColor = UIColor.clear // 배경 투명
        table.allowsSelection = false // 셀 선택 막기
        table.separatorStyle = .none // table view 구분선 없애기
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: "tagCell")
        collectionView.collectionViewLayout = LeftAlignedCollectionViewFlowLayout()
        collectionView.backgroundColor = .articleColor
        
        // 배경 이미지 뷰를 생성하고 추가
        let backgroundImage = UIImageView(image: UIImage(named: "article-back.png"))
        backgroundImage.contentMode = .scaleAspectFill // 이미지 크기 조절 옵션 (필요에 따라 변경)
        backgroundImage.frame = view.bounds // 이미지 뷰를 화면 크기에 맞게 설정
        
        // 배경 이미지 뷰를 뷰의 맨 뒤에 추가합니다.
        view.insertSubview(backgroundImage, at: 0)
        
        // 스크롤뷰 설정
        imageScroll.translatesAutoresizingMaskIntoConstraints = false
        imageScroll.delegate = self
        
        // 페이지 컨트롤 설정
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        addContentScrollView()
        setPageControl()
        
        segment.setTitleTextAttributes([.font: UIFont(name: "Pretendard-Bold", size: 18)!, .foregroundColor: UIColor.Text03!], for: .normal)
        segment.setTitleTextAttributes([.font: UIFont(name: "Pretendard-Bold", size: 18)!, .foregroundColor: UIColor.select!], for: .selected)
        
        // 초기 카테고리 선택 및 컬렉션 뷰 업데이트
        segment.selectedSegmentIndex = 0 // 예시로 첫 번째 카테고리를 선택
        updateCollectionViewWithCategory(0) // 선택한 카테고리에 따라 업데이트
        
        segment.setiOS12Layout(tintColor: .select!)
        
        // 첫 번째 태그 선택
        let firstIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .top)
        
        let firstTag = collectionViewData[0]
        updateDataForSelectedTag(firstTag)
        
        // 원본 문자열
        let originalString = "파랑 님을 위한 아티클"
        
        // 원본 문자열을 NSAttributedString으로 변환
        let attributedString = NSMutableAttributedString(string: originalString)
        
        // '파랑' 단어의 범위 찾기
        if let range = originalString.range(of: "파랑") {
            let nsRange = NSRange(range, in: originalString)
            
            // 색상을 변경할 부분에 대한 속성을 설정
            let colorAttribute: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(named: "Blue01") ?? UIColor.blue // 원하는 색상으로 변경
            ]
            
            attributedString.addAttributes(colorAttribute, range: nsRange)
        }
        
        // 나머지 텍스트에 대한 스타일을 설정합니다.
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        attributedString.addAttributes([NSAttributedString.Key.kern: -1.2, NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attributedString.length))
        
        mainLabel.attributedText = attributedString
        secondLabel.attributedText = NSMutableAttributedString(string: "오늘의 맞춤형 아티클을 확인해 볼 수 있어요", attributes: [NSAttributedString.Key.kern: -0.8, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        // Add subviews to the view hierarchy
        // (both segmentedControl and bottomUnderlineView are subviews of the segmentedControlContainerView)
        articleView.addSubview(segmentedControlContainerView)
        segmentedControlContainerView.addSubview(segment)
        segmentedControlContainerView.addSubview(bottomUnderlineView)
        segment.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        
        // Constrain the container view to the view controller
        NSLayoutConstraint.activate([
            segmentedControlContainerView.topAnchor.constraint(equalTo: segment.topAnchor),
            segmentedControlContainerView.leadingAnchor.constraint(equalTo: segment.leadingAnchor),
            segmentedControlContainerView.widthAnchor.constraint(equalTo: segment.widthAnchor),
            segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight)
        ])
        
        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
            segment.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segment.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segment.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
        ])
        
        // Constrain the underline view relative to the segmented control
        NSLayoutConstraint.activate([
            bottomUnderlineView.bottomAnchor.constraint(equalTo: segment.bottomAnchor),
            bottomUnderlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            leadingDistanceConstraint,
            bottomUnderlineView.widthAnchor.constraint(equalTo: segment.widthAnchor, multiplier: 1 / CGFloat(segment.numberOfSegments))
        ])
    }
    
    private func addContentScrollView() {
        var contentX: CGFloat = 0.0 // 컨텐츠의 x 좌표를 초기화합니다.
        
        for i in 0..<images.count {
            // 이미지와 레이블을 담을 컨테이너 뷰 생성
            let containerView = UIView()
            
            let image = UIImageView()
            
            image.frame = CGRect(x: 0, y: 0, width: imageScroll.bounds.width, height: imageScroll.bounds.height)
            image.image = images[i]
            image.layer.cornerRadius = 15
            image.layer.masksToBounds = true
            
            // titleLabel과 scriptLabel을 생성하고 컨테이너 뷰에 추가
            let titleLabel = UILabel()
            let scriptLabel = UILabel()
            
            titleLabel.text = titles[i]
            scriptLabel.text = scripts[i]
            
            titleLabel.frame = CGRect(x: 15, y: 150, width: imageScroll.bounds.width, height: 30)
            titleLabel.textColor = .white
            titleLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
            titleLabel.attributedText = NSMutableAttributedString(string: titles[i], attributes: [NSAttributedString.Key.kern: -0.54])
            
            scriptLabel.frame = CGRect(x: 15, y: 158, width: imageScroll.bounds.width, height: 60)
            scriptLabel.textColor = .white
            scriptLabel.font = UIFont(name: "Pretendard-Medium", size: 10)
            scriptLabel.attributedText = NSMutableAttributedString(string: scripts[i], attributes: [NSAttributedString.Key.kern: -0.3])
            
            containerView.addSubview(image)
            containerView.addSubview(titleLabel)
            containerView.addSubview(scriptLabel)
            
            // 컨테이너 뷰를 스크롤 뷰에 추가
            containerView.frame = CGRect(x: contentX, y: 0, width: imageScroll.bounds.width, height: imageScroll.bounds.height)
            imageScroll.addSubview(containerView)
            
            contentX += imageScroll.bounds.width // x 좌표를 증가시켜 다음 컨텐츠 위치를 지정합니다.
        }
        
        // 스크롤뷰의 contentSize 설정
        imageScroll.contentSize.width = imageScroll.frame.width * CGFloat(images.count)
    }
    
    // Change position of the underline
    private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segment.selectedSegmentIndex)
        let segmentWidth = segment.frame.width / CGFloat(segment.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.leadingDistanceConstraint.constant = leadingDistance
        })
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
}

extension UISegmentedControl {
    func setiOS12Layout(tintColor: UIColor) {
        if #available(iOS 13, *) {
            let background = UIImage(color: .articleColor!, size: CGSize(width: 1, height: 32))
            let divider = UIImage(color: .articleColor!, size: CGSize(width: 1, height: 32))
            self.setBackgroundImage(background, for: .normal, barMetrics: .default)
            self.setBackgroundImage(background, for: .selected, barMetrics: .default)
            self.setBackgroundImage(background, for: .highlighted, barMetrics: .default)
            self.setBackgroundImage(divider, for: .selected, barMetrics: .default)
            
            self.setDividerImage(divider, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
            
            self.setTitleTextAttributes([.font: UIFont(name: "Pretendard-Bold", size: 18)!, .foregroundColor: UIColor.Text03!], for: .normal)
            self.setTitleTextAttributes([.font: UIFont(name: "Pretendard-Bold", size: 18)!, .foregroundColor: UIColor.select!], for: .selected)
            
        } else {
            self.tintColor = tintColor
        }
    }
}

extension UIImage {
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.set()
        let context = UIGraphicsGetCurrentContext()!
        context.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(data: image.pngData()!)!
    }
}

extension ArticleViewController: UICollectionViewDelegateFlowLayout {
    // 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tag = collectionViewData[indexPath.row]
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.text = tag.tagName
        label.attributedText = NSMutableAttributedString(string: label.text!, attributes: [NSAttributedString.Key.kern: -0.7])
        label.textColor = .Text03
        label.sizeToFit()
        
        // 셀의 크기를 계산하여 반환
        let width = label.frame.width + 30 // 30만큼 여백 추가
        return CGSize(width: width, height: collectionView.frame.size.height)
    }
}
