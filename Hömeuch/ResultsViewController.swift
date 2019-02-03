import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let val = Double(textField.text!) else { return }
        result = val
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
