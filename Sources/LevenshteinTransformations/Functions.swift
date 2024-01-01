//
//  Functions.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

/// The replace, delete and insert functions type.
public struct Functions<Element> {

    /// The replace function.
    var replace: (Int, Element) -> Void
    /// The delete function.
    var delete: (Int) -> Void
    /// The insert function.
    var insert: (Int, Element) -> Void

    /// Initialize a functions value.
    /// - Parameters:
    ///     - replace: Replace the element at a certain index with a certain element.
    ///     - delete: Delete the element at a certain index.
    ///     - insert: Insert a certain element at a certain index.
    public init(
        replace: @escaping (Int, Element) -> Void,
        delete: @escaping (Int) -> Void,
        insert: @escaping (Int, Element) -> Void
    ) {
        self.replace = replace
        self.delete = delete
        self.insert = insert
    }

}
