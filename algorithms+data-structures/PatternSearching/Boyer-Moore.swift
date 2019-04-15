//
//  Boyer-Moore.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 15/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

extension String {
    func indexBM(of pattern: String) -> Index? {

        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= count else { return nil }

        var skipTable = [Character: Int]()
        for (index, character) in pattern.enumerated() {
            skipTable[character] = patternLength - index - 1
        }

        let p = pattern.index(before: pattern.endIndex)
        var i = index(startIndex, offsetBy: patternLength - 1)

        func backwards() -> Index? {
            var patterIndex = p
            var stringIndex = i
            while patterIndex > pattern.startIndex {
                stringIndex = index(before: stringIndex)
                patterIndex = index(before: patterIndex)
                guard self[stringIndex] == pattern[patterIndex] else { return nil }
            }
            return stringIndex
        }

        let lastChar = pattern[p]
        while i < endIndex {
            let c = self[i]
            if c == lastChar {
                if let k = backwards() {
                    return k
                }
                i = index(after: i)
            } else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
}
