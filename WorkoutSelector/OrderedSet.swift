//
//  OrderedSet.swift
//  WorkoutSelector
//
//  Created by Justin Morrow on 4/14/16.
//  Copyright © 2016 JPMorrow. All rights reserved.
//

import Foundation

let x = Set<Int>()

/// Ensures unique, ordered elements
struct OrderedSet<T: Equatable>: CollectionType {
    var a = Array<T>()
    var count: Int {
        return a.count
    }
    
    // MARK: Struct methods
    
    /// Appends `newElement`.
    ///
    /// - Complexity: O(`self.count`).
    mutating func append(newMember: T) {
        if(!a.contains(newMember)) {
            a.append(newMember)
        }
    }
    
    /// Insert `newElement` at index `i`.
    ///
    /// - Requires: `i <= self.count`.
    ///
    /// - Complexity: O(`self.count`).
    mutating func insert(newMember: T, atIndex i: OrderedSet.Index) {
        if(!a.contains(newMember)) {
            a.insert(newMember, atIndex: i)
        }
    }
    
    /// Remove `member` if in `self`
    ///
    /// - Complexity: O(`self.count`).
    mutating func remove(member: T) {
        var i = 0
        for elt in a {
            if(elt == member) {
                a.removeAtIndex(i)
            }
            i += 1
        }
    }
    
    // MARK: MutableCollectionType
    
    typealias Index = Array<T>.Index
    typealias SubSequence = Array<T>.SubSequence
    
    var endIndex: OrderedSet.Index {
        return a.endIndex
    }
    var startIndex: OrderedSet.Index {
        return a.startIndex
    }
    
    subscript(position: OrderedSet.Index) -> T {
        return a[position]
    }
    
    subscript(bounds: Range<OrderedSet.Index>) -> OrderedSet.SubSequence {
        return a[bounds]
    }
    
    
}