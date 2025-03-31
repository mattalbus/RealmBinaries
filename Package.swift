// swift-tools-version:5.10

import PackageDescription

let realmVersion = "10.54.3"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "038388b2f5a9e440b6fe173ac5951f9370edc3c039268856325ca8c41115430b"

    // built for Xcode 16.3
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "5d7a5ef8ac16158fed873af6db143c4f3242d0a89dc8976b0f390dd11bc98799"
    
    return [
        .binaryTarget(
            name: "Realm",
            url: realmUrl,
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: realmSwiftUrl,
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("15.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
