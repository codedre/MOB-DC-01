import UIKit

class ViewController: UIViewController {

    // Functions of use for this exercise:
    // Translating a string to an integer: "1".toInt()
    // Getting the text from a text field: let text = textFieldName.text
    // Setting the text on a text label or text field: textLabelName.text = "some text"
    
    /*
    TODO: Create a text field, a label and a button in the storyboard's View Controller. Drag a new outlet from the label and text field to this file, then drag the 'touch up inside' event on the button into this file. When the button is clicked, make the text of the label display 'hello {whatever the text in the text field is}. Call an instructor/TA when you're done with this task.
    */
//    @IBOutlet weak var textFieldName: UITextField!
//    @IBOutlet weak var textLabelName: UILabel!
//    @IBAction func myButtonAction(sender: AnyObject) {
//        textLabelName.text = "Hello " + textFieldName.text
//    }
    
    /*
    TODO: Paste the fibonacci number function that you previously created into this class. Change the text box to use a numeric keypad for input. When the button is pressed, make the label print out the nth number in the fibonacci sequence (where n is the value of the text in the text field). Call an instructor/TA when you're done with this task.
    */
    func fib(textInput: Int) -> Int {
        var fibNum = textInput, current = 0, next = 1, result = 0
        
        for index in 0...fibNum {
            //current val is 3
            //temp value becomes 3
            let tempVar = current
            //current value becomes next(5)
            current = next
            //next value becomes old current(temporoary) + new current(old next)
            next = tempVar + current
            result = tempVar
            
        }
        return result
    }
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textLabelName: UILabel!
    @IBAction func myButtonAction(sender: AnyObject) {
        var result = 0
       let num = textFieldName.text.toInt()!
        
        result = fib(num)
        textLabelName.text = "\(result)"
        
        
    }
    
    
    /*
    TODO: Drag a new text field into the view controller, and create an outlet for it here. Make both text fields use the numeric keypad. One text field represents an optional tip percentage (in integer form, e.g 20 = 20% tip), the other represents the total amount of a bill. When the button is pressed, make the label display both the total amount and tip amount (e.g. "total: $100, tip: $15"). Call an instructor/TA when you're done with this task.
    */

    @IBOutlet weak var secondTextField: UITextField!
//    @IBOutlet weak var textFieldName: UITextField!
//    @IBOutlet weak var textLabelName: UILabel!
//    @IBAction func myButtonAction(sender: AnyObject) {
//        
//        var bill = textFieldName.text.toInt()!
//        let tip = secondTextField.text.toInt()!
//        bill += tip
//        textLabelName.text = "Your bill is \(bill) and your tip is \(tip)"
//        
//        
//    }
//
//}

