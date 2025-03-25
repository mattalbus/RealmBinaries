// swift-tools-version:5.10

import PackageDescription

let realmVersion = "10.54.3"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "038388b2f5a9e440b6fe173ac5951f9370edc3c039268856325ca8c41115430b"

#if swift(>=6.1)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@16.3.spm.zip"
    let realmSwiftChecksum = "cc0c4b32cdec945593b53bd1c80770ec2b4dbe4385efbb864e9dd0691deb4fc5"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@16.1.spm.zip"
    let realmSwiftChecksum = "41e068d62364282962472c7e93aa936de1da88b8faaf8a81b97700d5e8a499d2"
#endif
    
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
