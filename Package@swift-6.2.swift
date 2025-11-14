// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.3"
let sofiaVersion = "2003.1"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/Realm.spm.zip"
    let realmChecksum = "ae406c71d00796e5a1855b546dd1281724883d391089e9c59068a084b88af212"

    // Xcode 26.1
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/RealmSwift.spm.zip"
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
