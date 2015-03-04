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

    @IBAction func doDrop() {
        if operandStack.count >= 1 {
            operandStack.removeLast()
        }
        if operandStack.count >= 1 {
            displayValue = operandStack.last!
        } else {
            display.text = "0"
        }
    }

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if inNumberEntry {
            enter()
        }
        switch operation {
            case "×": performOperation { $1 * $0 }
            case "÷": performOperation { $1 / $0 }
            case "+": performOperation { $1 + $0 }
            case "−": performOperation { $1 - $0 }
            case "√": performOperation { sqrt($0) }
            default: break
        }
    }

    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }

    }

    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
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

