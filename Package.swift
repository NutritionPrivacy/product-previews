// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ProductPreviews",
    platforms: [
       .macOS(.v13)
    ],
    products: [
        .library(
          name: "ProductPreviewModel",
          targets: ["ProductPreviewModel"]
        )
      ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "3.0.0")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: ["ProductPreviewModel"]
        ),
        .target(name: "ProductPreviewModel"),
        .target(
            name: "OpenFoodFactsModels",
            dependencies: [
                "Core",
                "ProductPreviewModel"
            ]
        ),
        .testTarget(
            name: "OpenFoodFactsModelsTests",
            dependencies: ["OpenFoodFactsModels"],
            resources: [.process("Resources")]
        ),
        .target(
            name: "NutritionPrivacyModels",
            dependencies: [
                "Core",
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        ),
        .executableTarget(
            name: "ProductPreviews",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
                .target(name: "OpenFoodFactsModels"),
                .target(name: "NutritionPrivacyModels"),
                .target(name: "Core")
            ]
        ),
    ]
)
