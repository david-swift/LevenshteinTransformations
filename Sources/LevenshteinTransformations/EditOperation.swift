//
//  EditOperation.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

/// An edit operation is a transformation without parameters.
/// Additionally, it has the case `noChange`.
enum EditOperation {

    /// No operation.
    case noChange
    /// A replace operation.
    case replace
    /// A delete operation.
    case delete
    /// An insert operation.
    case insert

}
