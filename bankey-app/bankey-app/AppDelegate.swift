//
//  AppDelegate.swift
//  bankey-app
//
//  Created by Thrace on 7/19/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnBoardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        window?.rootViewController = loginViewController
//        window?.rootViewController = onboardingContainerViewController
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        
        print("LOGGED IN!")
        setRootViewController(onboardingContainerViewController)
        
        
//        window?.rootViewController = onboardingContainerViewController
//        if LocalState.hasOnboarded {
//            setRootViewController(dummyViewController)
//        } else {
//            setRootViewController(onboardingViewController)
//        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("=== Did Finish Onboarding!!")
    }
}

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
