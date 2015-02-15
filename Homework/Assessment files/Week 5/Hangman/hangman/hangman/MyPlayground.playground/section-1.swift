// Playground - noun: a place where people can play

import UIKit
//var myWord = "apple"
//var correctGuesses: [String] = []
//func checkGuessesWithAnswer (guess: String) -> String {
//    
//    var incompleteWord = ""
//    
//    if myWord.lowercaseString.rangeOfString(guess) != nil {
//        correctGuesses.append(guess)
//    }
//    
//    for letter in myWord {
//        if contains(correctGuesses, String(letter).lowercaseString) {
//            incompleteWord += String(letter)
//            incompleteWord += " "
//        }else {
//            incompleteWord += "_ "
//        }
//    }
//    correctGuesses
//    return incompleteWord
//}
//
//checkGuessesWithAnswer("p")
//checkGuessesWithAnswer("a")
//checkGuessesWithAnswer("t")
//checkGuessesWithAnswer("e")
//checkGuessesWithAnswer("l")


class GameRules {
    var correctGuesses: [String] = []
    let wordBank = ["fanatic", "evicted", "diamond", "airdrop", "loyalty"]
    var myWord = ""
    
    func generateWord() {
        var num: Int = 0
        num = Int(arc4random_uniform(4))
        self.myWord = wordBank[num]
    }
    
    func checkGuessesWithAnswer (guess: String) -> String {
        
        var incompleteWord = ""
        
        if myWord.lowercaseString.rangeOfString(guess) != nil {
            correctGuesses.append(guess)
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



