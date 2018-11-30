//: [Previous](@previous)

import Foundation

struct Friend { }

class Networking {
    
    static func loadData(_ completionResult: ([Friend]) -> Void) {
        completionResult([Friend(), Friend()])
    }
    
}

// Before

/*
 
 Testing code that uses static APIs can be real
 
 */

class FriendsLoader {
    func loadFriends() {
        Networking.loadData() { result in
            print("Do something with the result")
        }
    }
}

// After

class FriendsLoaderV2 {
    typealias Handler<T> = ([T]) -> Void
    typealias DataLoadingFunction = ([Data]) -> Void

    
    
}


FriendsLoader().loadFriends()
//: [Next](@next)
