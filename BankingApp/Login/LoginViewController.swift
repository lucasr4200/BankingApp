//
//  LoginViewController.swift
//  BankingApp
//
//  Created by Lucas Rasmusson on 2025-08-13.
//

import UIKit

class LoginViewController: UIViewController {

    // 1. start by defining name of views and elements we want to use
    let titleLabelView = UILabel()
    let subtitleLabelView = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. defining necessary functions for style and layout
        style()
        layout()
    }

}

extension LoginViewController {
    func style() {
        
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.text = "Banking App"
        titleLabelView.font = .systemFont(ofSize: 36, weight: .bold)
        titleLabelView.textAlignment = .center
        titleLabelView.numberOfLines = 0
        
        subtitleLabelView.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabelView.text = "This is a banking app!"
        subtitleLabelView.font = .systemFont(ofSize: 17)
        subtitleLabelView.textAlignment = .center
        subtitleLabelView.numberOfLines = 0
        
        
        // 3. makes view ready for AutoLayout
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for:[])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0 //makes label multiline
        errorMessageLabel.isHidden = true
        
    }
    
    
    func layout() {
        // 4. takes views/ elements and adds it into the ViewController for use
        view.addSubview(titleLabelView)
        view.addSubview(subtitleLabelView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //titleText
        NSLayoutConstraint.activate([
            subtitleLabelView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabelView.bottomAnchor, multiplier: 3), //pin to what's below
            titleLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        //subtitleText
        NSLayoutConstraint.activate([
            subtitleLabelView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleLabelView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabelView.bottomAnchor, multiplier: 3) //pin to what's below
        ])
        
        
        
        
        // 5. put all autolayout constraints to be activated all at once
        //LoginView
        NSLayoutConstraint.activate([
            
            // centres view along the y axis
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //use a system multiplier of 8 points and put the spacing of the leading edge 8 points off the side
            //the multiplier of 1 means 8 points, 2 means 16 points etc
            //place the loginView.leadingAnchor after the view.leadingAnchor
            //ie, we want it to be left to right for for leadingAnchor
            // RULE of THUMB for leading(left to right) child first(LoginView) then parent(view)
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            
            // do the same thing as above for the trailing anchor
            //because it's trailing anchor swift View. and view.
            // have the view.trailingAnchor to come after the loginView.trailingAnchor
            // Place the view.trailingAnchor after the loginView.trailingAnchor
            // ie we want right to left for trailingAnchor
            // Rule of thumb for trailing(right to left) parent first(view) then child(LoginView)
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
            ])
        
        //Button constraints
        NSLayoutConstraint.activate([
            //centre signInButton
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            //signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
        ])
        
        //error label constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
            
        ])
    }
}

extension LoginViewController{
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true //hide error message by default
        login()
    }
    
    private func login(){
        
        //this guard clause converts optional string into string
        guard let username = username, let password = password else {
            assertionFailure( "Username or password should never be null") //we should never get here
            return
        }
        
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username and password are required")
            return
        }
        
        if username == "User" && password == "password"{
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
        
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}
