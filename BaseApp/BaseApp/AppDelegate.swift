//
//  AppDelegate.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit
import Localize_Swift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: getStartVC())
        window?.overrideUserInterfaceStyle = .light
        
        setupLang()
        return true
    }
        
    func getStartVC() -> UIViewController {
        return UIViewController()
    }
    
    func setupLang(){
        let lang = AccUserDefaults.language

        if lang.isEmpty {
            Localize.setCurrentLanguage("tk")
            AccUserDefaults.language = "tk"
        }
    }
}

