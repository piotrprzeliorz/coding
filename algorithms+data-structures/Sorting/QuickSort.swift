//
//  QuickSort.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 16/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

func quickSort<T: Comparable>(_ arr: inout [T], left: Int, right: Int) {
    print("left: \(left), right: \(right)")
    guard left < right else { return }

    let pivot = arr[(left + right) / 2]
    let index = partition(&arr, left, right, pivot)

    quickSort(&arr, left: left, right: index - 1)
    quickSort(&arr, left: index, right: right)
}

func partition<T: Comparable>(_ array: inout [T], _ left: Int, _ right: Int, _ pivot: T) -> Int {
    var left = left
    var right = right

    while left <= right {

        while array[left] < pivot {
            left += 1
        }
        while array[right] > pivot {
            right -= 1
        }

        if left <= right {
            array.swapAt(left, right)
            right -= 1
            left += 1
        }
    }
    return left
}
