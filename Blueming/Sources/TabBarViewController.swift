//
//  TabBarViewController.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            
            // 선택되지 않은 상태의 폰트 및 자간 설정
            let normalFont = UIFont(name: "Pretendard-Medium", size: 12)
            let normalSpacing: CGFloat = -0.6
            
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .font: normalFont as Any,
                .kern: normalSpacing
            ]
            
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            
            // 선택된 상태의 폰트 및 자간 설정
            let selectedFont = UIFont(name: "Pretendard-Medium", size: 12)
            let selectedSpacing: CGFloat = -0.6
            
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .font: selectedFont as Any,
                .kern: selectedSpacing
            ]
            
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            
            self.tabBar.standardAppearance = appearance
        }
    }

}
