//
//  LinkedList.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 15/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

class LinkedListNode<T> {

    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?

     init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {

    typealias Node = LinkedListNode<T>

    private var head: Node?

    var first: Node? {
        return head
    }

    var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }

    func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
                lastNode.next = newNode
             newNode.previous = lastNode
        } else {
            head = newNode
        }
    }

     func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        node.previous = nil
        node.next = nil
        return node.value
    }
}
