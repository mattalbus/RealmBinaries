// swift-tools-version:6.2

import PackageDescription

let realmVersion = "20.0.5"
let sofiaVersion = "2005.1.0"

let realmChecksumXcode26 = "68efc28f152d5bc3a7a7e4d25d81035a4d85800d9e2a6fa728649b7c764847da"
let realmSwiftChecksumXcode26 = "a98ab99d0eaddfdd151e0354ed07737cd2adfa72a6ed33946521aebe55e4a818"
let realmChecksumXcode27 = "41b894cec8ef1e4e72d283bf4e78b4cfed7a429fc8984297bf8d34a8046d2253"
let realmSwiftChecksumXcode27 = "3429ad6c3612fc39b19e6a2ac0373c069d838d5b7edcfa52d5891d0b630b4ddc"

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
