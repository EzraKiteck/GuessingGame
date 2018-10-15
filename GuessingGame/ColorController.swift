//
//  ColorController.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/15/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class ColorController : UIViewController {
    
    //Variables
    var redValue: Float = 1
    var greenValue: Float = 1
    var blueValue: Float = 1
    var textIsBlack: Bool = false
    
    var winCount: Int = 0
    var loseCount: Int = 0
    
    //UI Properties
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        if textIsBlack {
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
        } else {
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
        }
    }
    
    //When randomColor butotn is pressed, a random number is chosen, then the bg is set according to the number.  The text color is also changed if necessary
    @IBAction func randomColotButtonPressed(_ sender: Any) {
        let color = Int(arc4random_uniform(6))
        switch color {
        case 0:
            redValue = 1
            greenValue = 0
            blueValue = 0
            self.colorLabel.text = "Red"
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
            textIsBlack = false
        case 1:
            redValue = 1
            greenValue = 0.65
            blueValue = 0
            self.colorLabel.text = "Orange"
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        case 2:
            redValue = 1
            greenValue = 1
            blueValue = 0
            self.colorLabel.text = "Yellow"
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        case 3:
            redValue = 0
            greenValue = 1
            blueValue = 0
            self.colorLabel.text = "Green"
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        case 4:
            redValue = 0
            greenValue = 0
            blueValue = 1
            self.colorLabel.text = "Blue"
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
            textIsBlack = false
        case 5:
            redValue = 0.65
            greenValue = 0
            blueValue = 1
            self.colorLabel.text = "Purple"
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
            textIsBlack = false
        default:
            redValue = 1
            greenValue = 1
            blueValue = 1
            self.colorLabel.text = "White"
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        }
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
    }
    
    //When red slider is used, change red value to the slider value and recalculate the bg color.
    @IBAction func redSliderUsed(_ sender: UISlider) {
        redValue = Float(sender.value)
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        self.colorLabel.text = "RGB"
        //If the bg color is dark enough, change the text color to white.  Else, make it black.
        if (redValue + blueValue + greenValue <= 0.75) {
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
            textIsBlack = false
            
        } else {
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        }
    }
    
    //When green slider is used, change green value to the slider value and recalculate the bg color.
    @IBAction func greenSliderUsed(_ sender: UISlider) {
        greenValue = Float(sender.value)
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        self.colorLabel.text = "RGB"
        //If the bg color is dark enough, change the text color to white.  Else, make it black.
        if (redValue + blueValue + greenValue <= 0.75) {
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
            textIsBlack = false
            
        } else {
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        }
    }
    
    //When blue slider is used, change blue value to the slider value and recalculate the bg color.
    @IBAction func blueSliderUsed(_ sender: UISlider) {
        blueValue = Float(sender.value)
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        self.colorLabel.text = "RGB"
        //If the bg color is dark enough, change the text color to white.  Else, make it black.
        if (redValue + blueValue + greenValue <= 0.75) {
            self.colorLabel.textColor = .white
            self.redLabel.textColor = .white
            self.greenLabel.textColor = .white
            self.blueLabel.textColor = .white
            textIsBlack = false
            
        } else {
            self.colorLabel.textColor = .black
            self.redLabel.textColor = .black
            self.greenLabel.textColor = .black
            self.blueLabel.textColor = .black
            textIsBlack = true
        }
    }
    
    //When default button is pressed, change the bg and text colors back to the default
    @IBAction func defaultButtonPressed(_ sender: Any) {
        self.view.backgroundColor = UIColor(red:0.17, green:0.20, blue:0.24, alpha:1.0)
        redValue = 0.17
        greenValue = 0.20
        blueValue = 0.24
        self.colorLabel.textColor = .white
        self.redLabel.textColor = .white
        self.greenLabel.textColor = .white
        self.blueLabel.textColor = .white
        textIsBlack = false
        colorLabel.text = "Default"
    }
    
    //Handles passing the variables to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TitleController {
            vc.redValue = redValue
            vc.greenValue = greenValue
            vc.blueValue = blueValue
            vc.textIsBlack = textIsBlack
            
            vc.winCount = winCount
            vc.loseCount = loseCount
        }
    }
    
}
