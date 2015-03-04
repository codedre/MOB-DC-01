// Playground - noun: a place where people can play

import UIKit
import XCPlayground

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()


let url = NSURL(string: "http://tedi.io")

let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
    println(data)
    println(response)
    println(error)
})

// The above is an example of a closure which is a function that passess a function as a parameter. Allows for things to work asychronously

task.resume() // must be there for task to run task