import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = sender == zeroPctButton ? true : false
        tenPctButton.isSelected = sender == tenPctButton ? true : false
        twentyPctButton.isSelected = sender == twentyPctButton ? true : false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != nil {
            let billValue : Float = Float(billTextField.text ?? "0.0") ?? 0.0
            print("billValue is \(billValue)")
            print("billTextField.text is \(billTextField.text)")
            
            if zeroPctButton.isSelected {
                print(billValue*0)
            }
            if tenPctButton.isSelected {
                print(billValue*0.1)
            }
            if twentyPctButton.isSelected {
                print(billValue*0.2)
            }
        }
        
    }
}

