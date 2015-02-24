// Playground - noun: a place where people can play

import UIKit

var wayneGretzgy = ["first_name": "Wayne", "last_name": "Gretzgy", "team": "Capitals"]

wayneGretzgy["first_name"]
if let wayneName = wayneGretzgy["first_name"] {
    println(wayneName)
}
//dictionary keys should be strings
//should not search by vaules in dictionary
//do not have order
var ena: [String: Int] = [:]

ena["legs"] = 4

ena["eyes"] = 2
ena["eyes"] = 3
//remove value from dict
ena.removeValueForKey("eyes")
ena["eyes"] = nil
ena["paws"] = 4

for (key, value) in ena {
    println("Ena has \(value) \(key)")
}

for enaKey in ena.keys {
    println(enaKey)
}

for enaValue in ena.values {
    println(enaValue)
}


var articles = [
    ["title": "Ena breaks tail", "date": "02/23/15", "author": "tedi"],
    ["title": "MOB class does Core Date", "data": "02/25/15", "author": "Arthur"]


]

articles[1]["title"]!

for article in articles {
    println(article["title"]!)
}