//
//  dashboardViewController.swift
//  hangman
//
//  Created by Andre Shonubi on 2/13/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import UIKit



class dashboardViewController: UIViewController,Guess{
    let wordBank = ["fanatic", "hippopotamus", "diamond", "love", "burger"]
    var wordBankIndex = 0
    var play = GameRules()
    var hangmanFrame = UIView()
    
    

    @IBOutlet weak var endGameLabel: UILabel!
    @IBOutlet weak var wordResultLabel: UILabel!
    @IBOutlet weak var remainingGuessLabel: UILabel!
    @IBAction func returnToFirstVCButton(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("firstVC") as ViewController
        vc.delegate = self
        //if notification is end game
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    func passGuess(enteredGuess: String) {
        self.wordResultLabel.text = self.play.checkGuessesWithAnswer(enteredGuess)
        wrongGuess(enteredGuess)
        if self.wordResultLabel.text == self.play.myWord {
            NSNotificationCenter.defaultCenter().postNotificationName("gameOverWin", object: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        //create frame for hangman body to be contains
        self.hangmanFrame = UIView(frame: CGRect(x: 0,
            y: 30,
            width: self.view.frame.width,
            height: 310))
        self.hangmanFrame.backgroundColor = UIColor.purpleColor()
        self.hangmanFrame.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleRightMargin
        self.view.addSubview(self.hangmanFrame)
        
        //Listen for the game to end
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "endGame:", name: "gameOverLose", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "endGameWin", name: "gameOverWin", object: nil)

    }
    
    func initView() {
        self.play.myWord = wordBank[wordBankIndex]
        self.wordResultLabel.text = self.play.checkGuessesWithAnswer("")
        self.remainingGuessLabel.text = "7"
    }
    
    func wrongGuess (wrongGuess: String) {
        var index = 7 - self.play.wrongGuesses.count
        self.remainingGuessLabel.text = "\(index)"
        builder(index)
        
        if index == 0 {
            NSNotificationCenter.defaultCenter().postNotificationName("gameOverLose", object: nil)
        }
        
    }
    
    func endGameWin(notification: NSNotification){
        self.endGameLabel.text = "Congrats you got it right!"
        self.wordBankIndex += 1
    }
    
    func endGame(notification: NSNotification){
        self.endGameLabel.text = "Sorry you did not guess right. Play Again?"
        self.wordResultLabel.text = self.play.myWord
        self.wordBankIndex += 1
    }
    
    func builder(index:Int){
        switch index {
        case 0:
            lLeg()
        case 1:
            rLeg()
        case 2:
            lArm()
        case 3:
            rArm()
        case 4:
            body()
        case 5:
            neck()
        case 6:
            head()
        default:
            break
        }
    }
    
//    Views to be drawn for hangman body
    func head(){
        var head = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 50, width: 30, height: 20))
        head.frame.origin.x -= 15
        head.backgroundColor = UIColor.blueColor()
        self.hangmanFrame.addSubview(head)
    }
    
    func neck(){
        var neck = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 70, width: 15, height: 8))
        neck.frame.origin.x -= 7.5
        neck.backgroundColor = UIColor.grayColor()
        self.hangmanFrame.addSubview(neck)
    }
    
    func body() {
        var body = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 78, width: 50, height: 55))
        body.frame.origin.x -= 25
        body.backgroundColor = UIColor.yellowColor()
        self.hangmanFrame.addSubview(body)
    }
    
    func rArm(){
        var rightArm = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 78, width: 15, height: 35))
        rightArm.frame.origin.x += 25
        rightArm.backgroundColor = UIColor.blackColor()
        self.hangmanFrame.addSubview(rightArm)
    }
    
    func lArm(){
        var leftArm = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 78, width: 15, height: 35))
        leftArm.frame.origin.x -= 40
        leftArm.backgroundColor = UIColor.blackColor()
        self.hangmanFrame.addSubview(leftArm)
        
    }
    
    func rLeg(){
        var rightLeg = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 133, width: 20, height: 35))
        rightLeg.frame.origin.x += 5
        rightLeg.backgroundColor = UIColor.greenColor()
        self.hangmanFrame.addSubview(rightLeg)
    }
    
    func lLeg(){
        var leftLeg = UIView(frame: CGRect(x: self.hangmanFrame.frame.width/2, y: 133, width: 20, height: 35))
        leftLeg.frame.origin.x -= 25
        leftLeg.backgroundColor = UIColor.greenColor()
        self.hangmanFrame.addSubview(leftLeg)
    }
    
}
