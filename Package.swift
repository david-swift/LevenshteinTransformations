// swift-tools-version: 5.8
//
//  Package.swift
//  LevenshteinTransformations
//
//  Created by david-swift on 01.01.24.
//

import PackageDescription

/// The LevenshteinTransformations package.
let package = Package(
    name: "LevenshteinTransformations",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "LevenshteinTransformations",
            targets: ["LevenshteinTransformations"]
        )
    ],
    targets: [
        .target(
            name: "LevenshteinTransformations"
        ),
        .executableTarget(
            name: "LevenshteinTransformationsTests",
            dependencies: ["LevenshteinTransformations"],
            path: "Tests"
        )
    ]
)
