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
    @IBOutlet weak var opLog: UILabel!

    var inNumberEntry = false
    var alreadyHasDecimal = false

    var brain = CalculatorBrain()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if inNumberEntry {
            display.text = display.text! + digit
        } else {
            display.text = digit
            inNumberEntry = true
        }

    }

    @IBAction func decimalPoint() {
        if !alreadyHasDecimal {
            alreadyHasDecimal = true
            if inNumberEntry {
                display.text = display.text! + "."
            } else {
                display.text = "0."
                inNumberEntry = true
            }
        }
    }

    @IBAction func operate(sender: UIButton) {
        if inNumberEntry {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }

    @IBAction func enter() {
        inNumberEntry = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }

    @IBAction func clear() {
        inNumberEntry = false
        alreadyHasDecimal = false
        displayValue = 0
        brain.clear()
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

