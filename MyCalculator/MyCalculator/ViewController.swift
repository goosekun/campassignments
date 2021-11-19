//
//  ViewController.swift
//  MyCalculator
//
//  Created by Field Employee on 11/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computator: UILabel!
    
    //operator flags
    var addFlag = false
    var subtractFlag = false
    var multiplyFlag = false
    var divideFlag = false
    var percentFlag = false
    
    //screenflag
    var screenFlag = true
    
    var total = 0
    var doubleTotal = 0.0
    var tempTotal = 0.0
    
    var tempFlag = true
    
    var signFlag = true
    
    var percentage = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func emptyScreen() {
        computator.text = ""
    }
    
    @IBAction func resetButton(_ sender: Any) {
        computator.text = "0"
        total = 0
        doubleTotal = 0.0
        screenFlag = true
        tempFlag = true
    }
    @IBAction func zero(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "0"
    }
    
    @IBAction func one(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "1"
        
    }
    
    @IBAction func two(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "2"
    }
    
    @IBAction func three(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "3"
    }
    
    @IBAction func four(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "4"
    }
    
    @IBAction func five(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "5"
    }
    
    @IBAction func six(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "6"
    }
    
    @IBAction func seven(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "7"
    }
    
    @IBAction func eight(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "8"
    }
    
    @IBAction func nine(_ sender: Any) {
        if screenFlag {
            emptyScreen()
            screenFlag = false
        }
        computator.text! += "9"
    }
    
    @IBAction func divide(_ sender: Any) {
        if tempFlag {
            let myOperand = computator.text
            if myOperand == "0" {
                computator.text = "ERR"
                return
            }
            doubleTotal = 1
            doubleTotal /= Double(myOperand!) ?? 0.0
            emptyScreen()
            tempFlag = false
        }
        emptyScreen()
        divideFlag = true
    }
    
    @IBAction func multiply(_ sender: Any) {
        if tempFlag {
            let myOperand = computator.text
            doubleTotal = 1
            doubleTotal *= Double(myOperand!) ?? 0.0
            emptyScreen()
            tempFlag = false
        }
        emptyScreen()
        multiplyFlag = true
    }
    
    @IBAction func subtract(_ sender: Any) {
        if tempFlag {
            let myOperand = computator.text
            
            doubleTotal += Double(myOperand!) ?? 0.0
            emptyScreen()
            tempFlag = false
        }
        emptyScreen()
        subtractFlag = true
    }
    
    @IBAction func add(_ sender: Any) {
        if tempFlag {
            let myOperand = computator.text
            total += Int(myOperand!) ?? 0
            doubleTotal += Double(myOperand!) ?? 0.0
            emptyScreen()
            tempFlag = false
        }
        emptyScreen()
        addFlag = true
        
    }
    
    @IBAction func computeEqual(_ sender: Any) {
        if addFlag {
            let operand = computator.text
            if (operand?.contains(".") != nil) {
                doubleTotal += Double(operand!) ?? 0.0
                computator.text = String(doubleTotal)
            } else {
                total += Int(computator.text!) ?? 0
                computator.text = String(total)
            }
            addFlag = false
        }
        else if subtractFlag {
            let operand = computator.text
            if (operand?.contains(".") != nil) {
                doubleTotal -= Double(operand!) ?? 0.0
                computator.text = String(doubleTotal)
            } else {
                total -= Int(computator.text!) ?? 0
                computator.text = String(total)
            }
            subtractFlag = false
        }
        else if multiplyFlag {
            let operand = computator.text
            if (operand?.contains(".") != nil) {
                doubleTotal *= Double(operand!) ?? 0.0
                computator.text = String(doubleTotal)
            } else {
                total *= Int(computator.text!) ?? 0
                computator.text = String(total)
            }
            multiplyFlag = false
        }
        else if divideFlag {
            let operand = computator.text
            if operand == "0" {
                computator.text = "ERR"
                screenFlag = true
                return
            }
            if (operand?.contains(".") != nil) {
                doubleTotal /= Double(operand!) ?? 0.0
                computator.text = String(doubleTotal)
            } else {
                total /= Int(computator.text!) ?? 0
                computator.text = String(total)
            }
            divideFlag = false
        }
        else if percentFlag {
            let operand = Double(computator.text!)
            doubleTotal = percentage * operand!
            computator.text = String(doubleTotal)
            percentFlag = false
        }
        screenFlag = true
    }
    
    @IBAction func decimal(_ sender: Any) {
        computator.text! += "."
    }
    
    @IBAction func setSign(_ sender: Any) {
        var operand = computator.text!
        if signFlag {
            computator.text = "-" + operand
            signFlag = false
        } else {
            computator.text = ""
            operand.remove(at: operand.startIndex)
            computator.text = operand
            signFlag = true
        }
    }
    
    @IBAction func percentage(_ sender: Any) {
        let operand = Double(computator.text!)
        percentage = operand! * 0.01 //0.08
        emptyScreen()
        percentFlag = true
    }
}

