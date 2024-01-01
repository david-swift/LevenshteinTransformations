//
//  Array.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

extension String {

    /// Calculate the Levenshtein distance to another string.
    /// - Parameter target: The target string.
    /// - Returns: The Levenshtein distance.
    public func levenshteinDistance(to target: String) -> Int {
        getTransformations(to: target).count
    }

    /// Get the transformations needed to transform the string into the target string.
    /// - Parameter target: The target string.
    /// - Returns: The transformations.
    public func getTransformations(to target: String) -> [Transformation<Character>] {
        Array(self).getTransformations(to: .init(target))
    }

    /// Call every transformation step needed to transform the string into the target string.
    /// - Parameters:
    ///     - target: The target string.
    ///     - functions: The transformation functions.
    public func transform(to target: String, functions: Functions<Character>) {
        var transformations = getTransformations(to: target)

        while !transformations.isEmpty {
            let transformation = transformations.removeFirst()
            transformation.transform(functions: functions, nextTransformations: &transformations)
        }
    }

}
