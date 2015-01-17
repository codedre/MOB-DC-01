//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Andre Shonubi on 1/17/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation


class FibonacciAdder {
    func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int) -> Int {
        var  fibNum = indexOfFibonacciNumber, current = 0, next = 1, result = 0
        
        for index in 0...fibNum {
            let tempVar = current
            current = next
            next = tempVar + current
            result = tempVar
            
        }
        return result
    }
}