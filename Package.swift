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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/regulaforensics/DocumentReaderMRZRFID-Swift-Package", from: "8.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "AMARFIDReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMARFIDReadRegula/AMARFIDReadRegula-1.0.0.zip",
            checksum: "1854b2db4e5bbb2ad80b7dcd618e052aff16b482af5022e28365ae0523db7ae8"
        ),
        .target(
            name: "AMARFIDReadRegulaWrapper",
            dependencies: [
                .target(name: "AMARFIDReadRegula"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "MRZRFID", package: "DocumentReaderMRZRFID-Swift-Package"),
            ],
            path: "Sources",
            sources: ["AMARFIDReadRegula.swift"]
        )
    ]
)
