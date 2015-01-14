// Playground - noun: a place where people can play

import UIKit
// Defining a class requires we name the class with a capital letter
class Animal {
    var numberOfLegs: Int
    var hasFur = false
    var noise = "AAAAAAH"
    init(legs: Int, hasFur: Bool){
        self.numberOfLegs = legs
        self.hasFur = hasFur
//        .self is the external variable
    }
    func speak() {
        println(self.noise)
    }
}

//Instatiating a class
var andre = Animal(legs:2, hasFur: true)
//object is an instance
andre.hasFur = false
andre.speak()
println(andre.numberOfLegs)

var ena = Animal(legs: 4, hasFur: false)

// To acess properties in classes, the way we access the property is self.property