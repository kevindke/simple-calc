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
    var history = String()
    var historyArray = [String]()
    
    
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
        history = history + String(currentNumber)
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
        history = ""
    }
    
    @IBAction func btnOperation(sender: UIButton) {
        numbers.append(Double(currentNumber))
        print(numbers)
        
        
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
        
        if sender.titleLabel!.text! == "Fact" {
            findFact = true
            history = history + "fact"
        } else if sender.titleLabel!.text! == "Avg" {
            history = history + "avg"
        } else if sender.titleLabel!.text! == "Count" {
            history = history + "count"
        } else if sender.titleLabel!.text! == "/" {
            history = history + "/"
        } else if sender.titleLabel!.text! == "*" {
            history = history + "*"
        } else if sender.titleLabel!.text! == "-" {
            history = history + "-"
        } else if sender.titleLabel!.text! == "+" {
            history = history + "+"
        } else if sender.titleLabel!.text! == "%" {
            history = history + "%"
        } else if sender.titleLabel!.text! == "=" {
            history = history + "=" + String(result)
            historyArray.append(history)
            history = ""
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

        print(historyArray)
        
        if(sender.titleLabel!.text == "=") {
            result = 0
        }
        
        currentOperation = sender.titleLabel!.text! as String!
    }
    
    
    @IBAction func showHistory(sender: UIButton) {
        for i in 0..<historyArray.count {
            history += (historyArray[i] + "\n")
        }
        print("this is the showHistory history")
        print(history)
        print("end")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showHistory") {
            
            let destViewController : ViewTwoController = segue.destinationViewController as! ViewTwoController;
            print("hi, im here")
            print(history)
            destViewController.viewHistory = history
        }
    }
}



