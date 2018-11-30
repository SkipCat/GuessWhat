//
//  FormViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 26/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = [String]()
    var wordField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel()
        title.text = "Prerequisites"
        title.font = UIFont.boldSystemFont(ofSize: 22)
        self.view.addSubviewGrid(title, grid: [1, 2.5, 5, 0.5])
        title.center.x = self.view.center.x
        
        let pickerLabel = UILabel()
        pickerLabel.text = "Select the player who will try to find the word"
        self.view.addSubviewGrid(pickerLabel, grid: [1, 3.5, 10, 0.5])
        
        let finderPlayerPicker = UIPickerView()
        finderPlayerPicker.delegate = self
        finderPlayerPicker.dataSource = self
        pickerData = ["Joueur 1", "Joueur 2"]
        self.view.addSubviewGrid(finderPlayerPicker, grid: [1, 4, 10, 0.5]) // x, y, width, height
        
        let wordLabel = UILabel()
        wordLabel.text = "Choose the word to be guessed"
        self.view.addSubviewGrid(wordLabel, grid: [1, 5, 10, 0.5])
        
        wordField.backgroundColor = .gray
        wordField.setLeftPaddingPoints(amount: 10)
        wordField.setRightPaddingPoints(amount: 10)
        wordField.autocapitalizationType = .none;
        self.view.addSubviewGrid(wordField, grid: [1, 5.5, 10, 0.5])
        
        let playButton = UIButton()
        playButton.backgroundColor = UIColor.darkGray
        playButton.setTitle("PLAY", for: .normal)
        self.view.addSubviewGrid(playButton, grid: [3.5, 7, 5, 0.5])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginTapped(tapGestureRecognizer:)))
        playButton.isUserInteractionEnabled = true
        playButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @objc func loginTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if let wordToGuess = wordField.text, (wordToGuess != "") {
            self.performSegue(withIdentifier: "GuessViewController", sender: wordToGuess)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let guessViewController = segue.destination as? GuessViewController {
            guessViewController.wordToGuess = sender as? String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
