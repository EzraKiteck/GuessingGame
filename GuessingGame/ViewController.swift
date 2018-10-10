//
//  ViewController.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/9/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var numberMin: Int = 1
    var numberMax: Int = 100
    var guessCounter: Int = 7
    var number: Int = 0
    
    //UI Properties
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var numberGuess: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessRemainingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Uses the min and max to create range of numbers for the random result
        number = Int.random(in: numberMin...numberMax)
        //Display guesses remaining, restart button, and wait for input.
        displayCounter()
        resultLabel.text = "Waiting for input..."
        restartButton.setTitle("Restart", for: .normal)
    }
    
    func randomizeNumber() {
        //Randomizes the number using the range given from the start function
        number = Int.random(in: numberMin...numberMax)
    }
    
    func displayCounter() {
        //If counter is 0...
        if guessCounter == 0 {
            //...Ask if the user wants to play again, setting restart button to "Play again"
            guessRemainingLabel.text = "Would you like to play again?"
            restartButton.setTitle("Play Again", for: .normal)
        } else {
            //...else, if counter is equal to 1...
            if guessCounter == 1 {
                //...remove "s" from "Attempts" so that is is grammatically correct
                guessRemainingLabel.text = "You have \(guessCounter) attempt remaining."
            } else {
                //...Otherwise, just display attempts remaining.
                guessRemainingLabel.text = "You have \(guessCounter) attempts remaining."
            }
        }
    }

    @IBAction func guessButtonTapped(_ sender: UIButton) {
        //If guess is actually a number, then continue.
        if Int(numberGuess.text!) != nil {
            //If number is outside of the range, then reprimand player
            if (Int(numberGuess.text!)! > numberMax || Int(numberGuess.text!)! < numberMin) {
                resultLabel.text = "Try a number between \(numberMin) and \(numberMax)"
            } else {
                //If guess is equal to number...
                if (Int(numberGuess.text!) == number) {
                    //...congratulate player, and disable guess button, set counter to 0.
                    resultLabel.text = "You guessed the number!"
                    guessCounter = 0
                    guessButton.isEnabled = false;
                } else {
                    //... else, subtract one guess attempt and...
                    guessCounter -= 1
                    //...if guess is less than number, say "Too low"...
                    if (Int(numberGuess.text!)! < number) {
                        resultLabel.text = "\(numberGuess.text!) is too low."
                    } else {
                        //...else, number should be too high, so say "Too high"...
                        resultLabel.text = "\(numberGuess.text!) is too high."
                    }
                    //...however, if counter hits zero, display "you lose" and disable guess button.
                    if guessCounter == 0 {
                        resultLabel.text = "You lose! The number was \(number)."
                        guessButton.isEnabled = false;
                    }
                }
            }
        } else {
            //If guess is a string, then ask for input again.
            resultLabel.text = "Please input a number."
        }
        //Finally, display attempts remaining accordingly.
        displayCounter()
    }
 
    @IBAction func Restart(_ sender: Any) {
        //Randoimzes number, resets guess counter, resets Restart button, resets resultLabel, and enables guess button
        randomizeNumber()
        guessCounter = 7
        displayCounter()
        resultLabel.text = "Waiting for input..."
        guessButton.isEnabled = true;
        restartButton.setTitle("Restart", for: .normal)
    }
}

