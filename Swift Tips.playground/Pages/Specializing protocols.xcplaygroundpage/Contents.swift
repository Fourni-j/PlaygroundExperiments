//: [Previous](@previous)

import Foundation
import UIKit

/*
 Specialize protocol
 */

protocol Component {
    associatedtype Container
    func addTo(to container: Container)
}

protocol ViewComponent: Component where Container: UIView {
    associatedtype View: UIView
    var view: View { get }
}

extension ViewComponent {
    func addTo(to container: Container) {
        container.addSubview(view)
    }
}

/*
 Composition protocol
 */

protocol BigOperation {
    associatedtype Input
    associatedtype Output
    
    func prepare()
    func cancel()
    func perform(with input: Input, then handler: @escaping (Output) -> Void)
}

protocol Preparable {
    func prepare()
}

protocol Cancellable {
    func cancel()
}

protocol Performable {
    associatedtype Input
    associatedtype Output
    
    func perform(with input: Input, then handler: @escaping (Output) -> Void)
}

typealias Operation = Preparable & Cancellable & Performable

extension Sequence where Element: Cancellable {
    func cancelAll() {
        forEach { $0.cancel() }
    }
}

//: [Next](@next)
