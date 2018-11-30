//: [Previous](@previous)

import Foundation

enum TrackingEvents {
    enum Gallery {
        case tipi
        case travelGuide
    }
}


protocol GalleryTracking {
    
    func didSwipe()
    func didShowUI()
    func didDismissUI()
    
}

extension TrackingEvents.Gallery: GalleryTracking {

    func didSwipe() { }
    func didShowUI() { }
    func didDismissUI() { }
    
}


class GalleryViewModel {
    
    let tracking: GalleryTracking
    
    init(tracking: GalleryTracking) {
        self.tracking = tracking
    }
    
    func swipeLeft() {
        tracking.didSwipe()
        
    }
    
}

//: [Next](@next)

