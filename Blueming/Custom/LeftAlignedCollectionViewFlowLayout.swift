import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .horizontal // 수평 스크롤로 설정
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scrollDirection = .horizontal // 수평 스크롤로 설정
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        // 수평 스크롤일 경우에만 필요한 레이아웃 로직을 구현하세요.
        if scrollDirection == .horizontal {
            var leftMargin = sectionInset.left
            var maxY: CGFloat = -1.0
            
            attributes?.forEach { layoutAttribute in
                if layoutAttribute.representedElementCategory == .cell {
                    if layoutAttribute.frame.origin.x >= maxY {
                        leftMargin = sectionInset.left
                    }
                    
                    layoutAttribute.frame.origin.y = leftMargin
                    leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
                    maxY = max(layoutAttribute.frame.maxX, maxY)
                }
            }
        }
        
        return attributes
    }
}
