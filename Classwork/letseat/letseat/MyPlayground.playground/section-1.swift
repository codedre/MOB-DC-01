// Playground - noun: a place where people can play

import UIKit

class Mood {
    var moodArrary = [
        ["mood": "happy", "food": "steak"],
        ["mood": "sad", "food": "burgers"],
        ["mood": "heathy", "food": "salad"],
        ["mood": "sick", "food": "pho"],
        ["mood": "ethinc", "food": "thia"],
        ["mood": "comfort", "food": "chinese"],
        ["mood": "fun", "food": "ice cream"]
    ]
    
    func moodLabels () {
        for moods in moodArrary {
            println(moods["mood"]!)
        }
    }
}

var moodTitle = Mood()

moodTitle.moodLabels()

var token = "jfwej9o309rfapjijf9gajh9"
var query = "food"

for i in 1...8 {
    println("http://googleapi.com/search/location?query=\(query)&key=\(token)")
}

