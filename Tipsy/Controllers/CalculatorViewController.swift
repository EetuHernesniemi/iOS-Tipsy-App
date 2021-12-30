import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount : Float = 0
    var splitValue : Float = 2.0
    var percentageDescription : String = "0%"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = sender == zeroPctButton ? true : false
        tenPctButton.isSelected = sender == tenPctButton ? true : false
        twentyPctButton.isSelected = sender == twentyPctButton ? true : false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        let value = Int(sender.value).description
        splitNumberLabel.text = value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        if billTextField.text != nil {
            let billValue : Float = Float(billTextField.text?.description ?? "0.0") ?? 0.0
            splitValue = Float(splitNumberLabel.text?.description ?? "2") ?? 2
            if zeroPctButton.isSelected {
                tipAmount = (billValue*0)/splitValue
                percentageDescription = "0%"
            }
            if tenPctButton.isSelected {
                tipAmount = (billValue*0.1)/splitValue
                percentageDescription = "10%"
            }
            if twentyPctButton.isSelected {
                tipAmount = (billValue*0.2)/splitValue
                percentageDescription = "20%"
            }
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        if seque.identifier == "goToResult" {
            let destinationVC = seque.destination as! ResultsViewController
            destinationVC.totalPerPerson = String(format: "%.2f", tipAmount)
            destinationVC.settingsDescription = "Split between \(Int(splitValue).description) people with \(percentageDescription) tip."
        }
    }
}

