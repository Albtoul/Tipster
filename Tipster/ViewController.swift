//
//  ViewController.swift
//  Tipster
//
//  Created by Hell on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipAmountLabel:UILabel!
    @IBOutlet weak var totalAmountLabel:UILabel!
    
    @IBOutlet weak var tipFivePercentLabel: UILabel!
    @IBOutlet weak var tipFiveAmountLabel:UILabel!
    @IBOutlet weak var tipFiveTotalAmountLabel:UILabel!
    
    @IBOutlet weak var tipTenPercentLabel: UILabel!
    @IBOutlet weak var tipTenAmountLabel:UILabel!
    @IBOutlet weak var tipTenTotalAmountLabel:UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tipAmount = Int(slider.value.rounded())
        tipPercentLabel.text = "\(tipAmount)%"
        tipFivePercentLabel.text = "\(tipAmount + 5)%"
        tipTenPercentLabel.text = "\(tipAmount + 10)%"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tipSliderChanged(_ sender: UISlider) {
        let slider = Int(sender.value.rounded())
        tipPercentLabel.text = "\(slider)%"
        tipFivePercentLabel.text = "\(slider + 5)%"
        tipTenPercentLabel.text = "\(slider + 10)%"
        calculate()
    }
    
    @IBAction func buttonPressed(_ sender:UIButton){
        switch(sender.title(for: .normal)!){
        case "1" : amountLabel.text! += "1"
            break
        case "2" : amountLabel.text! += "2"
            break
        case "3" : amountLabel.text! += "3"
            break
        case "4" : amountLabel.text! += "4"
            break
        case "5" : amountLabel.text! += "5"
            break
        case "6" : amountLabel.text! += "6"
            break
        case "7" : amountLabel.text! += "7"
            break
        case "8" : amountLabel.text! += "8"
            break
        case "9" : amountLabel.text! += "9"
            break
        case "C" : amountLabel.text! = "0"
            break
        case "0" :
            if amountLabel.text == "0" {return}
            amountLabel.text! += "0"
            break
        case "." :
            if amountLabel.text!.contains("."){return}
            amountLabel.text! += "."
            break
        default:
            return
        }
        calculate()
    }
    
    func calculate(){
            let totalAmount = Float(amountLabel.text ?? "0")!
            let tip = Float((tipPercentLabel.text?.split(separator: "%")[0])!)! / 100
            let fiveTip = Float((tipFivePercentLabel.text?.split(separator: "%")[0])!)! / 100
            let tenTip = Float((tipTenPercentLabel.text?.split(separator: "%")[0])!)! / 100
        let groupNumber = groupSlider.value.rounded()
            
            tipAmountLabel.text = String(format: "%.2f", (totalAmount * tip / groupNumber))
            tipFiveAmountLabel.text = String(format: "%.2f", (totalAmount * fiveTip / groupNumber))
            tipTenAmountLabel.text = String(format: "%.2f", (totalAmount * tenTip / groupNumber))
            
            totalAmountLabel.text = String(format: "%.2f", (totalAmount * tip + totalAmount) / groupNumber)
            tipFiveTotalAmountLabel.text = String(format: "%.2f", (totalAmount * fiveTip + totalAmount) / groupNumber )
            tipTenTotalAmountLabel.text = String(format: "%.2f", (totalAmount * tenTip + totalAmount) / groupNumber )
            
        }
    @IBAction func groupSliderChanged(_ sender: UISlider) {
        groupLabel.text = "Group Size: \(Int(sender.value.rounded()))"
        calculate()
    }
    
}

