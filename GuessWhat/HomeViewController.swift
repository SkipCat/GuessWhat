//
//  HomeViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 26/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.setTitle("PLAY", for: .normal)
        self.view.addSubviewGrid(loginButton, grid: [3.5, 7, 5, 0.5])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginTapped(tapGestureRecognizer:)))
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func loginTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "FormViewController", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
