//
//  HashTable.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 15/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

struct HashTable<Key: Hashable, Value> {

    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]

    private var buckets: [Bucket]

    private(set) public var count = 0

    // MARK: - API

     init(capcity: Int) {
        precondition(capcity > 0)
        buckets = Array(repeating: [], count: capcity)
    }

    subscript(key: Key) -> Value? {
        get {
            return get(for: key)
        }
        set {
            if let value = newValue {
                update(value, key: key)
            } else {
                remove(key: key)
            }
        }
    }

    // MARK: - Helpers

    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }

    private func get(for key: Key) -> Value? {
       let index = self.index(for: key)
        return buckets[index].first(where: { $0.key.hashValue == key.hashValue })?.value
    }

    private mutating func update(_ value: Value, key: Key) {
        let index = self.index(for: key)

        for (i, element) in buckets[index].enumerated() {
            if element.key.hashValue == key.hashValue {
                buckets[index][i].value = value
                return
            }
        }
        buckets[index].append((key: key, value: value))
        count += 1
    }

    private mutating func remove(key: Key)  {
         let index = self.index(for: key)
        for (i, element) in buckets[index].enumerated() {
            if key.hashValue == element.key.hashValue {
                buckets[index].remove(at: i)
                break
            }
        }
    }
}
