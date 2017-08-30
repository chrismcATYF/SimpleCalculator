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
    
    @IBAction func onAddPressed(_ sender: UIButton) {
        processOps(operation: .Add)
    }
    
    @IBAction func onSubtractPressed(_ sender: UIButton) {
        processOps(operation: .Subtract)
    }
    
    @IBAction func onMultiplyPressed(_ sender: UIButton) {
        processOps(operation: .Multiply)
    }
    
    @IBAction func onDividePressed(_ sender: UIButton) {
        processOps(operation: .Divide)
    }
    
    @IBAction func onEqualsPressed(_ sender: UIButton) {
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
    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
        runningNumber = ""
        currentOperation = Operations.Empty
        leftValue = ""
        rightValue = ""
        result = ""
        textLabel.text = "0"
    }
}

