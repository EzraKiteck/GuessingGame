//
//  ViewController.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/9/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberMin: Int = 1
    var numberMax: Int = 100
    var guessCounter: Int = 7
    var number: Int = 0
    @IBOutlet weak var numberGuess: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

