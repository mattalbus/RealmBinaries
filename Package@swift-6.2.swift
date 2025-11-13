// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.3"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "4ca80fc197758641c191013a189b911bae759fde2abf36729824291c65f3600a"

    // Xcode 26.1
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "e70e952335faa3283880b3e0c26b1ed45f3de9b31b8f6ff7ec8a9b4086bd091f"
    
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
