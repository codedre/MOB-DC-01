// Playground - noun: a place where people can play

import UIKit


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


FibonacciAdder().fibonacciNumberAtIndex(10)

var time = FibonacciAdder()

time.fibonacciNumberAtIndex(10)