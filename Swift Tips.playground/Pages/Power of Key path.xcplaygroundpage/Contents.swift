//: [Previous](@previous)

import Foundation

struct Article {
    let id: UUID
    let source: URL
    let title: String
    let body: String
}

let articles: [Article] = []

var articlesIDs = articles.map { $0.id }
var articlesSources = articles.map { $0.source }

extension Sequence {
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
}

articlesIDs = articles.map(\.id)
articlesSources = articles.map(\.source)

extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}

articles.sorted(by: \.title)
articles.sorted(by: \.body)
