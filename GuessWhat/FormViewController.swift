//
//  FormViewController.swift
//  GuessWhat
//
//  Created by Cécile Huguet on 26/11/2018.
//  Copyright © 2018 Cécile Huguet. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var players: [String]?
    var pickerData: [String] = [String]()
    var wordField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.12, green: 0.73, blue: 0.84, alpha: 1.0)
        
        let title = UILabel()
        title.text = "Prerequisites"
        title.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubviewGrid(title, grid: [4, 2.5, 5, 0.5])
        
        let pickerLabel = UILabel()
        pickerLabel.text = "Select the player who will try to find the word:"
        pickerLabel.font = pickerLabel.font.withSize(18)
        pickerLabel.lineBreakMode = .byWordWrapping
        pickerLabel.numberOfLines = 0
        self.view.addSubviewGrid(pickerLabel, grid: [1, 4, 10, 1])
        
        let finderPlayerPicker = UIPickerView()
        finderPlayerPicker.backgroundColor = .white
        finderPlayerPicker.layer.cornerRadius = 5
        finderPlayerPicker.delegate = self
        finderPlayerPicker.dataSource = self
        pickerData = players!
        self.view.addSubviewGrid(finderPlayerPicker, grid: [1, 5, 10, 0.5]) // x, y, width, height
        
        let wordLabel = UILabel()
        wordLabel.text = "Choose the word to be guessed:"
        wordLabel.font = wordLabel.font.withSize(18)
        self.view.addSubviewGrid(wordLabel, grid: [1, 6, 10, 0.5])
        
        wordField.backgroundColor = .white
        wordField.layer.cornerRadius = 5
        wordField.attributedPlaceholder = NSAttributedString(string: "Example: beautiful", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        wordField.setLeftPaddingPoints(amount: 10)
        wordField.setRightPaddingPoints(amount: 10)
        wordField.autocapitalizationType = .none;
        self.view.addSubviewGrid(wordField, grid: [1, 6.5, 10, 0.5])
        
        let playButton = UIButton()
        playButton.backgroundColor = .black
        playButton.layer.cornerRadius = 5
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        playButton.setTitle("PLAY", for: .normal)
        self.view.addSubviewGrid(playButton, grid: [3.5, 8, 5, 0.5])
        
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
