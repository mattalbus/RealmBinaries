# RealmBinaries
Vends Realm xcframeworks via SPM to save build time

## How to

Launch the [workflow](https://github.com/mattalbus/RealmBinaries/actions/workflows/manual.yml) and specify:
  - the realm version (ex: 20.0.4)
  - the xcode version (ex: 26.4): ⚠️ [action runners](https://github.com/actions/runner-images/releases) are often updated several days after official Apple release
  - the sofia version (ex: 2004.0.5): the 1st part must match the realm version

The action should have updated `Package.swift` with expected checksums & versions and created a new release to be used with SPM.
