//
//  ViewController.swift
//  SplitBills
//
//  Created by Sezer İltekin on 2.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet var tipButtons: [UIButton]!
    
    var bill = Bill()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bill.splitOption = 2
        bill.tipPercent = 10
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
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
    
    @IBAction func tipButtonTapped(_ sender: UIButton) {
        
        clearBackgroundOfTipButtons()
        
        sender.backgroundColor = .systemGreen
        sender.setTitleColor(.white, for: .normal)
        
        let percent = sender.titleLabel?.text
        if let percent {
            bill.setTipPercent(str: percent)
        }
    }
    
    func clearBackgroundOfTipButtons() {
        tipButtons.forEach { button in
            button.backgroundColor = .clear
            button.setTitleColor(.systemGreen, for: .normal)
        }
    }
    
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        bill.splitOption = Float(sender.value)
        splitLabel.text = String(Int(sender.value))
    }

}

extension String {
    func commaToDot() -> String {
        return self.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
    }
}
