//: [Previous](@previous)

import Foundation

enum Letters {
    case a
    case b
    case c
}

let foo: Letters = .a

switch foo {
case .b:
    print("b")
case .c:
    print("c")
case .a:
    fallthrough
default:
    break
}

//: [Next](@next)
