# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Test Commands

```bash
# Build
swift build

# Clean build artifacts
swift package clean

# Run all tests
swift test

# Run a single test
swift test --filter MD5DigestTests/testEmptyData

# Regenerate Linux test manifest (after adding/removing tests)
swift test --generate-linuxmain

# Xcode — iOS simulator
xcodebuild clean test \
  -destination "platform=iOS Simulator,OS=13.3,name=iPhone 11" \
  -scheme SwiftDigest-Travis | xcpretty -c

# Xcode — macOS
xcodebuild clean test \
  -destination "platform=macOS" \
  -scheme SwiftDigest-Travis-macOS | xcpretty -c
```

## Architecture

Single-file library (`Sources/SwiftDigest/MD5Digest.swift`) with three layers:

1. **Public API** — `Sequence<UInt8>` extension exposing `.md5` computed property on any byte sequence (e.g. `Data`, `String.UTF8View`).

2. **`MD5Digest`** — Immutable 16-byte value type representing the result. Conforms to `Hashable`, `RawRepresentable` (hex string), `LosslessStringConvertible`, and `Codable`.

3. **`MD5State`** (fileprivate) — Core MD5 implementation. Processes 64-byte chunks through four rounds using the standard MD5 functions (`f0`–`f3`). Assumes little-endian and asserts this on init.

Not optimized for large data; the README recommends CommonCrypto for inputs beyond a few KB.

## Constraints

- **Never edit `*.xcodeproj` or `project.pbxproj` files.** Use Xcode directly for any project configuration changes.

## Linux Support

After modifying test files, run `swift test --generate-linuxmain` to update `Tests/SwiftDigestTests/XCTestManifests.swift` and `Tests/LinuxMain.swift`, otherwise Linux CI will miss new tests.
