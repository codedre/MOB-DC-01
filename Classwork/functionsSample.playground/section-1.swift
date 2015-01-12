// Playground - noun: a place where people can play

import UIKit

func hello() {
    println("Hello world")
}


hello()

func sum(firstNum: Int, secondNum: Int) -> Int {
    let newSum = firstNum + secondNum
    hello()
    return newSum
}

var x = sum(10, 20)
var y = sum(x, 15)

func fib(place: Int) -> Int {
    var fibNum = place, current = 0, next = 1, result = 0
    
    for index in 0..<fibNum {
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

var q = 8

//fib()
fib(10)
//check optional
var num: Int? = 5
if let numValue = num {
    println(numValue + 5)
}

//twople
func save(name: String) -> (first: String, last: String) {
//    var firstName = name
    var lastName = "Shonubi"
    return (name, lastName)
}


var myName = save("Andre")
myName.first
myName.last

























