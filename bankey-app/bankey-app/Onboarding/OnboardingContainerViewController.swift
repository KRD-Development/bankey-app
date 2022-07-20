//
//  OnboardingContainerViewController.swift
//  bankey-app
//
//  Created by Thrace on 7/19/22.
//

import UIKit

class OnBoardingContainerViewController:UIViewController {
    
    let closeButton = UIButton(type: .system)
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController {
        didSet {
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use and has a brand new look and feel that will make you feel like you are back in the 1980s.")
        let page2 = OnboardingViewController(heroImageName: "world", titleText: "Move your money around the world quickly and securely.  That way the government can't seize your assets once they're on to you.")
        let page3 = OnboardingViewController(heroImageName: "thumbs", titleText: "For details go to www.bankey.com. \n\n Now let's get started!")

        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {

        setup()
        style()
        layout()
        
        super.viewDidLoad()
    }
    
}

extension OnBoardingContainerViewController {
    
    private func setup() {
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)

        pageViewController.didMove(toParent: self)
        pageViewController.dataSource = self

        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        currentVC = pages.first!
        
    }
    
    private func style() {
        
        view.backgroundColor = .systemPurple
        
        // Page View Controller
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Close Button
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        var closeConfig = UIButton.Configuration.borderless()
        closeConfig.imagePadding = 8
        closeButton.configuration = closeConfig
        closeButton.setTitle("Close", for:[])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        
        view.addSubview(closeButton)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
    }
}

extension OnBoardingContainerViewController {
    
    @objc
    private func closeTapped(_ sender: UIButton) {
        print("Close was tapped!")
    }
}


extension OnBoardingContainerViewController:UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}

