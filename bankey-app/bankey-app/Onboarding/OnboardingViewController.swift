//
//  OnboardingViewController.swift
//  bankey-app
//
//  Created by Thrace on 7/20/22.
//

import UIKit

class OnboardingViewController:UIViewController {
    
    
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    let nextButton = UIButton()
    
    let heroImageName:String
    let titleText:String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(heroImageName:String, titleText:String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingViewController {
    private func style() {
        
        // View
        view.backgroundColor = .systemBackground
        
//        // Close Button
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        var closeConfig = UIButton.Configuration.borderless()
//        closeConfig.imagePadding = 8
//        closeConfig.title = "Close"
//        closeConfig.buttonSize = .small
//    
//        closeButton.configuration = closeConfig
//        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        
        // Stackview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: heroImageName)
        
        // Label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = titleText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        
        // Next Button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        var nextConfig = UIButton.Configuration.borderless()
        nextConfig.imagePadding = 8
        nextConfig.title = "Next"
        nextConfig.buttonSize = .medium
        
        nextButton.configuration = nextConfig
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)

    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
//        view.addSubview(closeButton)
        view.addSubview(stackView)
        view.addSubview(nextButton)
        
//        NSLayoutConstraint.activate([
////            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 4),
//            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
//            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
////            closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
////            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            view.trailingAnchor.constraint(equalToSystemSpacingAfter: closeButton.trailingAnchor, multiplier: 1)
//        ])

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: -2),
            nextButton.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -3)
        ])
        
    }
}

extension OnboardingViewController {
    @objc
    private func nextTapped() {
        print("Next was tapped")
    }
    
//    @objc
//    private func closeTapped() {
//        print("Close was tapped!")
//    }
}
