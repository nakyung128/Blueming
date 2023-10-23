import UIKit

class CustomTabBarItem: UITabBarItem {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titlePositionAdjustment = UIOffset(horizontal: -0.6, vertical: 0)
    }
}
