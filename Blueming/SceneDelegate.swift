//
//  SceneDelegate.swift
//  Blueming
//
//  Created by 이나경 on 2023/09/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        if let tabBarController = self.window?.rootViewController as? UITabBarController {
            if #available(iOS 13.0, *) {
                let appearance = UITabBarAppearance()
                
                // 선택되지 않은 상태의 폰트 및 자간 설정
                let normalFont = UIFont(name: "Pretendard-Medium", size: 14)
                let normalSpacing: CGFloat = -0.6
                
                let normalAttributes: [NSAttributedString.Key: Any] = [
                    .font: normalFont as Any,
                    .kern: normalSpacing
                ]
                
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
                
                // 선택된 상태의 폰트 및 자간 설정
                let selectedFont = UIFont(name: "Pretendard-Medium", size: 14)
                let selectedSpacing: CGFloat = -0.6
                
                let selectedAttributes: [NSAttributedString.Key: Any] = [
                    .font: selectedFont as Any,
                    .kern: selectedSpacing
                ]
                
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
                
                tabBarController.tabBar.standardAppearance = appearance
            }
        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

