//
//  GuessViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 26/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
    var wordToGuess: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "GUESS VIEW CONTROLLER"
        self.view.addSubviewGrid(label, grid: [3.5, 7, 5, 0.5])
        
        print("IN GUESS VIEW CONTROLLER", wordToGuess!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
