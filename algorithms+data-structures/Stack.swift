//
//  Stack.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 07/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

/// LIFO, O(1)
struct Stack<T> {
    
    private var array: [T] = []
    
    var top: T? {
        return array.last
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }

    @discardableResult
    mutating func pop() -> T? {
        return array.popLast()
    }
}
