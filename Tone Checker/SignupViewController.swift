//
//  SignupViewController.swift
//  Tone Checker
//
//  Created by Adam Amangeldiev on 2025/1/13.
//

import UIKit

class SignupViewController: UIViewController {
    
    let userEmailTextField = UPTextField(tContentType: .emailAddress, textPlaceholder: "Enter email")
    let userPasswordTextField = UPTextField(tContentType: .password, textPlaceholder: "Enter password")
    let signupButton = UPButton(backgroundColor: .systemBlue, title: "Signup")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        configureTextField()
        configureUserPasswordTextField()
        configureSignupButton()
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configureTextField() {
        view.addSubview(userEmailTextField)
        
        NSLayoutConstraint.activate([
            userEmailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userEmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userEmailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userEmailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userEmailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func configureUserPasswordTextField() {
        view.addSubview(userPasswordTextField)
        
        NSLayoutConstraint.activate([
            userPasswordTextField.topAnchor.constraint(equalTo: userEmailTextField.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    private func configureSignupButton() {
        view.addSubview(signupButton)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signupButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    @objc private func signupButtonTapped() {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        guard let userEmail, let userPassword else { return }
        print(userEmail  + " " + userPassword + "\n")
    }
    
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
