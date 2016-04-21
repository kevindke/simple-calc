//
//  ViewController.swift
//  simple-calc
//
//  Created by Kevin Ke on 4/21/16.
//  Copyright © 2016 Kevin Ke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UITextField!
    
    var result = Double()
    var currentNumber = Double()
    var numbers = [Double]()
    var total = Double()
    var findAvg = false
    var findFact = false
    
    
    var currentOperation = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentOperation = "="
        lblResult.text = ("\(result)")
        total = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNumberInput(sender: UIButton) {
        currentNumber = currentNumber * 10 + Double(sender.titleLabel!.text!)!
        lblResult.text = ("\(currentNumber)")
    }

    @IBAction func btnClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOperation = "="
        lblResult.text = ("\(result)")
        numbers = [Double]()
        total = 0
        findAvg = false
        findFact = false
    }
    
    @IBAction func btnOperation(sender: UIButton) {
        numbers.append(Double(currentNumber))
        print(numbers)
        
        if sender.titleLabel!.text! == "Fact" {
            findFact = true
        }
    
        switch currentOperation {
            case "=":
                result = currentNumber
            case "/":
                result = result / currentNumber
            case "*":
                result = result * currentNumber
            case "-":
                result = result - currentNumber
            case "+":
                result = result + currentNumber
            case "%":
                result = result % currentNumber
            case "Count":
                print(numbers)
                total = Double(numbers.count)
                result = total
            case "Avg":
                findAvg = true
            case "Fact":
                findFact = true
            default:
                print("error")
        }
        
        if findAvg == true {
            total = 0
            for index in 0 ..< numbers.count {
                let num = numbers[index]
                total = total + num
            }
            result = total / Double(numbers.count)
        } else if findFact == true {
            var factorialIndex = currentNumber
            print(factorialIndex)
            total = factorialIndex * (factorialIndex - 1)
            factorialIndex = factorialIndex - 2
            while factorialIndex > 0 {
                total = total * factorialIndex
                factorialIndex = factorialIndex - 1
            }
            result = total
        }
        
        currentNumber = 0
        lblResult.text = ("\(result)")
        
        if(sender.titleLabel!.text == "=") {
            result = 0
        }
        
        currentOperation = sender.titleLabel!.text! as String!
    }
}



