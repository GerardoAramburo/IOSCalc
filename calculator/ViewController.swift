//
//  ViewController.swift
//  calculator
//
//  Created by Gerardo on 15/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberSelected(_ sender: UIButton) {
        if displayLabel.text!.starts(with: "0") {
            displayLabel.text!.remove(at: displayLabel.text!.startIndex)
        }
        displayLabel.text! += sender.title(for: UIControl.State.normal)!
    }
    @IBAction func clearDisplay (_ sender: UIButton) {
        displayLabel.text = "0"
    }
    @IBAction func calculate(_ sender: UIButton) {
        
        let expression = parseInput(displayLabel.text!);
        let result = NSExpression(format: expression).expressionValue(with: nil, context: nil) as! Double
        displayLabel.text = String(result)
    }
    @IBAction func operationSelected (_ sender: UIButton) {
        displayLabel.text! += sender.title(for: UIControl.State.normal)!
    }
    
    func parseInput(_ input: String) -> String {
        var parseInput = input
        
        parseInput = parseInput.replacingOccurrences(of: "x", with: "*")
        parseInput = parseInput.replacingOccurrences(of: "÷", with: "/")
        return parseInput
    }
    
}

