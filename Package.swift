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
        .package(url: "https://github.com/vbmobile/AMADocModel", .upToNextMinor(from: "4.3.0")),
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "7.0.4")),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.8")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", .upToNextMinor(from: "9.9.7126")),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", .upToNextMinor(from: "9.9.21003")),
    ],
    targets: [
        .binaryTarget(
            name: "AMARFIDReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMARFIDReadRegula/AMARFIDReadRegula-2.2.0.zip",
            checksum: "460c1326a9e569c514d622e18c1efdd47a0a9cf60f8c766b313be1131a5abf13"
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
