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
            targets: ["AMARFIDReadRegula"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", exact: "5.1.1"),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "8.3.0"),
        .package(url: "https://github.com/regulaforensics/DocumentReaderMRZRFID-Swift-Package", from: "8.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "AMARFIDReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMARFIDReadRegula/AMARFIDReadRegula-1.0.0-rc01.zip",
            checksum: "a565d246d07beb2c37ce4f5d7c5a3496624a490a9fed8c3ea907ebd330590e3f"
        )
    ]
)
