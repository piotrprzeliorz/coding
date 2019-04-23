//
//  BinarySearchTree.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 11/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

/// Worst case O(n)
enum BinarySearchTree<T: Comparable> {
    case empty
    case leaf(T)
    indirect case node(BinarySearchTree, T, BinarySearchTree)

    var count: Int {
        switch self {
        case .empty:
            return 0
        case .leaf:
            return 1
        case let .node(left, _, right):
            return left.count + right.count + 1
        }
    }

    @discardableResult
    func insert(newValue: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .leaf(newValue)
        case .leaf(let value):
            if newValue > value {
                return .node(.empty, value, .leaf(newValue))
            } else {
                return .node(.leaf(newValue), value, .empty)
            }
        case .node(let left, let value, let right):
            if newValue > value {
                return .node(left, value, right.insert(newValue: newValue))
            } else {
                return .node(left.insert(newValue: newValue), value, right)
            }
        }
    }

    func search(_ key: T) -> BinarySearchTree? {
        switch self {
        case .empty:
            return nil
        case .leaf(let value):
            return (key == value) ? self : nil
        case let .node(left, value, right):
            if key < value {
                return left.search(key)
            } else if value < key {
                return right.search(key)
            } else {
                return self
            }
        }
    }
}

// MARK: - CustomDebugStringConvertible

extension BinarySearchTree: CustomDebugStringConvertible {

    public var debugDescription: String {
        switch self {
        case .empty: return "x"
        case .leaf(let value): return "\(value)"
        case .node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}

