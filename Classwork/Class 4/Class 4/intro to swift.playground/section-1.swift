// Playground - noun: a place where people can play

import UIKit

// Strings - Strings are usually presented in double quotes
"This is a string. 7 is my favorite number."

// Intergers are whole numbers
5
4
4
3
6


// Doubles (64 bit) and floats (32 bit). Swift makes decimals dounle by default
54.76

// Boolean
true
false


// Arrays : to be covered later 

// Dictionaries: to be covered later

// Variable: inferred
var myVariable = "Hello World"
println(myVariable)

// Variable: explicite
var mySecondVariable: String = "Hello world again"

var x = 10

var y = 4

 x + y
 x * y
// Not getting remainder because inferred type of variables is an integer
 x / y
 x - y
 x % y
 10 % 10
 y = 20
 
println(y)

x / y


// Constants
let myName = "Andre"
// myName = "John" Will error out beacouse constants are immutable


var amIHere: String? = "Tom"
println(amIHere)

/**************** Control Flow ************************/
// Conditional

var myAge = 30
if myAge < 21 {
    println("5 is 5")
    println("Another line of code")
}else if myAge == 21 {
    println("Free drinks")
}else if myAge > 21 && myAge < 25{
    println("You can drink. but you can't rent a car")
}else {
    println("you can party")
}

// Conditional statements run when statement is true

if true {
    println("YEP!")
}

// == equal to
// <= less than or equal to
// >= larger than or equal to 
// != not equal to

// Loops
// for initialization; condition; increment
for var i = 0; i < 5; i++ {
    println("Code is running \(i)")
}

//range ...
//for in another way to increment
for index in 1...5 {
    println(index)
}

//while loop
var k = 1
while k < 10 {
    println("counting")
    ++k
}

println(k)





