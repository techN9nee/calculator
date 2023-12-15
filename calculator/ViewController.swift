import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UITextField!
    @IBOutlet weak var secondLabel: UITextField!
    @IBOutlet weak var result: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }

    @IBAction func plusButton(_ sender: Any) {
        calculateResult(operation: +)
    }

    @IBAction func decalButton(_ sender: Any) {
        calculateResult(operation: -)
    }

    @IBAction func multiplicationButton(_ sender: Any) {
        calculateResult(operation: *)
    }

    @IBAction func slashButton(_ sender: Any) {
        calculateResult(operation: /)
    }

    func calculateResult(operation: (Double, Double) -> Double) {
        view.endEditing(true)
        
        if let firstText = firstLabel.text, let secondText = secondLabel.text {
            if let firstNumber = Double(firstText), let secondNumber = Double(secondText) {
                let resultValue = operation(firstNumber, secondNumber)
                result.text = String(resultValue)
            } else {
                result.text = "Error"
            }
        }
    }

    @objc func viewTapped() {
        view.endEditing(true)
    }
}
