//
//  ViewController.swift
//  OneBTC
//
//  Created by Sezer İltekin on 26.01.2023.
//

import UIKit

class MainViewController: UIViewController, BTCManagerDelegate {
    
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    
    var CM = CurrencyManager()
    var btcManager = BTCManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btcManager.delegate = self
        showUpdatingNotice(currency: "USD")
        triggerUpdatePrice()
        
        currencyPickerView.dataSource = self
        currencyPickerView.delegate = self
    }
    
    func updatePrice(price: Double) {
        DispatchQueue.main.async {
            self.priceLabel.font = self.priceLabel.font.withSize(40)
            
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .decimal
            
            self.priceLabel.text = currencyFormatter.string(from: Int(price) as NSNumber)
            self.currencyImage.image = self.CM.getImage()
        }
    }
    
    func triggerUpdatePrice() {
        btcManager.fetch(currency: CM.current ?? "USD")
    }
    
    func showUpdatingNotice(currency: String) {
        priceLabel.font = priceLabel.font.withSize(20)
        priceLabel.text = "Fetching \(currency) price..."
    }
    
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CM.currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CM.currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CM.setCurrent(index: row)
        showUpdatingNotice(currency: CM.current ?? "USD")
        triggerUpdatePrice()
    }
    
}

