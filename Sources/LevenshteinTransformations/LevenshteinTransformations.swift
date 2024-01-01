//
//  LevenshteinTransformations.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

/// The enumeration holding the transformation functions.
enum LevenshteinTransformations {

    /// The transformation function for arrays with equatable elements.
    /// - Parameters:
    ///     - source: The original array.
    ///     - target: The target array.
    /// - Returns: The required transformations.
    static func levenshteinTransformations<Element>(
        from source: [Element],
        to target: [Element]
    ) -> [Transformation<Element>] where Element: Equatable {
        let sourceCount = source.count
        let targetCount = target.count

        var editDistances = Array(repeating: Array(repeating: 0, count: targetCount + 1), count: sourceCount + 1)
        var operations: [[EditOperation]] = .init(
            repeating: .init(repeating: .noChange, count: targetCount + 1),
            count: sourceCount + 1
        )

        setOperations(&operations, editDistances: &editDistances, source: source, target: target)

        var transformations: [Transformation<Element>] = []
        var indexSource = sourceCount
        var indexTarget = targetCount

        while indexSource > 0 || indexTarget > 0 {
            switch operations[indexSource][indexTarget] {
            case .noChange:
                indexSource -= 1
                indexTarget -= 1
            case .replace:
                transformations.append(.replace(at: indexSource - 1, with: target[indexTarget - 1]))
                indexSource -= 1
                indexTarget -= 1
            case .delete:
                transformations.append(.delete(at: indexSource - 1))
                indexSource -= 1
            case .insert:
                transformations.append(.insert(at: indexSource, element: target[indexTarget - 1]))
                indexTarget -= 1
            }
        }

        transformations.reverse()
        return transformations
    }

    /// Set the operations and edit distances according to the source and target array.
    /// - Parameters:
    ///     - operations: The operations.
    ///     - editDistances: The edit distances.
    ///     - source: The original array.
    ///     - target: The target array.
    /// - Returns: The required transformations.
    static func setOperations<Element>(
        _ operations: inout [[EditOperation]],
        editDistances: inout [[Int]],
        source: [Element],
        target: [Element]
    ) where Element: Equatable {
        let sourceCount = source.count
        let targetCount = target.count

        for sourceIndex in 0...sourceCount {
            editDistances[sourceIndex][0] = sourceIndex
            operations[sourceIndex][0] = .delete
        }

        for targetIndex in 0...targetCount {
            editDistances[0][targetIndex] = targetIndex
            operations[0][targetIndex] = .insert
        }

        for sourceIndex in 1...sourceCount {
            for targetIndex in 1...targetCount {
                if source[sourceIndex - 1] == target[targetIndex - 1] {
                    editDistances[sourceIndex][targetIndex] = editDistances[sourceIndex - 1][targetIndex - 1]
                    operations[sourceIndex][targetIndex] = .noChange
                } else {
                    editDistances[sourceIndex][targetIndex] = 1 + min(
                        editDistances[sourceIndex - 1][targetIndex - 1],
                        editDistances[sourceIndex - 1][targetIndex],
                        editDistances[sourceIndex][targetIndex - 1]
                    )
                    if editDistances[sourceIndex][targetIndex] == editDistances[sourceIndex - 1][targetIndex - 1] + 1 {
                        operations[sourceIndex][targetIndex] = .replace
                    } else if editDistances[sourceIndex][targetIndex]
                        == editDistances[sourceIndex - 1][targetIndex] + 1 {
                        operations[sourceIndex][targetIndex] = .delete
                    } else {
                        operations[sourceIndex][targetIndex] = .insert
                    }
                }
            }
        }
    }

    /// The transformation function for arrays with identifiable elements.
    /// - Parameters:
    ///     - source: The original array.
    ///     - target: The target array.
    /// - Returns: The required transformations.
    static func levenshteinTransformations<Element>(
        from source: [Element],
        to target: [Element]
    ) -> [Transformation<Element>] where Element: Identifiable {
        let transformations = levenshteinTransformations(from: source.map { $0.id }, to: target.map { $0.id })
        return transformations.compactMap { transformation in
            if let element = target.first(where: { $0.id == transformation.element }) {
                switch transformation {
                case let .replace(index, _):
                    return .replace(at: index, with: element)
                case let .insert(index, _):
                    return .insert(at: index, element: element)
                default:
                    return nil
                }
            } else {
                switch transformation {
                case let .delete(index):
                    return .delete(at: index)
                default:
                    return nil
                }
            }
        }
    }

}
