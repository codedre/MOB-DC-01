//
//  CardGame.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation
protocol BlackJack {
    // Require a deal method
    func deal(Bool) -> Int
    // Require a first hand method
    func firstHand()
}

class CardGame: BlackJack {
    
    // create new player and cpu objects and set their player type
    var newPlayer = Player(playerType: true)
    var cpu = Player(playerType: false)
    
    
    // Generates a random number between 1-21 for both player and cpu
    func deal (playerType: Bool) -> Int{
        
        var player = playerType
        var num: Int = 0
        
        if player == true {
            num = Int(arc4random_uniform(11) + 1)
            println(num)
            return num
        } else {
            num = Int(arc4random_uniform(11) + 11)
            if num == 11 {
                num += 1
                println(num)
                return num
            }else {
                println(num)
                return num
            }
            
        }
    }
    
    //Generates two random numbers for the player and one for cpu
    func firstHand() {
        
        for var i = 0; i < 2; ++i {
            self.newPlayer.score += deal(newPlayer.playerType)
        }
        
        self.cpu.score = deal(cpu.playerType)
    }
    
}
