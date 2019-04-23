//
//  main.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 07/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

let graph = AdjacencyMatrixGraph<Int>()
graph.add(1)
graph.add(2)
graph.add(3)
graph.add(4)
graph.addEdge(from: 1, to: 2, withWeight: 1.0)
graph.addEdge(from: 2, to: 3, withWeight: 1.0)
graph.addEdge(from: 3, to: 4, withWeight: 4.5)

print(graph.description)

