//
//  CustomController.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/11/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class CustomController : UIViewController {
    
    //Variables
    var numberGuessMin = 1
    var numberGuessMax = 100
    var numberGuessCounter = 7
    var guessMode = "Normal"
    
    //UI Properties
    @IBOutlet weak var numberMinUI: UITextField!
    @IBOutlet weak var numberMaxUI: UITextField!
    @IBOutlet weak var guessCounterUI: UITextField!
    @IBOutlet weak var warningLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func readyButtonPressed(_ sender: Any) {
        //If the inputs are actually numbers, then continue.
        if (Int(numberMinUI.text!) != nil && Int(numberMaxUI.text!) != nil && Int(guessCounterUI.text!) != nil) {
            //Hide warning label and set the input to the number values.
                warningLabel.isHidden = true;
                numberGuessMin = Int(numberMinUI.text!)!
                numberGuessMax = Int(numberMaxUI.text!)!
                numberGuessCounter = Int(guessCounterUI.text!)!
        } else {
            //If one of the fields is not a number, send warning
            warningLabel.text = "Please enter a number in all fields"
            warningLabel.isHidden = false;
        }
        if (numberGuessMin > numberGuessMax) {
            //If range will be negative, send warning
            warningLabel.text = "The minimum number must be smaller than the maximum"
            warningLabel.isHidden = false;
        }
        if (numberGuessCounter < 1) {
            //If attempts is less than 1, send warning
            warningLabel.text = "Number of attempts must be greater than 0"
            warningLabel.isHidden = false;
        }
    }
    
    //Handles passing the variables to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.numberMin = numberGuessMin
            vc.numberMax = numberGuessMax
            vc.guessCounter = numberGuessCounter
            vc.mode = guessMode
        }
    }
    
}
