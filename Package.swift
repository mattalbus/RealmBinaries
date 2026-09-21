// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.5"
let sofiaVersion = "2005.1.0"

let realmChecksumXcode26 = "TBD"
let realmSwiftChecksumXcode26 = "TBD"
let realmChecksumXcode27 = "TBD"
let realmSwiftChecksumXcode27 = "TBD"

#if compiler(>=6.4)
let xcodeSlug = "xcode27"
let realmChecksum = realmChecksumXcode27
let realmSwiftChecksum = realmSwiftChecksumXcode27
#else
let xcodeSlug = "xcode26"
let realmChecksum = realmChecksumXcode26
let realmSwiftChecksum = realmSwiftChecksumXcode26
#endif

func buildTargets() -> [Target] {
    let base = "https://github.com/mattalbus/RealmBinaries/releases/download/\(sofiaVersion)"

    return [
        .binaryTarget(
            name: "Realm",
            url: "\(base)/Realm-\(xcodeSlug).spm.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(base)/RealmSwift-\(xcodeSlug).spm.zip",
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
