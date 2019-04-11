//
//  main.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 07/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

var x = BinarySearchTree.leaf(3)
x = x.insert(newValue: 5)
x = x.insert(newValue: 1)
x = x.insert(newValue: 6)
x = x.insert(newValue: 4)
x = x.insert(newValue: 2)

print(x.search(4).debugDescription)

print("dupa \(x.debugDescription)")
