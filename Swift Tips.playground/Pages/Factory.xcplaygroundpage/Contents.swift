//: [Previous](@previous)

import Foundation
import UIKit

extension UILabel {
    static func makeForTitle() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }

    static func makeForText() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }
}

class ArticleViewController: UIViewController {
    lazy var titleLabel = UILabel.makeForTitle()
    lazy var textLabel = UILabel.makeForText()
}

//: [Next](@next)
