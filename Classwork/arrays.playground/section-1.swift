// Playground - noun: a place where people can play

import UIKit

//create an array 

var myArray = [1, 4, 10, 15, 20]

//explicite array - to create an empty array it has to be explicit when array is being defined

var secondArray: [Int] = []
// string Array
var stringArray: [String] = []

//access elements in an array
myArray[2]

myArray.first
myArray.last!

secondArray.append(20)
secondArray


// insert element in a specific element position
myArray.insert(100, atIndex: 2)

myArray.count

//myArray.insert(50, atIndex: myArray.count - 1)
myArray.isEmpty
stringArray.isEmpty
myArray.removeAtIndex(2)
myArray[1] = 40
//myArray.removeAtIndex(myArray.count - 1)
myArray


//looping through arrays

for i in myArray {
    if i == 100 {
        println("bingo")
    }else{
        println("the value is \(i)")
    }
}