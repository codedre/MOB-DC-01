// Playground - noun: a place where people can play

import UIKit


class Animal {
    var name: String = ""
    var legs: Int
    init(legs:Int, name:String){
        self.legs = legs
        self.name = name
    }
    
    func speak(){
        println("AHHHH")
    }
}


//This is creating a new class inheriting from a superclass
class Dog: Animal {
    
    
    
    var isSmart = true
    override func speak() {
        println("Woof!")
    }
    
}



var doggie = Dog(legs:5,name:"Tom")
doggie.legs
doggie.speak()
doggie.isSmart
doggie.isSmart = false

//func printAnimalName(animal: Animal){
//    println("Animal's name is \(animal.name)")
//    
//}
//
//
//var doggie = Animal()
//doggie.name = "bob"
//
//printAnimalName(doggie)


var view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.backgroundColor = UIColor.purpleColor()





