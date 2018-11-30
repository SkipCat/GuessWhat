//
//  ViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 20/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//


import UIKit
import Alamofire
import PromiseKit

struct TokenData : Codable {
    var token: String
}

struct RequestData : Codable {
    var data: TokenData
    var status: Int
}

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
        self.emailField.autocapitalizationType = .none;
        self.view.addSubviewGrid(self.emailField, grid: [1, 4, 10, 0.5]) // x, y, width, height
        
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        self.view.addSubviewGrid(passwordLabel, grid: [1, 5, 10, 0.5])
        
        self.passwordField.backgroundColor = .gray
        self.passwordField.setLeftPaddingPoints(amount: 10)
        self.passwordField.setRightPaddingPoints(amount: 10)
        self.passwordField.keyboardAppearance = UIKeyboardAppearance.dark;
        self.passwordField.isSecureTextEntry = true
        self.passwordField.autocapitalizationType = .none;
        self.view.addSubviewGrid(self.passwordField, grid: [1, 5.5, 10, 0.5])
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.setTitle("Log in", for: .normal)
        self.view.addSubviewGrid(loginButton, grid: [3.5, 7, 5, 0.5])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginTapped(tapGestureRecognizer:)))
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        
        // There’s some text before the @
        // There’s some text after the @
        // There’s at least 2 alpha characters after a
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        
        return pred.evaluate(with: email)
    }
    
    func getToken(email: String, pwd: String) -> Promise<String> {
        let parameters = ["email": email, "password": pwd]
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        return Promise { seal in
            Alamofire.request("http://edu2.shareyourtime.fr/api/auth/", method: HTTPMethod.post, parameters: parameters, encoding: URLEncoding(), headers: headers).validate().responseJSON { response in
                switch response.result {
                case .success:
                    if let result = response.result.value {
                        let json = result as! NSDictionary
                        let jsonData = json["data"]! as! NSDictionary
                        let token = jsonData["token"]!
                        seal.fulfill(token as! String)
                    }
                case .failure:
                    seal.reject(response.error!)
                }
            }
        }
    }
    
    @objc func loginTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let emailValue = self.emailField.text! // "!" removes Optional from string
        let passValue = self.passwordField.text!
        
        if (!isValidEmail(email: emailValue)) {
            print("invalid email")
        }
        
        // Authentication
        getToken(email: emailValue, pwd: passValue).done { token in
            Alamofire.request("http://edu2.shareyourtime.fr/api/secret/", headers: ["Authorization": "Bearer \(token)"]).responseJSON { response in
                if (response.response?.statusCode == 200) {
                    self.performSegue(withIdentifier: "HomeViewController", sender: nil)
                } else {
                    print("Invalid token provided")
                }
            }
        }.catch { error in print(error) }
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
