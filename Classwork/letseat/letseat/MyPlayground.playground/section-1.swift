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

var moodArrary = [
    ["mood": "happy", "food": "steak"],
    ["mood": "sad", "food": "burgers"],
    ["mood": "heathy", "food": "salad"],
    ["mood": "sick", "food": "pho"],
    ["mood": "ethinc", "food": "thia"],
    ["mood": "comfort", "food": "chinese"],
    ["mood": "fun", "food": "ice cream"]
]

moodArrary[0]["food"]!

