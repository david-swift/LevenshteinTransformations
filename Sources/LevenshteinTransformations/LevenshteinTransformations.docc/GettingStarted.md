# Getting started

Learn how to use _Levenshtein Transformations_.

## Installation

1. Open your Swift package in GNOME Builder, Xcode, or any other IDE.
2. Open the `Package.swift` file.
3. Into the `Package` initializer, under `dependencies`, paste:
```swift
.package(url: "https://github.com/david-swift/LevenshteinTransformations", from: "0.1.0")   
```

## Usage

```swift
let source = [1, 2, 5, 6]
let target = [0, 1, 5, 6, 10]
```

There are three functions available for arrays containing elements conforming to `Equatable` and strings.

### Arrays with Equatable Elements and Strings

#### Levenshtein Distance
Get the Levenshtein distance with ``Swift/Array/levenshteinDistance(to:)`` (for strings: ``Swift/String/levenshteinDistance(to:)``).
```swift
print(source.levenshteinDistance(to: target))
```
This example outputs `3`.

#### Transformation Steps
Get the individual transformation steps with ``Swift/Array/getTransformations(to:)`` (for strings: ``Swift/String/getTransformations(to:)``).
```swift
print(source.getTransformations(to: target).map { $0.description(source: source) }.joined(separator: "\n"))
```
This example prints the descriptions of the transformations:
```
Replace '1' at position 0 with '0'
Replace '2' at position 1 with '1'
Insert '10' at position 4
```

#### Run Functions for the Steps
Directly run functions for the `replace`, `delete` and `insert` transformations using the ``Swift/Array/transform(to:functions:)`` (for strings: ``Swift/String/transform(to:functions:)``) function.
```swift
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
```
This example outputs `true`.

### Arrays with Identifiable Elements

The same functions are available for arrays with identifiable elements, but they are named differently to avoid conflicts:
- ``Swift/Array/identifiableLevenshteinDistance(to:)``
- ``Swift/Array/identifiableGetTransformations(to:)``
- ``Swift/Array/identifiableTransform(to:functions:)``

## Development
_Levenshtein Transformations_ is an open source project. Visit the [GitHub repository][1] for bug reports, feature requests, pull requests and more information.

[1]:    https://github.com/david-swift/LevenshteinTransformations
