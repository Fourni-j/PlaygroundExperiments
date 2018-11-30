//: [Previous](@previous)

import UIKit

protocol Component {
    associatedtype Container
    func add(to container: Container)
}

/*
 Protocols that inherit from other protocols can
 include constraints to further specialize them.
 */
protocol ViewComponent: Component where Container == UIView {
    associatedtype View: UIView
    var view: View { get }
}

/*
 This enables us to write specialized exensions that
 apply to all instances conforming to our new protocol.
 
 We get a guarantee that `container` is a UIView here.
 */
extension ViewComponent {
    func add(to container: UIView) {
        container.addSubview(view)
    }
}


//class MyViewComponent: ViewComponent {
//    
//    func setup() {
//        self.add(to: UILabel())
//    }
//    
//}

//: [Next](@next)
