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

    var inNumberEntry: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if inNumberEntry {
            display.text = display.text! + digit
        } else {
            display.text = digit
            inNumberEntry = true
        }

    }

    @IBAction func operate(sender: UIButton) {
    }
    
    var operandStack = Array<Double>()

    @IBAction func enter() {
        inNumberEntry = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }

    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
}

