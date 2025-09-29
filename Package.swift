// swift-tools-version:5.10

import PackageDescription

let realmVersion = "20.0.3"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "9750577a76b3c4a8149adf0f34d716807fe788bdb37431e18203258396f04fcd"

#if swift(>=6.2)
    // Xcode 26.0
    let realmSwiftUrl = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "54f2f619e19ab60991977754c55919ad8f87fe451431947a0c24f23188ae93b0"
#else
    // Xcode 16.3
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@16.3.spm.zip"
    let realmSwiftChecksum = "c041a161a976937e08f0a8a29766acc83d5e28e271b661a3dbc06e84b2e8f22e"
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
