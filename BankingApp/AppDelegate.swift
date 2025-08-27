//
//  AppDelegate.swift
//  BankingApp
//
//  Created by Lucas Rasmusson on 2025-08-13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        // window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()

        
        return true
    }
}

#Preview {
    LoginViewController()
}

