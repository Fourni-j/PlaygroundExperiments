//: [Previous](@previous)

import Foundation

public protocol MyCaseIterable {}
extension MyCaseIterable where Self: Hashable {
    private static func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }
    
    public static var allCases: [Self] {
        let s = iterateEnum(Self.self)
        return Array<Self>.init(s)
    }
}

enum Transport: Int, CaseIterable {
    case car
    case bus
    case train
    case plane
}

print(Transport.allCases)


enum LinkPattern: String, CaseIterable {
    case discussion = "/account/trips/(?<id>[0-9]+)/messages"
    case proposal = "/tipi/view/trip/(?<id>[^/]+)"
}

enum Link {
    case discussion(discussionID: Int)
    case proposal(proposalID: String)
}

extension Link: CaseIterable {
    static var allCases: [Link] {
        return [.discussion(discussionID: 9), .proposal(proposalID: "")]
    }
}

LinkPattern.allCases

//: [Next](@next)
