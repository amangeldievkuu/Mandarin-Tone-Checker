//
//  ViewController.swift
//  Tone Checker
//
//  Created by Adam Amangeldiev on 2025/1/11.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var loginButton = UPButton(backgroundColor: .black, title: "Login")
    var signUpButton = UPButton(backgroundColor: .systemPink, title: "Sign Up")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Tone Checker"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureLoginButton()
        configureSignupButton()
    }
    
    
    private func configureLoginButton() {
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginUserAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureSignupButton() {
        view.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signupUserAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc func loginUserAction() {
        print("Login button tapped")
        
        
    }
    
    
    @objc func signupUserAction() {
        print("Signup button tapped")
        let destination = SignupViewController()
        present(destination, animated: true)
    }
    
}

//#Preview {
//    MainPageViewController()
//}

