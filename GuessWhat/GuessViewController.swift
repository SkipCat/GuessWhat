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
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(scrollView)
        
        let title = UILabel()
        title.text = "Guess the word"
        title.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubviewGrid(title, grid: [3.6, 2, 5, 0.5])
        
        print("IN GUESS VIEW CONTROLLER", wordToGuess!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
