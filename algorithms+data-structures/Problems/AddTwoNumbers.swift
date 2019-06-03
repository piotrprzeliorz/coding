//
//  AddTwoNumbers.swift
//  algorithms+data-structures
//
//  Created by Piotr Przeliorz on 24/04/2019.
//  Copyright © 2019 Piotr Przeliorz. All rights reserved.
//

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}



func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {



    var l1Value: String = ""
    var l2Value: String = ""

    var currentNode = l1
    var current2Node = l2


    while currentNode?.val != nil || current2Node?.val != nil  {

        if let x1 = currentNode?.val.description {
            l1Value.append(x1)
            currentNode = currentNode?.next
        }

        if let x2 = current2Node?.val.description {
            l2Value.append(x2)
            current2Node = current2Node?.next
        }




    }

    let result = String(String(Int64(String(l1Value.reversed()))! + Int64(String(l2Value.reversed()))!).reversed())



    print(result)

        var resultNode: ListNode?
    var previousNode: ListNode?

    for value in result {

        if let _  = resultNode {

            let new = ListNode(Int(value.description)!)

            if previousNode != nil {

                previousNode?.next = new

            } else {


                resultNode?.next = new

            }

              previousNode = new



        } else {
            resultNode =  ListNode(Int(value.description)!)

        }

    }

    return resultNode


}

