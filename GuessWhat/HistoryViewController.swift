//
//  HistoryViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 11/12/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.

import UIKit

class HistoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setViewPreferences()
        
        let nav = self.view.setNavWithBackBtn()
        let navView: UIView = nav[0] as! UIView
        let goBackBtn: UIButton = nav[1] as! UIButton
        goBackBtn.addTarget(self, action: #selector(goBack(tapGestureRecognizer:)), for: .touchUpInside)
        
        let navLabel = UILabel()
        navLabel.text = "History"
        navLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navView.addSubviewGrid(navLabel, grid: [5, 5.5, 3, 6])
        
    }
    
    @objc func goBack(tapGestureRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

