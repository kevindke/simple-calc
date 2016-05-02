//
//  ViewTwoController.swift
//  simple-calc
//
//  Created by Kevin Ke on 4/26/16.
//  Copyright © 2016 Kevin Ke. All rights reserved.
//

import Foundation

import UIKit

class ViewTwoController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    var viewHistory = [String]()
    var history = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0..<viewHistory.count {
            history += (viewHistory[i] + "\n")
        }
        print(history)
        Label.text = history
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}