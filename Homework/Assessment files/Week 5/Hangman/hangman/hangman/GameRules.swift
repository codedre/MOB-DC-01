//
//  GameRules.swift
//  hangman
//
//  Created by Andre Shonubi on 2/13/15.
//  Copyright (c) 2015 Andre Shonubi. All rights reserved.
//

import Foundation

class GameRules {
    var correctGuesses: [String] = [] //Store correct guesses
    var wrongGuesses: [String] = [] //Store wrong guesses
//    let wordBank = ["fanatic", "evicted", "diamond", "airdrop", "loyalty"] //array containing words for the game
    var myWord = ""
    
//    func generateWord() {
//        var num: Int = 0
//        num = Int(arc4random_uniform(4))
//        self.myWord = wordBank[num]
//    }
    
    func checkGuessesWithAnswer (guess: String) -> String {
        
        var incompleteWord = ""
        if guess == "" {} else {
            if myWord.lowercaseString.rangeOfString(guess) != nil {
                correctGuesses.append(guess)
            }else { //checks to see if letter is already in the array
                if contains(wrongGuesses, guess){}else {
                    wrongGuesses.append(guess)
                }
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