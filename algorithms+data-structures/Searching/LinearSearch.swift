//
//  LinearSearch.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 15/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

/// O(n)
///
/// - Parameters:
///   - array: Array of elements
///   - key: Search element
/// - Returns: Index of searched element
func linearSearch<T: Equatable>(_ array: [T], key: T) -> Int? {
    for (index, element) in array.enumerated() {
        if element == key {
            return index
        }
    }
    return nil
}
