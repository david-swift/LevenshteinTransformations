<p align="center">
  <img width="256" alt="Levenshtein Transformations Icon" src="data/Icon.svg">
  <h1 align="center">Levenshtein Transformations</h1>
</p>

<p align="center">
  <a href="https://github.com/david-swift/LevenshteinTransformations">
  GitHub
  </a>
  ·
  <a href="Documentation/Reference/README.md">
  Contributor Docs
  </a>
</p>

Transform an array into any other array of the same type, or a string into any other string, using only the three transformations `replace`, `delete` and `insert`.

## Table of Contents

- [Installation](#Installation)
- [Usage](#Usage)
- [Thanks](#Thanks)

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

### Arrays with `Equatable` Elements and Strings

#### Levenshtein Distance
Get the Levenshtein distance with `levenshteinDistance(to:)`:
```swift
print(source.levenshteinDistance(to: target))
```
This example outputs `3`.

#### Transformation Steps
Get the individual transformation steps with `getTransformations(to:)`.
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
Directly run functions for the `replace`, `delete` and `insert` transformations using the `transform(to:functions:)` function.
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

### Arrays with `Identifiable` Elements

The same functions are available for arrays with identifiable elements, but they are named differently to avoid conflicts:
- `identifiableLevenshteinDistance(to:)`
- `identifiableGetTransformations(to:)`
- `identifiableTransform(to:functions:)`

## Thanks

- The [contributors](Contributors.md)
- [SwiftLint](https://github.com/realm/SwiftLint) for checking whether code style conventions are violated
- The programming language [Swift](https://github.com/apple/swift)
- [SourceDocs](https://github.com/SourceDocs/SourceDocs) used for generating the [docs](Documentation/Reference/README.md)

