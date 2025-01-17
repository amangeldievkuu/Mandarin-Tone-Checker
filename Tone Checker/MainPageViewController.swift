//
//  ViewController.swift
//  Tone Checker
//
//  Created by Adam Amangeldiev on 2025/1/11.
//

import UIKit

class MainPageViewController: UIViewController {
    
    let blueBackgroundView = UIView()
    let logoImage = UIImageView(image: UIImage(systemName: "swift"))
    let logoTitle = UPTitleLabel(textAlignment: .center, color: UIColor(named: "signupButColor")! ,fontSize: 40)
    let loginButton = UPButton(backgroundColor: UIColor(named: "loginButColor")!, title: "Login")
    let signUpButton = UPButton(backgroundColor: UIColor(named: "signupButColor")!, title: "Sign Up")
    let welcomeTitleLabel = UPTitleLabel(textAlignment: .center, color: UIColor(named: "loginButColor")!, fontSize: 34)
    let descriptionLabel = UPBodyLabel(textAlignment: .center, color: UIColor(named: "loginButColor")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureBlueBackground()
        configureLogoImage()
        configureLogoTitleLabel()
        configureLoginButton()
        configureSignupButton()
        configureTitleLabel()
        configureDescriptionLabelLabel()
    }
    
    
    private func configureLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
    }
    
    
    private func configureLogoTitleLabel() {
        view.addSubview(logoTitle)
        logoTitle.text = "Tone Checker"
        
        NSLayoutConstraint.activate([
            logoTitle.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -10),
            logoTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            logoTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            logoTitle.heightAnchor.constraint(equalToConstant: 80),
        ])
        
    }
    
    
    private func configureTitleLabel() {
        view.addSubview(welcomeTitleLabel)
        welcomeTitleLabel.text = "Welcome"
        
        NSLayoutConstraint.activate([
            welcomeTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    
    private func configureDescriptionLabelLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "Chinese has 4 tones - but what are they and how are they pronounced?"
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: welcomeTitleLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: welcomeTitleLabel.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)
        ])
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
        let navigationController = UINavigationController(rootViewController: destination)
        present(navigationController, animated: true)
    }
    
    
    private func applyGrandientBackground(startColor: UIColor, endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    private func configureBlueBackground() {
        // Add the blue background view
        blueBackgroundView.backgroundColor = UIColor(named: "bottomBackground")
        blueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueBackgroundView)
        
        // Constraints for the blue view
        NSLayoutConstraint.activate([
            blueBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //                blueBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            blueBackgroundView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Ensure the bounds of the view are accurate
        let width = blueBackgroundView.bounds.width
        let height = blueBackgroundView.bounds.height
        
        // Add the curved shape using CAShapeLayer
        let curvedPath = UIBezierPath()
        curvedPath.move(to: CGPoint(x: 0, y: 60))
        curvedPath.addQuadCurve(to: CGPoint(x: width, y: 0), controlPoint: CGPoint(x: 200 / 2, y: -0))
        curvedPath.addLine(to: CGPoint(x: width, y: height))
        curvedPath.addLine(to: CGPoint(x: 0, y: height))
        curvedPath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = curvedPath.cgPath
        blueBackgroundView.layer.mask = shapeLayer
    }
    
}

//#Preview {
//    MainPageViewController()
//}

