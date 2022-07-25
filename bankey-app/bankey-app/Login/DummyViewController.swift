//
//  DummyViewController.swift
//  bankey-app
//
//  Created by Thrace on 7/25/22.
//

import UIKit

class DummyViewController:UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var delegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension DummyViewController {
    
    private func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
    
        var config = UIButton.Configuration.filled()
        config.title = "Logout"
        logoutButton.configuration = config
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

// Actions
extension DummyViewController {
    @objc func logoutTapped() {
        print("=== logout was tapped!")
        delegate?.didLogout()
    }
}
