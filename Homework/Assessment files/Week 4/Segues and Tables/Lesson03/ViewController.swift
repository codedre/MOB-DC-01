import UIKit

class ViewController: UIViewController {
    
    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    TODO two: Add an imageview to the modal dialog presented in TODO two.
    TODO three: Add and hook up a ‘dismiss’ button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */
    
    
    @IBOutlet weak var swipeToOpenModal: UIView!
    
    func initiateSwipeYellowBox(){
        
        // making a new instance of UIapGesture
        let swipeToViewModal = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        
        swipeToViewModal.direction = UISwipeGestureRecognizerDirection.Right
        //assign tap gesture on box
        self.swipeToOpenModal.addGestureRecognizer(swipeToViewModal)
    }
    
    func swipeRight(sender: UISwipeGestureRecognizer){
        //change to another view controller modally
        var secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as secondViewController
        //as is a form a typecasting
        
        //call the view controller, yes always animate, can put extra animation
        self.presentViewController(secondVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSwipeYellowBox()
        // Dispose of any resources that can be recreated.
    }
    

}

