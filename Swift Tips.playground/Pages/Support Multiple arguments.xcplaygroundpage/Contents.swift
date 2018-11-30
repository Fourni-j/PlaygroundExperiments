//: [Previous](@previous)

import Foundation
import UIKit

// Dropping suffixes from method names to support multiple arguments

extension UIView {
    func add(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}

let button = UIView()
let label = UIView()

let backgroundView = UIView()

backgroundView.add(button)
backgroundView.add(label)

// By dropping the "Subview" suffix form th emethod name, both
// single and multiple arguments work really well semantically.

backgroundView.add(button, label)

//: [Next](@next)
