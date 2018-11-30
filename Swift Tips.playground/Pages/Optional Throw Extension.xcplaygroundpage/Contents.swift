import UIKit

extension Optional {
    
    func orThrow(_ errorExpression: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            throw errorExpression()
        }
    }
    
}

func loadFile() -> Data? {
    return nil
}

var value: String? = "~"

do {
    try loadFile().orThrow(NSError(domain: "bad", code: 99, userInfo: nil) as Error)
} catch {
    print(error)
}

