//: [Previous](@previous)

import Foundation

struct Options: OptionSet {
    let rawValue: UInt
    
    static let noConnector = Options(rawValue: 1 << 0)
    static let topConnector = Options(rawValue: 1 << 1)
    static let bottomConnector = Options(rawValue: 1 << 2)
    
    static let middleNode: Options = [topConnector, bottomConnector]
    static let allOptions: Options = [noConnector, topConnector, bottomConnector]
}


let nodeOptions: Options = .middleNode

print(Options.noConnector)
print(Options.topConnector)
print(Options.bottomConnector)
print(nodeOptions)
print(Options.allOptions)


Options.middleNode.contains(Options.topConnector)
//: [Next](@next)
