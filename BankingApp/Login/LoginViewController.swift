//
//  ViewController.swift
//  BankingApp
//
//  Created by Lucas Rasmusson on 2025-08-13.
//

import UIKit

class LoginViewController: UIViewController {

    // 1. start by defining name of view we want to use
    let loginView = LoginView()
    
    let signInButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. defining necessary functions for style and layout
        style()
        layout()
    }

}

extension LoginViewController {
    func style() {
        // 3. makes view ready for AutoLayout
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for:[])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
    }
    
    
    func layout() {
        // 4. takes view and adds it into the ViewController for use
        view.addSubview(loginView)
        view.addSubview(signInButton)
        
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
    }
}

extension LoginViewController{
    @objc func signInTapped(sender: UIButton) {
        
    }
}
