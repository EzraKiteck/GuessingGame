//
//  TitleController.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/15/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class TitleController : UIViewController {
    
    var redValue: Float = 0.17
    var greenValue: Float = 0.2
    var blueValue: Float = 0.24
    var textIsBlack: Bool = false
    
    var winCount: Int = 0
    var loseCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ColorController {
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
        if let vc = segue.destination as? ResultsController {
            vc.redValue = redValue
            vc.greenValue = greenValue
            vc.blueValue = blueValue
            vc.textIsBlack = textIsBlack
            
            vc.winCount = winCount
            vc.loseCount = loseCount
        }
    }
    
    

}
