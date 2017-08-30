//
//  ViewController.swift
//  Simple Calculator
//
//  Created by Chris McDonald on 8/29/17.
//  Copyright © 2017 Chris McDonald. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    enum Operations: String {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = "Empty"
    }
    
    var runningNumber = ""
    var currentOperation = Operations.Empty
    var leftValue = ""
    var rightValue = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "0"
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        textLabel.text = runningNumber
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOps(operation: .Add)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOps(operation: .Subtract)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOps(operation: .Multiply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOps(operation: .Divide)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOps(operation: currentOperation)
    }
    
    func processOps(operation: Operations) {
        if currentOperation != Operations.Empty {
            
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == Operations.Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == Operations.Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == Operations.Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == Operations.Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                textLabel.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        runningNumber = ""
        currentOperation = Operations.Empty
        leftValue = ""
        rightValue = ""
        result = ""
        textLabel.text = "0"
    }
}

