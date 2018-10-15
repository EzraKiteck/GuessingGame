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
    
    var redValue: Float = 0.17
    var greenValue: Float = 0.2
    var blueValue: Float = 0.24
    var textIsBlack: Bool = false
    
    var winCount: Int = 0
    var loseCount: Int = 0
    
    //UI Properties
    @IBOutlet weak var numberMinUI: UITextField!
    @IBOutlet weak var numberMaxUI: UITextField!
    @IBOutlet weak var guessCounterUI: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var readyButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var andLabel: UILabel!
    @IBOutlet weak var attemptsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets BG color
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        //Sets Text color
        if textIsBlack {
            titleLabel.textColor = .black
            guessLabel.textColor = .black
            andLabel.textColor = .black
            attemptsLabel.textColor = .black
        } else {
            titleLabel.textColor = .white
            guessLabel.textColor = .white
            andLabel.textColor = .white
            attemptsLabel.textColor = .white
        }
        readyButton.isEnabled = false;
    }
    
    @IBAction func setButtonPressed(_ sender: Any) {
        //If the inputs are actually numbers...
        if (Int(numberMinUI.text!) != nil && Int(numberMaxUI.text!) != nil && Int(guessCounterUI.text!) != nil) {
            //...set the values and continue to check for errors.
            numberGuessMin = Int(numberMinUI.text!)!
            numberGuessMax = Int(numberMaxUI.text!)!
            numberGuessCounter = Int(guessCounterUI.text!)!
            if (numberGuessMin < numberGuessMax) {
                if (numberGuessCounter > 0) {
                    //Hide warning label and set the input to the number values.
                    warningLabel.isHidden = true;
                    guessMode = "Custom"
                    readyButton.isEnabled = true
                } else {
                    print("You need more than 0 attempts!")
                    //If attempts is less than 1, send warning
                    warningLabel.text = "Number of attempts must be greater than 0"
                    readyButton.isEnabled = false;
                    warningLabel.isHidden = false;
                }
            } else {
                print("No negative range!")
                //If range will be negative, send warning
                warningLabel.text = "The minimum number must be smaller than the maximum"
                readyButton.isEnabled = false;
                warningLabel.isHidden = false;
            }
        } else {
            print("Please input numbers!")
            //If one of the fields is not a number, send warning
            warningLabel.text = "Please enter a number in all fields"
            readyButton.isEnabled = false;
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
            
            vc.redValue = redValue
            vc.greenValue = greenValue
            vc.blueValue = blueValue
            vc.textIsBlack = textIsBlack
            
            vc.winCount = winCount
            vc.loseCount = loseCount
        }
        if let vc = segue.destination as? DifficultyVC {
            vc.redValue = redValue
            vc.greenValue = greenValue
            vc.blueValue = blueValue
            vc.textIsBlack = textIsBlack
            
            vc.winCount = winCount
            vc.loseCount = loseCount
        }
    }
    
}
