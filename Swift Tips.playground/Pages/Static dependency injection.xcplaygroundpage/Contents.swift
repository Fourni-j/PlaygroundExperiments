//: [Previous](@previous)

import Foundation

class Database {
    static let shared = Database()
    
    private init() { }
    
    func save(_ event: String) { }
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func post(_ event: String) { }
}


class Analytics {
    // Almost impossible to test due to the use of singleton
    static func log(_ event: String) {
        Database.shared.save(event)
        NetworkManager.shared.post(event)
    }
    
    // Much easier to test, since we can inject mocks as argument
    static func log(_ event: String, database: Database = .shared, networkManager: NetworkManager = .shared) {
        database.save(event)
        networkManager.post(event)
    }
}


//: [Next](@next)
