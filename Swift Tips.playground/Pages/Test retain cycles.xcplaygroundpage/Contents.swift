//: [Previous](@previous)

import Foundation
import XCTest

protocol NetworkDelegate: class { }

class NetworkDelegateMock: NetworkDelegate { }

class NetworkService {
    weak var delegate: NetworkDelegate?
}

func testDelegatyeNotRetained() {
    // Assing the delegate (weak) and also retian it using a local var
    let networkService = NetworkService()
    var delegate: NetworkDelegate? = NetworkDelegateMock()
    networkService.delegate = delegate
    XCTAssertNotNil(networkService.delegate)
    
    // Release the local var, wich should also release the weak reference
    delegate = nil
    XCTAssertNil(networkService.delegate)
}

testDelegatyeNotRetained()

//: [Next](@next)
