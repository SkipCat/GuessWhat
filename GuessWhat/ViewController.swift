//
//  ViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 20/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    let emailField: UITextField = UITextField()
    let passwordField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        self.view.addSubviewGrid(emailLabel, grid: [1, 3.5, 10, 0.5])
        
        self.emailField.backgroundColor = .gray
        self.emailField.setLeftPaddingPoints(amount: 10)
        self.emailField.setRightPaddingPoints(amount: 10)
        self.emailField.keyboardAppearance = UIKeyboardAppearance.dark;
        self.emailField.keyboardType = UIKeyboardType.emailAddress
        self.view.addSubviewGrid(self.emailField, grid: [1, 4, 10, 0.5]) // x, y, width, height
        
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        self.view.addSubviewGrid(passwordLabel, grid: [1, 5, 10, 0.5])
        
        self.passwordField.backgroundColor = .gray
        self.passwordField.setLeftPaddingPoints(amount: 10)
        self.passwordField.setRightPaddingPoints(amount: 10)
        self.passwordField.keyboardAppearance = UIKeyboardAppearance.dark;
        self.passwordField.keyboardType = UIKeyboardType.emailAddress
        self.view.addSubviewGrid(self.passwordField, grid: [1, 5.5, 10, 0.5])
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.setTitle("Log in", for: .normal)
        self.view.addSubviewGrid(loginButton, grid: [3.5, 7, 5, 0.5])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginTapped(tapGestureRecognizer:)))
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func loginTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let email = self.emailField.text
        let pass = self.passwordField.text
        
        print(email, pass)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension UIView {

    func addSubviewGrid(_ view: UIView, grid: [CGFloat]) {
        view.frame = CGRect(
            x: self.frame.width / 12 * grid[0],
            y: self.frame.height / 12 * grid[1],
            width: self.frame.width / 12 * grid[2],
            height: self.frame.height / 12 * grid[3]
        )
        self.addSubview(view)
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
