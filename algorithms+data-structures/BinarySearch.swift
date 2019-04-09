//
//  BinarySearch.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 09/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

func binarySearch<T: Comparable>(key: T, array: [T]) -> Int? {
    var lowerBound = 0
    var upperBound = array.count

    while upperBound > lowerBound {
        let mindIndex = lowerBound + (upperBound - lowerBound) / 2
        if array[mindIndex] > key {
            upperBound = mindIndex
        } else if array[mindIndex] < key {
            lowerBound = mindIndex + 1
        } else if array[mindIndex] == key {
            return mindIndex
        }
    }
    return nil
}
