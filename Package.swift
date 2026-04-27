// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.4"
let sofiaVersion = "2004.0.3"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/Realm.spm.zip"
    let realmChecksum = "676ae3366d9e368a51d930a271d3dfeaac7ac29ba13b3cad412912d49bbb9282"

    // Xcode 26.4.1
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "8b541cf836505a6cfdeb9ed51b1aa7715249f6f0b455db4d33144e770e3916b3"
    
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
