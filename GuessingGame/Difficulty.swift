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
    
    var redValue: Float = 0.17
    var greenValue: Float = 0.2
    var blueValue: Float = 0.24
    var textIsBlack: Bool = false
    
    var winCount: Int = 0
    var loseCount: Int = 0
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets BG color
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        //Sets Text color
        if textIsBlack {
            instructionLabel.textColor = .black
        } else {
            instructionLabel.textColor = .white
        }
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
        if let vc = segue.destination as? TitleController {
            vc.redValue = redValue
            vc.greenValue = greenValue
            vc.blueValue = blueValue
            vc.textIsBlack = textIsBlack
            
            vc.winCount = winCount
            vc.loseCount = loseCount
        }
        if let vc = segue.destination as? CustomController {
            vc.redValue = redValue
            vc.greenValue = greenValue
            vc.blueValue = blueValue
            vc.textIsBlack = textIsBlack
            
            vc.winCount = winCount
            vc.loseCount = loseCount
        }
        
    }
}
