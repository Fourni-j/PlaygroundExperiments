//: [Previous](@previous)

import Foundation
import UIKit

enum ImageError: Error {
    case preparationFailed
}

func watermark(_ image: UIImage) -> UIImage? {
    return UIImage()
}

func encrypt(_ image: UIImage) -> UIImage? {
    return UIImage()
}

func prepareImageForUpload(_ image: UIImage) throws -> UIImage {
    guard let watermarked = watermark(image) else {
        throw ImageError.preparationFailed
    }
    
    guard let encrypted = encrypt(watermarked) else {
        throw ImageError.preparationFailed
    }
    
    return encrypted
}

extension Optional {
    func orThrow(_ errorExpression: @autoclosure () -> Error) throws -> Wrapped {
        guard let value = self else { throw errorExpression() }
        return value
    }
}

func newPrepareImageForUpload(_ image: UIImage) throws -> UIImage {
    return try watermark(image).flatMap(encrypt).orThrow(ImageError.preparationFailed)
}


try newPrepareImageForUpload(UIImage())

/*  Matching against predicate  */


func search() {
    let text: String? = ""
    guard let myText = text, myText.count > 2 else { return }
}

extension Optional {
    func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self else { return nil }
        guard predicate(value) else { return nil}
        return value
    }
}

func improvedSearch() {
    let text: String? = ""
    
    text.matching { $0.count > 2 }

}


//: [Next](@next)
