//
//  LevenshteinTransformationsTests.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

// swiftlint:disable no_magic_numbers

import LevenshteinTransformations

/// Tests for the LevenshteinTransformations library.
@main
enum LevenshteinTransformationsTests {

    /// An example type conforming to `Identifiable`.
    struct TestType: Identifiable, Equatable {

        /// The identifier.
        var id: Int

    }

    /// Test the `transform` function on an equatable array.
    static func testEquatable() {
        let source = [1, 2, 5, 6]
        let target = [0, 1, 5, 6, 10]

        var modified = source

        source.transform(
            to: target,
            functions: .init { index, element in
                modified[index] = element
            } delete: { index in
                modified.remove(at: index)
            } insert: { index, element in
                modified.insert(element, at: index)
            }
        )

        print(modified == target)
    }

    /// Test the `transform` function on an identifiable array.
    static func testIdentifiable() {
        let source = [1, 2, 5, 6].map { TestType(id: $0) }
        let target = [0, 1, 5, 6, 10].map { TestType(id: $0) }

        var modified = source

        source.identifiableTransform(
            to: target,
            functions: .init { index, element in
                modified[index] = element
            } delete: { index in
                modified.remove(at: index)
            } insert: { index, element in
                modified.insert(element, at: index)
            }
        )

        print(modified == target)
    }

    /// Test the `transform` function on a string.
    static func testString() {
        let source = "Hello World"
        let target = "Servus Welt"

        var modified = Array(source)

        source.transform(
            to: target,
            functions: .init { index, element in
                modified[index] = element
            } delete: { index in
                modified.remove(at: index)
            } insert: { index, element in
                modified.insert(element, at: index)
            }
        )

        print(String(modified) == target)
    }

    /// Run the tests.
    static func main() {
        testEquatable()
        testIdentifiable()
        testString()
    }

}

// swiftlint:enable no_magic_numbers
