//
//  ViewController.swift
//  SplitBills
//
//  Created by Sezer İltekin on 2.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var billTotalTextField:  UITextField!
    @IBOutlet weak var splitLabel:          UILabel!
    @IBOutlet var tipButtons:               [UIButton]!
    
    var bill = Bill()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            if let resultVC = segue.destination as? ResultViewController {
                let total = billTotalTextField.text?.commaToDot() ?? "0"
                bill.billTotal = Float(total)
                resultVC.totalPerPerson = bill.calculate()
                resultVC.summary = bill.createSummary()
            }
        }
    }
    
    func configure() {
        bill.splitOption = 2
        bill.tipPercent = 10
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func clearBackgroundOfTipButtons() {
        tipButtons.forEach { button in
            button.backgroundColor = .clear
            button.setTitleColor(.systemGreen, for: .normal)
        }
    }
    
    @IBAction func tipButtonTapped(_ sender: UIButton) {
        
        clearBackgroundOfTipButtons()
        
        sender.backgroundColor = .systemGreen
        sender.setTitleColor(.white, for: .normal)
        
        let percent = sender.titleLabel?.text
        if let percent {
            bill.setTipPercent(str: percent)
        }
    }
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        bill.splitOption    = Float(sender.value)
        splitLabel.text     = String(Int(sender.value))
    }

}
