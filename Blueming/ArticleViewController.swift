//
//  ArticleViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/07.
//

import UIKit

class ArticleViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 태그 데이터 불러오기
    var collectionViewData: [Tags] = []
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // 선택한 세그먼트 인덱스를 기반으로 선택한 카테고리를 식별합니다.
        let selectedCategory = sender.selectedSegmentIndex
        
        // 선택한 카테고리에 따라 데이터를 업데이트하고 컬렉션 뷰를 새로고침합니다.
        updateCollectionViewWithCategory(selectedCategory)
        changeSegmentedControlLinePosition()
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
        // 다른 카테고리에 대한 처리 추가
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
    
    var images = [ UIImage(named: "example_img.png"), UIImage(named: "example_img.png"), UIImage(named: "example_img.png") ]
    var titles = [ "불안함을 잠재우기 위한 마음가짐1", "불안함을 잠재우기 위한 마음가짐2", "불안함을 잠재우기 위한 마음가짐3" ]
    var scripts = [ "자세한 내용입니다 자세한 내용입니다 자세한 내용입니다", "자세한 내용입니다 자세한 내용입니다 자세한 내용입니다", "자세한 내용입니다 자세한 내용입니다 자세한 내용입니다" ]
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        
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
        
        // 원본 문자열
        let originalString = "수림 님을 위한 아티클"
        
        // 원본 문자열을 NSAttributedString으로 변환
        let attributedString = NSMutableAttributedString(string: originalString)
        
        // '수림' 단어의 범위 찾기
        if let range = originalString.range(of: "수림") {
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
        view.addSubview(segmentedControlContainerView)
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
            
            let imageView = UIImageView()
            
            imageView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            imageView.layer.cornerRadius = 15
            imageView.layer.masksToBounds = true
            
            // titleLabel과 scriptLabel을 생성하고 컨테이너 뷰에 추가
            let titleLabel = UILabel()
            let scriptLabel = UILabel()
            
            titleLabel.text = titles[i]
            scriptLabel.text = scripts[i]
            
            titleLabel.frame = CGRect(x: 15, y: 150, width: scrollView.bounds.width, height: 30)
            titleLabel.textColor = .white
            titleLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
            titleLabel.attributedText = NSMutableAttributedString(string: titles[i], attributes: [NSAttributedString.Key.kern: -0.54])
            
            scriptLabel.frame = CGRect(x: 15, y: 158, width: scrollView.bounds.width, height: 60)
            scriptLabel.textColor = .white
            scriptLabel.font = UIFont(name: "Pretendard-Medium", size: 10)
            scriptLabel.attributedText = NSMutableAttributedString(string: scripts[i], attributes: [NSAttributedString.Key.kern: -0.3])
            
            containerView.addSubview(imageView)
            containerView.addSubview(titleLabel)
            containerView.addSubview(scriptLabel)
            
            // 컨테이너 뷰를 스크롤 뷰에 추가
            containerView.frame = CGRect(x: contentX, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(containerView)
            
            contentX += scrollView.bounds.width // x 좌표를 증가시켜 다음 컨텐츠 위치를 지정합니다.
        }
        
        // 스크롤뷰의 contentSize 설정
        scrollView.contentSize.width = scrollView.frame.width * CGFloat(images.count)
    }
    
    // Change position of the underline
    private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segment.selectedSegmentIndex)
        let segmentWidth = segment.frame.width / CGFloat(segment.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.leadingDistanceConstraint.constant = leadingDistance
            //self?.layoutIfNeeded()
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
