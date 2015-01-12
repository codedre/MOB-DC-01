// Playground - noun: a place where people can play
// Lesson 05

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times

func hello()  {
    for t in 1...10 {
        println("Hello world!")
    }
}

hello()

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

func printLoop()  {
    for t in 1...20 {
        println("Hit this line \(t) times!")
    }
}

printLoop()

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

func firstName(fName: String)  {
    println("Hello \(fName)")
}

firstName("Andre")

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

func optionTest(fName: String?)  {
    if let numValue = fName {
        println("Hello \(fName)")
        
    } else{
        println("Hello world!")
    }
    
}

//optionTest()

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

func fib(n: Int) -> Int {
    var fibNum = n, current = 0, next = 1, result = 0
    
    for index in 0...fibNum {
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

fib(20)


// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

func printFib(){
    var sum: Int = 0
    for index in 1...20 {
       sum += fib(index)
    }
    println(sum)
}

printFib()

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

//func math(num: Int) -> String{
// 
//    var prime = 0
//    var result: String = ""
//    
//    for var index = 2; index <= num; ++index {
//        if (num % index == 0) || (prime < 1){
//            prime += 1
//        }
//    }
//    if (num <= 1){
//        result = ("\(num) is neither a prime or composite number.")
//    } else if (prime <= 2){
//        result = ("\(num) is a prime number.")
//    } else if (prime > 2){
//        result = ("\(num) is a composite number.")
//    }
//    return result
//}
//
//math(15)
//
//
//// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)
//
//func primeFib(){
//    var num: Int = 0, type = ""
//    for index in 1...20 {
//        type = math(fib(index))
//        println(type)
//    }
//    
//}
//
//primeFib()


// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

func check(bill: Float, tip: Float?) -> (total:Float, tip:Float?){
    var calc = bill
    if let numValue = tip {
        calc += (numValue * bill)
        
    }
    return (calc,tip)
}

var myTab = check(10,nil)
myTab.total
myTab.tip


// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

func funStrings(text: String) -> String {
    var inReverse = ""
    
    for letter in text {
        println(letter)
        inReverse = "\(letter)" + inReverse
    }
    
    return(inReverse)
}

var print = funStrings("Andre")
println("\(print)")

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

func advStrings(text:[String], search: String) -> Bool {

    for var i = 0; i < text.count; ++i {
        if (search == text[i]){
            return true
            break
        }
    }
    return false
}

advStrings(["red", "blue", "green", "yellow"], "red")


// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

func palindrome(text: String) -> Bool {
    var inReverse = ""
    
    for letter in text {
        println(letter)
        inReverse = "\(letter)" + inReverse
    }
    if (inReverse == text){
        return true
    }else{
        return false
    }
}

palindrome("eve")

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings are equal
func evenStrings(firstLine: String, secondLine: String) -> Bool {
    if (firstLine == secondLine){
        return true
    }else {
        return false
    }
}

evenStrings("This is my line", "This is my line")

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.


//func lastOne("The has run ", me(name:String){
func me(text: String) -> String {
    for index in 1...10 {
        println("\(index) times")
    }
    return ("\(index) times")
}
    
//}











