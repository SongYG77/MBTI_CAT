//
//  AppDelegate.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/13.
//

import UIKit
import Firebase

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var mainVC : UIViewController? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppAppearance.setupAppearance()
        FirebaseApp.configure()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

   
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
final class AppAppearance {
    static func setupAppearance() {

        // MARK: - TabBar
        /// TabBar의 버튼 색상 (ex - 탭바 위에 있는 검색 이미지의 색상)
        /// 단, 현재 선택된 ViewController의 tab의 색상과 선택되어 있지 않은 tab의 색상은 자동으로 조정
        UITabBar.appearance().tintColor = .white

        /// TabBar의 background 색상
        UITabBar.appearance().backgroundColor = .black
        
        UITabBar.appearance().unselectedItemTintColor = .black
        
        
    }
}

