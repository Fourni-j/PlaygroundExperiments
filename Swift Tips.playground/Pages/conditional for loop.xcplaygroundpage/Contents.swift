//: [Previous](@previous)

import Foundation

let items: [Any?] = [
    1,
    "john",
    nil,
    4.2,
    [1, 2, 3],
    "jane"
]

for case let name as String in items {
    print("\(name) is in the array")
}

//: [Next](@next)
