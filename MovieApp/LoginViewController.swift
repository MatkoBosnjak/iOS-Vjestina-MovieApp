//
//  LoginViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.04.2023..
//

import Foundation
import PureLayout
import UIKit


class LoginViewController: UIViewController {
    
    private var signInLabel: UILabel!
    private var emailLabel: UILabel!
    private var passwordLabel: UILabel!
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var signInButton: UIButton!
    
    private let backgroundColor = UIColor(red: 0.04, green: 0.15, blue: 0.25, alpha: 1.0)
    //another way of changing backgorund color would be  view.backgroundColor = ... inside viewDidLoad()
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = self.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        
    }
    
    private func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        signInLabel = UILabel()
        emailLabel = UILabel()
        passwordLabel = UILabel()
        emailTextField = UITextField()
        passwordTextField = UITextField()
        signInButton = UIButton()
        styleViews()
    }
    
    private func styleViews() {
        //sign in label
        signInLabel.text = "Sign in"
        signInLabel.textColor = .white
        signInLabel.textAlignment = .center
        signInLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        //email label
        emailLabel.text = "Email address"
        emailLabel.textAlignment = .left
        emailLabel.textColor = .white
        passwordLabel.font = UIFont.systemFont(ofSize: 14.0)
        
        //email text field
        emailTextField.text = "ex. Matt@iosCourse.com"
        emailTextField.textColor = UIColor(red: 0.3, green: 0.7, blue: 0.87, alpha: 1.0)
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.textAlignment = .left
        emailTextField.backgroundColor = UIColor(red: 0.07, green: 0.23, blue: 0.39, alpha: 1.0)
        emailTextField.layer.cornerRadius = 10.0
        emailTextField.layer.borderWidth = 1.0
        let myColor : UIColor = UIColor(red: 0.08, green: 0.3, blue: 0.52, alpha: 1.0)
        emailTextField.layer.borderColor = myColor.cgColor
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        
        //password label
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont.systemFont(ofSize: 14.0)
        
        //password text field -- same as email text field
        passwordTextField.text = "Enter your password"
        passwordTextField.textColor = UIColor(red: 0.3, green: 0.7, blue: 0.87, alpha: 1.0)
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.textAlignment = .left
        passwordTextField.backgroundColor = UIColor(red: 0.07, green: 0.23, blue: 0.39, alpha: 1.0)
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = myColor.cgColor
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        
        //sign in button
        signInButton.setTitle("Sign in", for: .normal) //is selected, is highlighted
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        signInButton.layer.cornerRadius = 10.0
        signInButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.87, alpha: 1.0)
        defineLayoutForViews()
        
    }
    
    private func defineLayoutForViews() {
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        
        
        


        
        signInLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        signInLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        signInLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 92)
        
        emailLabel.autoPinEdge(.top, to: .bottom, of: signInLabel, withOffset: 48)
        emailLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        emailLabel.autoPinEdge(toSuperviewEdge: .right)
        
        emailTextField.autoPinEdge(.top, to: .bottom, of: emailLabel, withOffset: 8)
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        emailTextField.autoSetDimension(.height, toSize: 40)
        
        passwordLabel.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 24)
        passwordLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        passwordLabel.autoPinEdge(toSuperviewEdge: .right)
        
        passwordTextField.autoPinEdge(.top, to: .bottom, of: passwordLabel, withOffset: 8)
        passwordTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        passwordTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        passwordTextField.autoSetDimension(.height, toSize: 40)
        
        signInButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 48)
        signInButton.autoPinEdge(toSuperviewEdge: .left, withInset: 32)
        signInButton.autoPinEdge(toSuperviewEdge: .right, withInset: 32)
        signInButton.autoSetDimension(.height, toSize: 40)

        

    }
}
