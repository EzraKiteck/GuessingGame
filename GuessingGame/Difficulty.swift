//
//  Difficulty.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/11/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class DifficultyVC : UIViewController{
    
    //Variables
    var numberGuessMin = 1
    var numberGuessMax = 100
    var numberGuessCounter = 7
    var guessMode = "Normal"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Sets range for Easy mode
    @IBAction func easyButtonPressed(_ sender: Any) {
        numberGuessMin = 1
        numberGuessMax = 50
        numberGuessCounter = 7
        guessMode = "Easy"
    }
    
    //Sets range for Medium mode
    @IBAction func normalButtonPressed(_ sender: Any) {
        numberGuessMin = 1
        numberGuessMax = 100
        numberGuessCounter = 7
        guessMode = "Normal"
    }
    
    //Sets range for Hard mode
    @IBAction func hardButtonPressed(_ sender: Any) {
        numberGuessMin = 1
        numberGuessMax = 250
        numberGuessCounter = 8
        guessMode = "Hard"
        print("And...")
    }
    
    //Handles passing the variables to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let difficultyVC = segue.destination as? ViewController {
            difficultyVC.numberMin = numberGuessMin
            difficultyVC.numberMax = numberGuessMax
            difficultyVC.guessCounter = numberGuessCounter
            difficultyVC.mode = guessMode
            print("Go")
        }
    }
}
