//: [Previous](@previous)

import Foundation

enum DownloadState {
    case inProgress(progress: Double)
    case paused(progress: Double)
    case cancelled
    case finished(Data)
}

func updateProgressView(with: Double) { }

func showCancelledMessage() { }

func process(_ data: Data) { }

/*
 
 Two enum cases with associated values can be handled by the same switch case, as long as their associated values are of the same type (and the local variables are named the same)
 
 */

func downloadStateDidChange(to state: DownloadState) {
    
    switch state {
    case .inProgress(let progress), .paused(let progress):
        updateProgressView(with: progress)
    case .cancelled:
        showCancelledMessage()
    case .finished(let data):
        process(data)
    }
    
}

//: [Next](@next)
