//
//  AsyncFunctions.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 29.09.24.
//

/// The replace, delete and insert functions type.
public struct AsyncFunctions<Element> {

    /// The replace function.
    var replace: (Int, Element) async -> Void
    /// The delete function.
    var delete: (Int) async -> Void
    /// The insert function.
    var insert: (Int, Element) async -> Void

    /// Initialize a functions value.
    /// - Parameters:
    ///     - replace: Replace the element at a certain index with a certain element.
    ///     - delete: Delete the element at a certain index.
    ///     - insert: Insert a certain element at a certain index.
    public init(
        replace: @escaping (Int, Element) async -> Void,
        delete: @escaping (Int) async -> Void,
        insert: @escaping (Int, Element) async -> Void
    ) {
        self.replace = replace
        self.delete = delete
        self.insert = insert
    }

}
