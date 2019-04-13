//
//  InsertionSort.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 08/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

/// O(n^2)
///
/// - Parameter array: Array of elements to sort
/// - Returns: Sorted array of elemnets in ascending order
func insertionSort<T: Comparable>(_ array: [T]) -> [T] {

    var temporaryArray = array

    for index in temporaryArray.indices {

        let value = temporaryArray[index]
        var i = index

        while i > 0 && value < temporaryArray[i - 1] {

            temporaryArray[i] = temporaryArray[i - 1]
            i -= 1

        }
        temporaryArray[i] = value
    }

    return temporaryArray

}
