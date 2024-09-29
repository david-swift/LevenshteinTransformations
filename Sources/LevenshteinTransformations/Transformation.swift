//
//  Transformation.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

// swiftlint:disable identifier_name

/// A transformation (replace, delete or insert).
public enum Transformation<Element> {

    /// Replace the element at a certain index with a certain element.
    case replace(at: Int, with: Element)
    /// Delete the element at a certain index.
    case delete(at: Int)
    /// Insert a certain element at a certain index.
    case insert(at: Int, element: Element)

    /// The index at which is directly affected by the transformation.
    public var index: Int {
        get {
            switch self {
            case let .replace(index, _), let .delete(index), let .insert(index, _):
                return index
            }
        }
        set {
            switch self {
            case let .replace(_, element):
                self = .replace(at: newValue, with: element)
            case .delete:
                self = .delete(at: newValue)
            case let .insert(_, element):
                self = .insert(at: newValue, element: element)
            }
        }
    }

    /// The element which is directly affected by the transformation.
    public var element: Element? {
        get {
            switch self {
            case let .replace(_, element), let .insert(_, element):
                return element
            case .delete:
                return nil
            }
        }
        set {
            if let newValue {
                switch self {
                case let .replace(index, _):
                    self = .replace(at: index, with: newValue)
                case let .insert(index, _):
                    self = .insert(at: index, element: newValue)
                case .delete:
                    break
                }
            }
        }
    }

    /// A description of the transformation.
    /// - Parameter source: The initial array.
    /// - Returns: The description.
    public func description(source: [Element]) -> String {
        switch self {
        case let .replace(index, element):
            return "Replace '\(source[index])' at position \(index) with '\(element)'"
        case let .delete(index):
            return "Delete '\(source[index])' at position \(index)"
        case let .insert(index, element):
            return "Insert '\(element)' at position \(index)"
        }
    }

    /// Print a description of the transformation.
    /// - Parameter source: The initial array.
    public func log(source: [Element]) {
        print(description(source: source))
    }

    /// Apply the transformation using a functions value.
    /// - Parameters:
    ///     - functions: The functions value.
    ///     - nextTransformations: All the following transformations for modifying the indices.
    public func transform(functions: Functions<Element>, nextTransformations: inout [Transformation<Element>]) {
        switch self {
        case let .replace(index, element):
            functions.replace(index, element)
        case let .delete(index):
            functions.delete(index)
            for index in nextTransformations.indices {
                nextTransformations[index].index -= 1
            }
        case let .insert(index, element):
            functions.insert(index, element)
            for index in nextTransformations.indices {
                nextTransformations[index].index += 1
            }
        }
    }

    /// Apply the transformation using a functions value.
    /// - Parameters:
    ///     - functions: The functions value.
    ///     - nextTransformations: All the following transformations for modifying the indices.
    public func transform(
        functions: AsyncFunctions<Element>,
        nextTransformations: inout [Transformation<Element>]
    ) async {
        switch self {
        case let .replace(index, element):
            await functions.replace(index, element)
        case let .delete(index):
            await functions.delete(index)
            for index in nextTransformations.indices {
                nextTransformations[index].index -= 1
            }
        case let .insert(index, element):
            await functions.insert(index, element)
            for index in nextTransformations.indices {
                nextTransformations[index].index += 1
            }
        }
    }

}

// swiftlint:enable identifier_name
