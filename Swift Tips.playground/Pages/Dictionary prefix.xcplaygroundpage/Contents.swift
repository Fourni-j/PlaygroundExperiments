//: [Previous](@previous)

import Foundation

var names = ["Charles",
             "Benoit",
             "Thibaut",
             "Alexandre",
             "Marc-Alexandre",
             "Charles-Adrien"]

names.sort { $0.prefix(1) < $1.prefix(1) }

let groupedName = Dictionary(grouping: names, by: { $0.prefix(1) })

groupedName


//: [Next](@next)
