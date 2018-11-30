//: [Previous](@previous)

import Foundation

protocol Tracker {
    func setUserId(userId: String)
    func setCurrentScreen(name: String)
    func logEvent(eventName: String, parameters: [String: Any]?)
}

class TrackerComposite: Tracker {
    
    static let sharedInstance = TrackerComposite()
    
    private init() { }
    
    var trackers: [Tracker] = []
    
    func setUserId(userId: String) {
        trackers.forEach { $0.setUserId(userId: userId) }
    }
    
    func setCurrentScreen(name: String) {
        trackers.forEach { $0.setCurrentScreen(name: name) }
    }
    
    func logEvent(eventName: String, parameters: [String : Any]? = nil) {
        trackers.forEach { $0.logEvent(eventName: eventName, parameters: parameters) }
    }
}

class FirebaseTracker: Tracker {
    func logEvent(eventName: String, parameters: [String : Any]? = nil) {
        print("Firebase \(#function)")
    }
    
    func setCurrentScreen(name: String) {
        print("Firebase \(#function)")
    }
    
    func setUserId(userId: String) {
        print("Firebase \(#function)")
    }
}

class SegmentTracker: Tracker {
    func logEvent(eventName: String, parameters: [String : Any]? = nil) {
        print("Segment \(#function)")
    }
    
    func setCurrentScreen(name: String) {
        print("Segment \(#function)")
    }
    
    func setUserId(userId: String) {
        print("Segment \(#function)")
    }
}

let composite = TrackerComposite.sharedInstance
composite.trackers = [SegmentTracker(), FirebaseTracker()]
composite.logEvent(eventName: "")

//: [Next](@next)
