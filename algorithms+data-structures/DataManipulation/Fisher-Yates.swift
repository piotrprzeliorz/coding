//
//  Fisher-Yates.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 03/06/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

func shuffle<T: MutableCollection>(array: inout T) where T: RandomAccessCollection {

    var i = array.startIndex
    let beforeEndIndex = array.index(before: array.endIndex)

    while i < beforeEndIndex {

        let distance = array.distance(from: i, to: array.endIndex)

        let randomDistance = Int(arc4random_uniform(UInt32(distance)))
        let j = array.index(i, offsetBy: randomDistance)
        array.swapAt(i, j)
        array.formIndex(after: &i)
    }
}
