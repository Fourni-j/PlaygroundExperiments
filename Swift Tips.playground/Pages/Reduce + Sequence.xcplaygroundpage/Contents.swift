//: [Previous](@previous)

import Foundation

extension Sequence where Element: Equatable {
    
    func numberOfOccurences(of target: Element) -> Int {
        return reduce(0) { result, element in
            guard element == target else {
                return result
            }
            return result + 1
        }
    }
    
}


var customerCities: [String] = ["Paris", "Londres", "Paris", "Singapour", "Hong Kong", "Manama"]

customerCities.numberOfOccurences(of: "Paris")




//: [Next](@next)
