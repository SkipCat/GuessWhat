//
//  GuessViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 26/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController, UITextViewDelegate {
    
    // Data received from previous form
    var wordToGuess: String?
    var finderPlayer: String?
    
    var questionField: UITextView = UITextView()
    let bottomView = UIView()
    
//    let scrollView: UIScrollView = {
//        let v = UIScrollView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = .cyan
//        return v
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setViewPreferences()
        
//        self.view.addSubview(scrollView)
        
        let playerLabel = UILabel()
        playerLabel.text = finderPlayer!
        self.view.addSubviewGrid(playerLabel, grid: [3.6, 1, 5, 0.5])
        
        let title = UILabel()
        title.text = "Guess the word"
        title.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubviewGrid(title, grid: [3.6, 1.5, 5, 0.5])
        
        questionField.setPreferences()
//        questionField.frame.size.height = 3
        // set number of taps to 1 to type text
        self.view.addSubviewGrid(questionField, grid: [1, 2.5, 10, 1])
        
        let yesButton = UIButton()
        yesButton.setTitle("Yes", for: .normal)
        yesButton.setPreferences()
        yesButton.addTarget(self, action: #selector(askQuestion(tapGestureRecognizer:)), for: .touchUpInside)
        self.view.addSubviewGrid(yesButton, grid: [1, 3.6, 1.4, 0.5])
        
        let noButton = UIButton()
        noButton.setTitle("No", for: .normal)
        noButton.setPreferences()
        noButton.addTarget(self, action: #selector(askQuestion(tapGestureRecognizer:)), for: .touchUpInside)
        self.view.addSubviewGrid(noButton, grid: [2.6, 3.6, 1.4, 0.5])
        
        let idkButton = UIButton()
        idkButton.setTitle("Don't know", for: .normal)
        idkButton.setPreferences()
        idkButton.addTarget(self, action: #selector(askQuestion(tapGestureRecognizer:)), for: .touchUpInside)
        self.view.addSubviewGrid(idkButton, grid: [4.2, 3.6, 3.4, 0.5])
        
        bottomView.backgroundColor = UIColor(red: 0.06, green: 0.49, blue: 0.67, alpha: 1)
        self.view.addSubviewGrid(bottomView, grid: [0, 11, 12, 1])
        
        let guessWordField = UITextField()
        guessWordField.setPreferences()
        bottomView.addSubviewGrid(guessWordField, grid: [1, 3, 8, 6])
        
        let guessWordBtn = UIButton()
        guessWordBtn.setPreferences()
        guessWordBtn.setTitle("OK", for: .normal)
        bottomView.addSubviewGrid(guessWordBtn, grid: [9.5, 3, 1.5, 6])
        
        print("IN GUESS VIEW CONTROLLER", wordToGuess!, finderPlayer!)
    }
    
    @objc func askQuestion(tapGestureRecognizer: UITapGestureRecognizer) {
        print(questionField.text)
        if let question = questionField.text, (question != "") {
            print("question", questionField.text!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
