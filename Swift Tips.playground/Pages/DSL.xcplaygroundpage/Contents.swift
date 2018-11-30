//: [Previous](@previous)

import UIKit

/*
 STEP 1
 */

protocol LayoutAnchor {
    func constraint(equalTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self, constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor { }

struct LayoutProperty<Anchor: LayoutAnchor> {
    fileprivate let anchor: Anchor
}

class LayoutProxy {
    
    lazy var leading = property(with: view.leadingAnchor)
    lazy var trailing = property(with: view.trailingAnchor)
    lazy var top = property(with: view.topAnchor)
    lazy var bottom = property(with: view.bottomAnchor)
    lazy var width = property(with: view.widthAnchor)
    lazy var height = property(with: view.heightAnchor)
    
    private let view: UIView
    
    fileprivate init(view: UIView) {
        self.view = view
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
    
}

extension LayoutProperty {
    
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor, constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant).isActive = true
    }
    
}

/*
 STEP 2
 */

extension UIView {
    
    func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
    
}

/*
 STEP 3
 */

func +<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

func -<A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

func ==<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func >=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func <=<A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

/*
 Usage examples
 */

let label = UILabel()
let button = UIButton()

/*
 STEP 1
 */

label.translatesAutoresizingMaskIntoConstraints = false
button.translatesAutoresizingMaskIntoConstraints = false
let proxy = LayoutProxy(view: label)
proxy.top.equal(to: button.bottomAnchor, offsetBy: 20)
proxy.leading.equal(to: button.leadingAnchor)
proxy.width.lessThanOrEqual(to: button.widthAnchor, offsetBy: -10)

/*
 STEP 2
 */

label.layout {
    $0.top.equal(to: button.bottomAnchor, offsetBy: 20)
    $0.leading.equal(to: button.leadingAnchor)
    $0.width.lessThanOrEqual(to: button.widthAnchor, offsetBy: -10)
}

/*
 STEP 3
*/

label.layout {
    $0.top == button.bottomAnchor + 20
    $0.leading == button.leadingAnchor
    $0.width <= button.widthAnchor - 10
}

//: [Next](@next)
