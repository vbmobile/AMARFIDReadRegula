// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AMARFIDReadRegula",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMARFIDReadRegula",
            targets: ["AMARFIDReadRegulaWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModel", .upToNextMinor(from: "3.1.0")),
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "7.0.4")),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.8")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "9.5.6487"),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "9.5.18270"),
    ],
    targets: [
        .binaryTarget(
            name: "AMARFIDReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMARFIDReadRegula/AMARFIDReadRegula-1.2.2.zip",
            checksum: "ae682af0dc567b4b61c5997b86e69b3f66cf2c93e467899efa4787e74fa2c768"
        ),
        .target(
            name: "AMARFIDReadRegulaWrapper",
            dependencies: [
                .target(name: "AMARFIDReadRegula"),
                .product(name: "AMADocModel", package: "AMADocModel"),
                .product(name: "AMANetworkClient", package: "AMANetworkClient"),
                .product(name: "AMAUtils", package: "AMAUtils"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
                .product(name: "OCRRFID", package: "DocumentReaderOCRRFID-Swift-Package")
            ],
            path: "Sources",
            sources: ["AMARFIDReadRegula.swift"]
        )
    ]
)
