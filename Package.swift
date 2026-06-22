// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AMADocRFIDReadRegula",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMADocRFIDReadRegula",
            targets: ["AMADocRFIDReadRegulaWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/regulaforensics/DocumentReaderMRZRFID-Swift-Package", from: "8.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocRFIDReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRFIDReadRegula/AMADocRFIDReadRegula-1.0.0.zip",
            checksum: "PLACEHOLDER_CHECKSUM"
        ),
        .target(
            name: "AMADocRFIDReadRegulaWrapper",
            dependencies: [
                .target(name: "AMADocRFIDReadRegula"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "MRZRFID", package: "DocumentReaderMRZRFID-Swift-Package"),
            ],
            path: "Sources",
            sources: ["AMADocRFIDReadRegula.swift"]
        )
    ]
)
