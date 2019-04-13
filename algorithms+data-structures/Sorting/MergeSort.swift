//
//  MergeSort.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 13/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

/// O(n log n)
///
/// - Parameter array: Array of elements to sort
/// - Returns: Sorted array of elemnets in ascending order
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {

    guard array.count > 1 else { return array }

    let middleIndex = array.count / 2

    let left = mergeSort(Array(array[0..<middleIndex]))
    let right = mergeSort(Array(array[middleIndex..<array.count]))

    var leftIndex = 0
    var rightIndex = 0

    var sortedPile: [T] = []
    sortedPile.reserveCapacity(left.count + right.count)

    while leftIndex < left.count && rightIndex < right.count {

        if left[leftIndex] < right[rightIndex] {
            sortedPile.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            sortedPile.append(right[rightIndex])
            rightIndex += 1
        } else {
            sortedPile.append(right[rightIndex])
            rightIndex += 1
            sortedPile.append(left[leftIndex])
            leftIndex += 1
        }
    }

    while leftIndex < left.count {
        sortedPile.append(left[leftIndex])
        leftIndex += 1
    }

    while rightIndex < right.count {
        sortedPile.append(right[rightIndex])
        rightIndex += 1
    }


    return sortedPile

}
