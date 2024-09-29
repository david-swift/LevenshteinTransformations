//
//  Array.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

extension Array where Element: Equatable {

    /// Calculate the Levenshtein distance to another array.
    /// - Parameter target: The target array.
    /// - Returns: The Levenshtein distance.
    public func levenshteinDistance(to target: [Element]) -> Int {
        getTransformations(to: target).count
    }

    /// Get the transformations needed to transform the array into the target array.
    /// - Parameter target: The target array.
    /// - Returns: The transformations.
    public func getTransformations(to target: [Element]) -> [Transformation<Element>] {
        LevenshteinTransformations.levenshteinTransformations(from: self, to: target)
    }

    /// Call every transformation step needed to transform the array into the target array.
    /// - Parameters:
    ///     - target: The target array.
    ///     - functions: The transformation functions.
    public func transform(to target: [Element], functions: Functions<Element>) {
        var transformations = getTransformations(to: target)

        while !transformations.isEmpty {
            let transformation = transformations.removeFirst()
            transformation.transform(functions: functions, nextTransformations: &transformations)
        }
    }

    /// Call every transformation step needed to transform the array into the target array.
    /// - Parameters:
    ///     - target: The target array.
    ///     - functions: The transformation functions.
    public func transform(to target: [Element], functions: AsyncFunctions<Element>) async {
        var transformations = getTransformations(to: target)

        while !transformations.isEmpty {
            let transformation = transformations.removeFirst()
            await transformation.transform(functions: functions, nextTransformations: &transformations)
        }
    }

}

extension Array where Element: Identifiable {

    /// Calculate the Levenshtein distance to another array.
    /// - Parameter target: The target array.
    /// - Returns: The Levenshtein distance.
    public func identifiableLevenshteinDistance(to target: [Element]) -> Int {
        identifiableGetTransformations(to: target).count
    }

    /// Get the transformations needed to transform the array into the target array.
    /// - Parameter target: The target array.
    /// - Returns: The transformations.
    public func identifiableGetTransformations(to target: [Element]) -> [Transformation<Element>] {
        LevenshteinTransformations.levenshteinTransformations(from: self, to: target)
    }

    /// Call every transformation step needed to transform the array into the target array.
    /// - Parameters:
    ///     - target: The target array.
    ///     - functions: The transformation functions.
    public func identifiableTransform(to target: [Element], functions: Functions<Element>) {
        var transformations = identifiableGetTransformations(to: target)

        while !transformations.isEmpty {
            let transformation = transformations.removeFirst()
            transformation.transform(functions: functions, nextTransformations: &transformations)
        }
    }

    /// Call every transformation step needed to transform the array into the target array.
    /// - Parameters:
    ///     - target: The target array.
    ///     - functions: The transformation functions.
    public func identifiableTransform(to target: [Element], functions: AsyncFunctions<Element>) async {
        var transformations = identifiableGetTransformations(to: target)

        while !transformations.isEmpty {
            let transformation = transformations.removeFirst()
            await transformation.transform(functions: functions, nextTransformations: &transformations)
        }
    }

}
