//
//  LoginView.swift
//  BankingApp
//
//  Created by Lucas Rasmusson on 2025-08-13.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //insantiate stackview
    let stackView = UIStackView()
    
    //get usernameTextField and passwordTextFieldReady
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    
    let dividerView = UIView()
    
    
    //get the init ready
    override init(frame: CGRect){
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    //fail if we don't have init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LoginView {
    
    //define functions in init
    
    //define style
    func style() {
        //this line get's ready for autolayout
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        //initialize StackView settings
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8 //spacing between elements in stackView

    
        usernameTextField.placeholder = "Username"
        // register this view as a delate for the text field
        // meaning the text field can send messages regarding whateher it's being edited or not
        // by registering self as a delgate for the TextField we have to implement certain methods
        usernameTextField.delegate = self
        
        
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        
        dividerView.backgroundColor = .secondarySystemFill
        
    }
    
    //define layout
    func layout(){
        //add usernameTextField and passwordTextField to stackView
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        //add stackView to view
        addSubview(stackView)
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true //set height of dividerView to be 1
        
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing (_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing (_ textField: UITextField) {
        
    }
}
