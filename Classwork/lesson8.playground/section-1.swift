// Playground - noun: a place where people can play

import UIKit

//Protocals
// requirements in protocalls need to be define in the instances that are inhairiting it
// pass informatin between classes also good for getting requirments for tableViews
// very general


protocol Flight {
    var wings: Bool { get set }
    var beakSize: Int { get set }
    
}

protocol Talk {
    func speak() -> String
}


class Penguin: Flight {
    var wings = true
    var beakSize = 6
}



class Human: Animal, Talk {
    func speak() -> String {
        return "Hello World"
    }
}







class Animal {
    var legs: Int = 4
    var fur: Bool = false
    var hasClaws: Bool
    
    init(hasClaws: Bool, legs: Int) {
        self.hasClaws = hasClaws
        self.legs = legs
        println("Hello There")
    }
    
    func speak() {
        println("Hello World")
    }

}


class Dog: Animal {
    
    override var fur: Bool {
        get {
            //returns whatever the fur variable is set as
            return true
        }
        set{
            //override the inherited property to the new value set by the sub  class
            super.fur = newValue
        }
    }
    
    override func speak() {
        super.speak()
        println("Woof woof")
    
    }
}



var andre = Animal(hasClaws: true, legs: 4)
var tom = Dog(hasClaws: false, legs: 6)

tom.speak()

var skippy = tom
tom.legs
skippy.legs = 5

tom.legs

//best practice is to initialize defualts for properties in super class
//super can be used on any method and property





//Structs
//classes are referenc types and strucks are value type
//structs dont have inheritance
//they do not have initializers have to type in each propterty when creating instance
// struct initializes poperties
//great for shapes, coordinates


func doesAnimalHaveClaws(animal: Animal) -> Bool {
    return animal.hasClaws

}

let bob = Animal(hasClaws: false, legs: 4)

doesAnimalHaveClaws(bob)
doesAnimalHaveClaws(tom)

struct Rectangle {
    var width: Int
    var height: Int
    
    func getArea() -> Int{
        return width * height
    }
}


let myRectangle = Rectangle(width: 50, height: 100)

var otherRect = myRectangle
otherRect.width = 70
myRectangle.width

myRectangle.getArea()

















































