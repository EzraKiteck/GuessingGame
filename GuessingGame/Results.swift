//
//  Results.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/14/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class ResultsController : UIViewController {
    
    var redValue: Float = 0.17
    var greenValue: Float = 0.2
    var blueValue: Float = 0.24
    var textIsBlack: Bool = false
    
    var winCount: Int = 0
    var loseCount: Int = 0
    
    @IBOutlet weak var winLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets BG color
        self.view.backgroundColor = UIColor(red:CGFloat(redValue), green:CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
        //Sets font color
        if textIsBlack {
            winLabel.textColor = .black
        } else {
            winLabel.textColor = .white
        }
        //Sets text
        winLabel.text = "Times played:\n\(winCount + loseCount)\nTimes won:\n\(winCount)\nTimes lost:\n\(loseCount)"
    }
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
