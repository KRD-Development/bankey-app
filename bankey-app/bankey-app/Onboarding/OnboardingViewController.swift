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
    
    let nextButton = UIButton(type: .system)
    
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
        nextButton.configuration = nextConfig
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)

    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 4),
            nextButton.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: -2)
        ])
        
    }
}

extension OnboardingViewController {
    @objc
    private func nextTapped(_ sender: UIButton) {
        print("Next was tapped")
    }
    
//    @objc
//    private func closeTapped() {
//        print("Close was tapped!")
//    }
}
