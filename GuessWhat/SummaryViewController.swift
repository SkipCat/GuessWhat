//
//  SummaryViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 11/12/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    // Data received from previous view
    var wordToGuess: String?
    var finderPlayer: String?
    var answerPlayer: String?
    var answerCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setViewPreferences()
        
        let navView: UIView = self.view.setNav()
        
        var playerWin: String = ""
        if answerCount! < 10 {
            playerWin += finderPlayer!
        } else {
            playerWin += answerPlayer!
        }
        
        let navLabel = UILabel()
        navLabel.text = "Game summary"
        navLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navView.addSubviewGrid(navLabel, grid: [4, 5.5, 4, 6])
        
        let historyBtn = UIButton()
        historyBtn.setTitle("History", for: .normal)
        navView.addSubviewGrid(historyBtn, grid: [9, 5.5, 3, 6])
        historyBtn.addTarget(self, action: #selector(goToHistory(tapGestureRecognizer:)), for: .touchUpInside)
    
        let winnerNameText = UILabel()
        winnerNameText.text = playerWin
        winnerNameText.textAlignment = .center
        winnerNameText.font = winnerNameText.font.withSize(24)
        self.view.addSubviewGrid(winnerNameText, grid: [0, 1.5, 12, 2])
        
        let topText = UILabel()
        topText.text = "won the game!"
        topText.textAlignment = .center
        self.view.addSubviewGrid(topText, grid: [0, 2, 12, 2])
        
        let wordToGuessText = UILabel()
        wordToGuessText.text = wordToGuess
        wordToGuessText.textAlignment = .center
        wordToGuessText.font = winnerNameText.font.withSize(24)
        self.view.addSubviewGrid(wordToGuessText, grid: [0, 3.5, 12, 2])
        
        let wordText = UILabel()
        wordText.text = "was the word to find"
        wordText.textAlignment = .center
        self.view.addSubviewGrid(wordText, grid: [0, 4, 12, 2])
        
        let countAnswerText = UILabel()
        countAnswerText.text = "\(String(describing: answerCount!)) number of questions \n asked before guessing the word"
        countAnswerText.numberOfLines = 2
        countAnswerText.textAlignment = .center
        self.view.addSubviewGrid(countAnswerText, grid: [0, 5.5, 12, 2])
        
        let playAgainBtn = UIButton()
        playAgainBtn.setTitle("Play again", for: .normal)
        playAgainBtn.setPreferences()
        self.view.addSubviewGrid(playAgainBtn, grid: [4.5, 8.5, 3.2, 0.5])
        
        // add perform segue to go to FormViewController
    }
    
    @objc func goToHistory(tapGestureRecognizer: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "HistoryViewController", sender: nil)
    }
}
