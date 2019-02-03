import UIKit

class MonthlyViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let val = Double(textField.text!) else { return }
        monthlyIncome = val
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
