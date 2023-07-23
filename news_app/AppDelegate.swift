//
//  AppDelegate.swift
//  news_app
//
//  Created by Phattarapon Jungtakarn on 22/7/2566 BE.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        if #available(iOS 13.0, *) {
            // no-op - UI created in scene delegate
        } else {
            self.window? = UIWindow.init(frame: UIScreen.main.bounds)
            self.window?.rootViewController = assignedViewController()
            self.window?.makeKeyAndVisible()
        }
        
        self.customizeNavBar()
        
        return true
    }
    
    func assignedViewController() -> UIViewController {
        return  MainRouter.createModule()
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

extension AppDelegate {
    
    func customizeNavBar() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance;
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().tintColor = UIColor.theme.backgroundNavbar
            UINavigationBar.appearance().barTintColor = UIColor.theme.backgroundNavbar
            UINavigationBar.appearance().barStyle = UIBarStyle.default
            appearance.backgroundColor = UIColor.theme.backgroundNavbar
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().barStyle = UIBarStyle.default
            UINavigationBar.appearance().tintColor = UIColor.theme.backgroundNavbar
            UINavigationBar.appearance().barTintColor = UIColor.theme.backgroundNavbar
            UINavigationBar.appearance().backgroundColor = UIColor.theme.backgroundNavbar
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
}

