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
    var totalGuessCounter: Int = 7
    var number: Int = 0
    var mode = "Mode"
    var winCount: Int = 0
    var loseCount: Int = 0

    //UI Properties
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var numberGuess: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessRemainingLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var lossLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Uses the min and max to create range of numbers for the random result
        number = Int.random(in: numberMin...numberMax)
        //Display guesses remaining, restart button, shows instruction and mode text, sets the totalGuessCounter, and waits for input.
        modeLabel.text = mode
        instructionLabel.text = "Guess the number between\n \(numberMin) and \(numberMax)"
        displayCounter()
        totalGuessCounter = guessCounter
        resultLabel.text = "Waiting for input..."
        restartButton.setTitle("Restart", for: .normal)
        //Show score
        winLabel.text = "Wins:\n \(winCount)"
        lossLabel.text = "Losses:\n \(loseCount)"
        applyRoundCorner(winLabel)
        applyRoundCorner(lossLabel)
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
            numberGuess.isEnabled = false;
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
                    //...congratulate player, and disable guess button, add winCount, set counter to 0.
                    winCount += 1
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
                    //...however, if counter hits zero, display "you lose" and disable guess button, and add 1 to loseCount.
                    if guessCounter == 0 {
                        resultLabel.text = "You lose! The number was \(number)."
                        loseCount += 1
                        guessButton.isEnabled = false;
                    }
                }
            }
        } else {
            //If guess is a string, then ask for input again.
            resultLabel.text = "Please input a number."
        }
        //Finally, display attempts remaining and score accordingly.
        displayCounter()
        winLabel.text = "Wins:\n \(winCount)"
        lossLabel.text = "Losses:\n \(loseCount)"
    }
 
    @IBAction func Restart(_ sender: Any) {
        //Randoimzes number, resets guess counter, clears input field, resets Restart button, resets resultLabel, and enables guess button
        randomizeNumber()
        guessCounter = totalGuessCounter
        displayCounter()
        resultLabel.text = "Waiting for input..."
        guessButton.isEnabled = true;
        restartButton.setTitle("Restart", for: .normal)
        numberGuess.text = ""
        numberGuess.isEnabled = true;
    }
    
    //Smoothens the edges of any object
    func applyRoundCorner(_ object: AnyObject) {
        object.layer?.cornerRadius = object.frame.size.width / 8
        object.layer?.masksToBounds = true
    }
}

