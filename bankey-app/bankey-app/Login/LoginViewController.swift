//
//  ViewController.swift
//  bankey-app
//
//  Created by Thrace on 7/19/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

class LoginViewController: UIViewController {

    let appLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
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
    
    override func viewDidDisappear(_ animated: Bool) {
        signInButton.configuration?.showsActivityIndicator = false
        loginView.userNameTextField.text = ""
        loginView.passwordTextField.text = ""
        loginView.userNameTextField.isEnabled = true
        loginView.userNameTextField.becomeFirstResponder()
        loginView.passwordTextField.isEnabled = true
    }
    
}

// Mark: Style and Layout
extension LoginViewController {
    private func style() {
        
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        appLabel.textColor = .black
        appLabel.font = UIFont(name: "Arial", size: 30)
        appLabel.text = "Bankey"
        
        subtitleLabel.textColor = .black
        subtitleLabel.font = UIFont(name: "Arial", size: 16)
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
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
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // App Label
        NSLayoutConstraint.activate([
            appLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -24),
            appLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
        ])
        
        // App Description Label
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 48),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -48),
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        
        
        // Sign In Button
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
    
    @objc private func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Passshould should never be nil")
            return
        }
        
//        if username.isEmpty || password.isEmpty {
//            configureView(withMessage: ErrorType.required.rawValue)
//            return
//        }
        
        // TODO: swap out usage of test user/password
        if username == "" && password == "" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
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
