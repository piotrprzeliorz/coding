//
//  Brute-ForceSearch.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 14/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

extension String {
    func indexOfBF(of pattern: String) -> String.Index? {
        for i in self.indices {
            var j = i
            var found = true
            for p in pattern.indices{
                if j == self.endIndex || self[j] != pattern[p] {
                    found = false
                    break
                } else {
                    j = self.index(after: j)
                }
            }
            if found {
                return i
            }
        }
        return nil
    }
}
