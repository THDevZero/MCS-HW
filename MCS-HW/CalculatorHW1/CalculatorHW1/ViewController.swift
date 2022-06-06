//
//  ViewController.swift
//  CalculatorHW1
//
//  Created by Consultant on 6/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ResultsLabel: UILabel!
    var numDisplayed:Double = 0
    var previousNum:Double = 0
    var computing = false
    var operation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numPressed(_ sender: UIButton) {
        if computing == true {
            //previousNum = Double(title!)!
            ResultsLabel.text = sender.titleLabel?.text
            numDisplayed = Double(ResultsLabel.text!)!
            computing = false
            
            switch operation {
            case "+":
                numDisplayed = previousNum + numDisplayed
                ResultsLabel.text = String(numDisplayed)
            case "-":
                numDisplayed = previousNum - numDisplayed
                ResultsLabel.text = String(numDisplayed)
            case "x":
                numDisplayed = previousNum * numDisplayed
                ResultsLabel.text = String(numDisplayed)
            case "/":
                numDisplayed = previousNum / numDisplayed
                ResultsLabel.text = String(numDisplayed)
            default:
                break
            }
            
            previousNum = numDisplayed
            
        } else {
            if ResultsLabel.text == "0" {
                ResultsLabel.text = ""
            }
            ResultsLabel.text = ResultsLabel.text! + (sender.titleLabel?.text)!
            numDisplayed = Double(ResultsLabel.text!)!
            previousNum = numDisplayed
        }
    }
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        ResultsLabel.text = "0"
        numDisplayed = 0
        previousNum = 0
    }
    
    @IBAction func convertToPercent(_ sender: UIButton) {
        numDisplayed = numDisplayed * 0.01
        ResultsLabel.text = String(numDisplayed)
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        //previousNum = Double(title!)!
        computing = true
        switch title {
        case "+":
            operation = "+"
            ResultsLabel.text = "+"
        case "-":
            operation = "-"
            ResultsLabel.text = "-"
        case "x":
            operation = "x"
            ResultsLabel.text = "x"
        case "/":
            operation = "/"
            ResultsLabel.text = "/"
        default:
            ResultsLabel.text = "/"
        }
    }
}

