//// Playground - noun: a place where people can play
//
import UIKit
////var myWord = "apple"
////var correctGuesses: [String] = []
////func checkGuessesWithAnswer (guess: String) -> String {
////    
////    var incompleteWord = ""
////    
////    if myWord.lowercaseString.rangeOfString(guess) != nil {
////        correctGuesses.append(guess)
////    }
////    
////    for letter in myWord {
////        if contains(correctGuesses, String(letter).lowercaseString) {
////            incompleteWord += String(letter)
////            incompleteWord += " "
////        }else {
////            incompleteWord += "_ "
////        }
////    }
////    correctGuesses
////    return incompleteWord
////}
////
////checkGuessesWithAnswer("p")
////checkGuessesWithAnswer("a")
////checkGuessesWithAnswer("t")
////checkGuessesWithAnswer("e")
////checkGuessesWithAnswer("l")
//
//
class GameRules {
    var correctGuesses: [String] = []
    var wrongGuesses: [String] = []
    let wordBank = ["fanatic", "hippopotamus", "diamond", "love", "burger"]
    var myWord = ""
    
    func generateWord() {
        var num: Int = 0
        num = Int(arc4random_uniform(4))
        self.myWord = wordBank[0]
    }
    
    func checkGuessesWithAnswer (guess: String) -> String {
        
        var incompleteWord = ""
        
        if myWord.lowercaseString.rangeOfString(guess) != nil {
            correctGuesses.append(guess)
        }else {
            if contains(wrongGuesses, guess){}else {
                wrongGuesses.append(guess)
            }
        }
        
        for letter in myWord {
            if contains(correctGuesses, String(letter).lowercaseString) {
                incompleteWord += String(letter)
                incompleteWord += " "
            }else {
                incompleteWord += "_ "
            }
        }
        return incompleteWord
    }
    
}

var test = GameRules()
test.generateWord()
test.myWord
test.checkGuessesWithAnswer("t")
test.checkGuessesWithAnswer("d")
test.checkGuessesWithAnswer("a")
test.checkGuessesWithAnswer("r")
test.checkGuessesWithAnswer("w")
test.checkGuessesWithAnswer("z")
test.checkGuessesWithAnswer("z")


var number = "7"

number = "\(7 - test.wrongGuesses.count)"
test.wrongGuesses


//
//


//var myWord = "r"
//var num = ["1", "2", "3", "4"]
//for number in myWord {
//    if contains(num, String(number)) {
//        println(String(number))
//    }else {
//        println("nope")
//    }
//}




















