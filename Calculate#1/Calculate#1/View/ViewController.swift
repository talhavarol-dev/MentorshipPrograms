//
//  ViewController.swift
//  Calculate#1
//
//  Created by Muhammet  on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -Enum/Case
    enum Operation: String {
        case Sum = "+"
        case Subtract = "-"
        case Divide = "/"
        case Multipliy = "*"
        case Nil = "Nil"
    }
    
    //MARK: -IBOutlet
    @IBOutlet weak var outputLabel: UILabel!
    
    //MARK: -Properties
    var runNumber = ""
    var leftData = ""
    var rightData = ""
    var result = ""
    var currentOperation: Operation = .Nil
    //MARK: -Life Cylce
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }

    //MARK: -IBAction
    
    @IBAction func numberButtonCliecked(_ sender: UIButton) {
        if runNumber.count < 7 {
            runNumber += "\(sender.tag)"
            outputLabel.text = runNumber
        }
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        runNumber = ""
        leftData = ""
        rightData = ""
        result = ""
        currentOperation = .Nil
        outputLabel.text = "0"
    }
    
    @IBAction func equalButtonClicked(_ sender: UIButton) {
        operayion(operation: currentOperation)
    }
    @IBAction func sumButtonClicked(_ sender: UIButton) {
        operayion(operation: .Sum)
    }
    @IBAction func subtractButtonClicked(_ sender: UIButton) {
        operayion(operation: .Subtract)
    }
    @IBAction func multipButtonClicked(_ sender: UIButton) {
        operayion(operation: .Multipliy)
    }
    @IBAction func divisionButtonClicled(_ sender: UIButton) {
        operayion(operation: .Divide)
    }
    
    
    //MARK: -Functions

    func operayion(operation: Operation){
        if currentOperation != .Nil{
            if runNumber != ""{
                rightData = runNumber
                runNumber = ""
                if currentOperation == .Sum{
                    result = "\(Double(leftData)! + Double(rightData)!)"
                }
                else if currentOperation == .Subtract{
                    result = "\(Double(leftData)! - Double(rightData)!)"
                }
                else if currentOperation == .Divide {
                    result = "\(Double(leftData)! / Double(rightData)!)"
                }
                else if currentOperation == .Multipliy {
                    result = "\(Double(leftData)! * Double(rightData)!)"
                }
                leftData = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0 ) {
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
        }else{
            leftData = runNumber
            runNumber = ""
            currentOperation = operation
        }
    }
    
}

