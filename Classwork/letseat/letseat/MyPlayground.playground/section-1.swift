// Playground - noun: a place where people can play

import UIKit

var objects: [AnyObject] = ["adfadfadfad", "245245245"]

var sender: AnyObject?

sender = objects

if let passObj = sender as? NSArray {
    println(passObj[0])
}
