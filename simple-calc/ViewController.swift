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
    
    var result = Float()
    var currentNumber = Float()
    var numbers = [Double]()
    var total = Double()
    var findAvg = true
    
    
    var currentOperation = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentOperation = "="
        lblResult.text = ("\(result)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNumberInput(sender: UIButton) {
        currentNumber = currentNumber * 10 + Float(Double(sender.titleLabel!.text!)!)
        lblResult.text = ("\(currentNumber)")
    }

    @IBAction func btnClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOperation = "="
        lblResult.text = ("\(result)")
        numbers = [Double]()
        total = 0
    }
    
    @IBAction func btnOperation(sender: UIButton) {
        numbers.append(Double(currentNumber))
        print(numbers)
    
        switch (currentOperation, findAvg) {
            case ("=", true):
                for index in 0 ..< numbers.count {
                    let num = Double.init(numbers[index])
                    total = total + num
                }
            result = Float(total) / Float(Double(numbers.count))
            case ("=", false):
                result = currentNumber
            case ("/", false):
                result = result / currentNumber
            case ("*", false):
                result = result * currentNumber
            case ("-", false):
                result = result - currentNumber
            case ("+", false):
                result = result + currentNumber
            case ("%", false):
                result = result % currentNumber
            case ("Count", false):
                print(numbers)
                total = Double(numbers.count)
                result = Float(total)
            case ("Avg", false || true):
                findAvg = true
            default:
                print("error")
        }
        currentNumber = 0
        lblResult.text = ("\(result)")
        
        if(sender.titleLabel!.text == "=") {
            result = 0
        }
        
        currentOperation = sender.titleLabel!.text! as String!
    }
}



