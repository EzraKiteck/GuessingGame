//
//  Results.swift
//  GuessingGame
//
//  Created by Ezra Kiteck on 10/14/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class ResultsController : UIViewController {
    
    var vc: ViewController = ViewController()

    @IBOutlet weak var winCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winCountLabel.text = "\(vc.winCount)"
    }
    
    
}
