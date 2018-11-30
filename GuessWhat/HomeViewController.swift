//
//  HomeViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 26/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let playerOneInput: UITextField = UITextField()
    let playerTwoInput: UITextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topText = UILabel()
        topText.text = "Jouer Maintenant"
        topText.textColor = .gray
        self.view.addSubviewGrid(topText, grid: [4, 3, 10, 1])
        
        let playerOneText = UILabel()
        playerOneText.text = "Player 1"
        self.view.addSubviewGrid(playerOneText, grid: [1, 4, 10, 1])

        playerOneInput.backgroundColor = .gray
        playerOneInput.attributedPlaceholder = NSAttributedString(string: "Player 1", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        playerOneInput.setLeftPaddingPoints(amount: 10)
        playerOneInput.setRightPaddingPoints(amount: 10)
        playerOneInput.keyboardAppearance = UIKeyboardAppearance.dark;
        playerOneInput.autocapitalizationType = .none;
        self.view.addSubviewGrid(playerOneInput, grid: [1, 5, 10, 0.5])
        
        let playerTwoText = UILabel()
        playerTwoText.text = "Player 2"
        self.view.addSubviewGrid(playerTwoText, grid: [1, 6, 10, 1])
        
        playerTwoInput.backgroundColor = .gray
        playerTwoInput.attributedPlaceholder = NSAttributedString(string: "Player 2", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        playerTwoInput.setLeftPaddingPoints(amount: 10)
        playerTwoInput.setRightPaddingPoints(amount: 10)
        playerTwoInput.keyboardAppearance = UIKeyboardAppearance.dark;
        playerTwoInput.autocapitalizationType = .none;
        self.view.addSubviewGrid(playerTwoInput, grid: [1, 7, 10, 0.5])
        
        let buttonLetsGo = UIButton()
        buttonLetsGo.backgroundColor = .gray
        buttonLetsGo.setTitle("LET'S GO!", for: .normal)
        self.view.addSubviewGrid(buttonLetsGo, grid: [3.5, 9, 5, 0.5])
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonLetsGo(tapGestureRecognizer:)))
        buttonLetsGo.isUserInteractionEnabled = true
        buttonLetsGo.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let FormViewController = segue.destination as? FormViewController {
            FormViewController.players = sender as? [String]
        }
    }

    @objc func buttonLetsGo(tapGestureRecognizer: UITapGestureRecognizer) {
        if playerOneInput.text != "" || playerTwoInput.text != "" {
            let players = [playerOneInput.text, playerTwoInput.text]
            self.performSegue(withIdentifier: "FormViewController", sender: players)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
