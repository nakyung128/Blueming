//
//  KeywordLabel.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/29.
//

import UIKit

class KeywordLabel: UILabel {

    var topInset: CGFloat = 8.0
    var bottomInset: CGFloat = 8.0
    var leftInset: CGFloat = 12.0
    var rightInset: CGFloat = 12.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset, height: size.height + bottomInset + topInset)
    }

}
