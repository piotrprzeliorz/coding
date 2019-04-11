//
//  Queue.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 07/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

/// FIFO, O(n) - worst case
struct Queue<T> {

    private var array: [T?] = []
    private var head = 0
    private let maxUntrimmedSize: Int

    init(maxUntrimmedSize: Int = 100) {
        self.maxUntrimmedSize = maxUntrimmedSize
    }

    mutating func enqueue(_ element: T) {
        array.append(element)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        guard array.indices.contains(head) else { return nil }
        let element = array[head]

        array[head] = nil
        head += 1

        if array.count > maxUntrimmedSize {
            array.removeFirst(head)
            head = 0
        }

        return element
    }

    public var front: T? {
        if array.isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}
