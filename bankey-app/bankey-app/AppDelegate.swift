//
//  AppDelegate.swift
//  bankey-app
//
//  Created by Thrace on 7/19/22.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let mainViewController = MainViewController()
    let accountSummaryViewController = AccountSummaryViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        window?.rootViewController = accountSummaryViewController
//        window?.rootViewController = mainViewController
//        mainViewController.selectedIndex = 1  // how to select another tab programmatically
        return true
    }

}

// MARK: Navigation
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

// MARK: Actions
//extension AppDelegate: LoginViewControllerDelegate {
//    func didLogin() {
//        if LocalState.hasOnboarded {
//            setRootViewController(dummyViewController)
//        } else {
//            setRootViewController(onboardingContainerViewController)
//        }
//    }
//}
//
//extension AppDelegate: LogoutDelegate {
//    func didLogout() {
//        setRootViewController(loginViewController)
//    }
//}
//
//extension AppDelegate: OnboardingContainerViewControllerDelegate {
//    func didFinishOnboarding() {
//        LocalState.hasOnboarded = true
//        setRootViewController(dummyViewController)
//    }
//}
