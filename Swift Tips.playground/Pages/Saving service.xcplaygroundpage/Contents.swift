//: [Previous](@previous)

import Foundation

protocol ProposalUserDefaultsProtocol {
    func hasProposalBeenSeen(id: String) -> Bool
    func setProposalAsSeen(id: String)
}

class ProposalUserDefaults: ProposalUserDefaultsProtocol {

    private let proposalsKey = "seenProposalsKey"
    
    func hasProposalBeenSeen(id: String) -> Bool {
        guard let proposals = UserDefaults.standard.array(forKey: proposalsKey) as? [String] else { return false }
        return proposals.contains(id)
    }
    
    func setProposalAsSeen(id: String) {
        if hasProposalBeenSeen(id: id) { return }
        var proposals: [String] = UserDefaults.standard.array(forKey: proposalsKey) as? [String] ?? []
        proposals.append(id)
        UserDefaults.standard.set(proposals, forKey: proposalsKey)
    }
    
}

let proposalDefaults = ProposalUserDefaults()

proposalDefaults.hasProposalBeenSeen(id: "1234567890")

proposalDefaults.setProposalAsSeen(id: "1234567890")

proposalDefaults.hasProposalBeenSeen(id: "1234567890")

//: [Next](@next)
