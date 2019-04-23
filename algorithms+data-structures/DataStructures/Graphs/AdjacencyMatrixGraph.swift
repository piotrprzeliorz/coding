//
//  AdjacencyMatrixGraph.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 23/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

final class AdjacencyMatrixGraph<Item: Hashable> {

    private var matrix = [[Double?]]()
    private var nodes = [Item: Int]()

    // MARK: - API

    func add(_ item: Item) {
        guard nodes[item] == nil else { return }
        for idx in stride(from: matrix.count - 1, through: 0, by: -1) {
            var item = matrix[idx]
            item.append(nil)
            matrix[idx] = item
        }
        matrix.append(Array(repeating: nil, count: matrix.count + 1))
        nodes[item] = Int(matrix.count - 1)
    }

    func addEdge(from: Item, to: Item, withWeight weight: Double?) {
        guard let fromIndex = nodes[from] else { return }
        guard let toIndex = nodes[to] else { return }
        matrix[fromIndex][toIndex] = weight
    }

    func weight(from: Item, to: Item) -> Double? {
        guard let fromIndex = nodes[from] else { return nil }
        guard let toIndex = nodes[to] else { return nil }
        return matrix[fromIndex][toIndex]
    }

    var description: String {
        var result = ""
        matrix.forEach { row in
            row.forEach({ item in
                if let item = item {
                    result += "| " + String(item)
                } else {
                    result += "| X "
                }
            })
        }
        return result
    }
}
