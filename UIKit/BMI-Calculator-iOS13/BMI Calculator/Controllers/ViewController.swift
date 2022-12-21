//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Sezer İltekin on 21.12.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // MARK: - Model
    
    var bmi = Bmi(height: 1.25, weight: 100)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func heightChanged(_ sender: UISlider) {
        bmi.height = sender.value
        configureLabel(label: "height", value: bmi.height)
        vibrate(rareness: 5)
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        bmi.weight = sender.value
        configureLabel(label: "weight", value: bmi.weight)
        vibrate(rareness: 5)
    }
    
    // MARK: - Functions
    
    func configureLabel(label: String, value: Float) {
        if(label == "height") {
            // Formatting with 2 decimals with m prefix
            let formatted = String(format: "%.2fm", value)
            heightLabel.text = formatted
        } else if (label == "weight"){
            // Formatting like integer with Kg prefix
            let formatted = String(format: "%.0fKg", value)
            weightLabel.text = formatted
        }
    }
    
    func vibrate(rareness: Int) {
        let first = rareness - rareness
        let last = rareness + rareness
        if Int.random(in: first...last) == rareness {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
    
    func configureUI() {
        heightSlider.value = bmi.height
        weightSlider.value = bmi.weight
        configureLabel(label: "height", value: bmi.height)
        configureLabel(label: "weight", value: bmi.weight)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateSegue" {
            let targetVC = segue.destination as! ResultViewController
            let result = bmi.calculate()
            targetVC.result = result
            targetVC.resultDescription = bmi.resultText(result: result)
            vibrate(rareness: 0)
        }
    }
    
}

