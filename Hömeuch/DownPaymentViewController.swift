import UIKit

class DownPaymentViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let val = Double(textField.text!) else { return }
        downPayment = val
    }
    
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
