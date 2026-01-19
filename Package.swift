// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.3"
let sofiaVersion = "2003.0.7"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/Realm.spm.zip"
    let realmChecksum = "dce035bc211b3706d2a29f6f10bb51cc7026e9a727cc518fc5d2ba03826234d9"

    // Xcode 26.2
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "01a14ac029bd475173fad4beb00637abc3956f844ab981e6dad00a981f3ea1c9"
    
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
