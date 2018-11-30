//: [Previous](@previous)

import Foundation
import os.log

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = OSLog(subsystem: OSLog.subsystem, category: "viewcycle")
    static let network = OSLog(subsystem: OSLog.subsystem, category: "network")
}


func viewDidLoad() {
    os_log(#function, log: OSLog.viewCycle, type: .info)
}

func viewDidAppear() {
    os_log(#function, log: OSLog.viewCycle, type: .info)
}

func networkFetch() {
    os_log(#function, log: OSLog.network, type: .info)
}

func networkGet() {
    os_log(#function, log: OSLog.network, type: .info)
}

viewDidLoad()

//: [Next](@next)
