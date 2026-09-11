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
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "6.0.1")),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.4")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "9.5.6487"),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "9.5.18270"),
    ],
    targets: [
        .binaryTarget(
            name: "AMARFIDReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMARFIDReadRegula/AMARFIDReadRegula-1.1.1.zip",
            checksum: "1ec5b1c9ecbdd55d5f0d62bc81c1582d1c3c4995e3bc622f62908c3b7ded1859"
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
