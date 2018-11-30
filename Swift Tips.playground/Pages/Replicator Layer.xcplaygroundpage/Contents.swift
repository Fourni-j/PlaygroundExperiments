//: [Previous](@previous)

import Foundation
import UIKit


import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGray
        

        let replicatorLayer = CAReplicatorLayer()
        
        let redSquare = CALayer()
        redSquare.backgroundColor = UIColor.white.cgColor
        redSquare.frame = CGRect(x: 50, y: 100, width: 20, height: 20)
        
        let instanceCount = 10
        
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(25, 0, 0)
        
        let offsetStep = -1 / Float(instanceCount)
        replicatorLayer.instanceBlueOffset = offsetStep
        replicatorLayer.instanceGreenOffset = offsetStep
        
        replicatorLayer.addSublayer(redSquare)

        let verticalReplicatorLayer = CAReplicatorLayer()
        verticalReplicatorLayer.instanceBlueOffset = offsetStep
        verticalReplicatorLayer.instanceCount = instanceCount
        verticalReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(0, 25, 0)

        verticalReplicatorLayer.addSublayer(replicatorLayer)
        
        self.view = view
        
        view.layer.addSublayer(verticalReplicatorLayer)

        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


//



//: [Next](@next)
