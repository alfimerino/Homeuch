import UIKit

class MonthlyDebtViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let val = Double(textField.text!) else { return }
        monthlyDebt = val
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
