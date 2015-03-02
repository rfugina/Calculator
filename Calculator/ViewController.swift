//
//  ViewController.swift
//  Calculator
//
//  Created by Rob Fugina on 3/1/15.
//  Copyright (c) 2015 Rob Fugina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var inTheMiddle: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if inTheMiddle {
            display.text = display.text! + digit
        } else {
            display.text = digit
            inTheMiddle = true
        }
        
    }

}

