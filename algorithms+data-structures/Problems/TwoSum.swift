//
//  TwoSum.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 24/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

///O(n)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:]

    for (index, value) in nums.enumerated() {

        let diff = target - value

        if let secondIndex = dict[diff] {
            return [secondIndex, index]
        }
        dict[value] = index

    }
    fatalError("No solution")
}

