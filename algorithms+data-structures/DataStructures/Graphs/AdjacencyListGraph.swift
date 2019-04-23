//
//  AdjacencyListGraph.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 23/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation

final class AdjacencyListGraph<Item: Hashable> {

    private(set) lazy var nodes = [Item]()
    private lazy var edges = [Edge<Item>]()

    // MARK: - API

    func add(_ item: Item) {
        guard contains(item) == false else { return }
        nodes.append(item)
    }

    func addEdge(from: Item, to: Item, withWeight weight: Double?) {
        if let edge = findEdge(from, to) {
            edge.weight = weight
        } else {
            edges.append(Edge(from, to, weight))
        }
    }

    func weight(from: Item, to: Item) -> Double? {
        return findEdge(from, to)?.weight
    }

    var description: String {
        var result = ""
        for item in nodes {
            result += "[ \(item) ->"
            let allEdges = findAllEdges(of: item)
            for (idx, edge) in allEdges.enumerated() {
                if idx == edges.count - 1 {
                    result += " \(edge)"
                } else {
                    result += " \(edge), "
                }
            }
            result += " ]\n"
        }
        return result
    }

    // MARK: - Private

    private func contains(_ vertex: Item) -> Bool {
        return nodes.contains(where: { $0 == vertex })
    }

    private func findEdge(_ from: Item, _ to: Item) -> Edge<Item>? {
        return edges.first(where: { $0.from == from && $0.to == to })
    }

    private func findAllEdges(of node: Item) -> [Edge<Item>] {
        return edges.filter({ $0.from == node })
    }
}

private class Edge<Item> {

    var from: Item
    var to: Item

    var weight: Double?

    init(_ from: Item, _ to: Item, _ weight: Double? = nil) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}
