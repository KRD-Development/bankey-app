//
//  ViewController.swift
//  bankey-app
//
//  Created by Thrace on 7/19/22.
//

import UIKit

class LoginViewController: UIViewController {

    let appLabel = UILabel()
    let appDescriptionLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username:String? {
        return loginView.userNameTextField.text
    }
    var password:String? {
        return loginView.passwordTextField.text
    }
    
    let testUsername = "Sam"
    let testPassword = "abc123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        appDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        appLabel.textColor = .black
        appLabel.font = UIFont(name: "Arial", size: 30)
        appLabel.text = "Bankey"
        
        appDescriptionLabel.textColor = .black
        appDescriptionLabel.font = UIFont(name: "Arial", size: 16)
        appDescriptionLabel.text = "Your premium source for all things banking!"
        appDescriptionLabel.numberOfLines = 0
        appDescriptionLabel.textAlignment = .center
        
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.imagePadding = 8
        buttonConfig.title = "Sign In"
        buttonConfig.imagePlacement = .leading
        
        signInButton.configuration = buttonConfig
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        
        view.addSubview(appLabel)
        view.addSubview(appDescriptionLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // App Label
        NSLayoutConstraint.activate([
            appLabel.bottomAnchor.constraint(equalTo: appDescriptionLabel.topAnchor, constant: -24),
            appLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
        ])
        
        // App Description Label
        NSLayoutConstraint.activate([
            appDescriptionLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            appDescriptionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 48),
            appDescriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -48),
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error Message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
    
}

// Mark: Actions
extension LoginViewController {
    
    private func resetForm() {
        loginView.userNameTextField.isEnabled = true
        loginView.passwordTextField.isEnabled = true
    }
    
    @objc private func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Passshould should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: ErrorType.required.rawValue)
            return
        }
        
        if(username ==  testUsername && password == testPassword) {
            signInButton.configuration?.showsActivityIndicator = true
            return
        } else {
            configureView(withMessage: ErrorType.invalidLogin.rawValue)
            return
        }
        
    }
    
    private func configureView(withMessage message: String) {
        signInButton.configuration?.showsActivityIndicator = false
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        
    }
}

// Mark: Error Messages
enum ErrorType: String {
    case invalidLogin = "Incorrect username / password"
    case required = "Username / Password are required"
    case requiredUsername = "Username is required"
    case requiredPassword = "Password is required"
}
