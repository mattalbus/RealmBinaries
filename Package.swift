// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.4"
let sofiaVersion = "2004.0.2"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/Realm.spm.zip"
    let realmChecksum = "32d4878102cb3a5510078141b85f74dd2893fc33733a14cf9b2f429502006373"

    // Xcode 26.4
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "38384ac031f547b52d49f29e74e52c13fabd442e7e5a6c216f1fb5c4a9492bfc"
    
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
