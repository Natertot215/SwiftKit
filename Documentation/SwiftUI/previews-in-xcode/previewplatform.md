---
url: https://developer.apple.com/documentation/swiftui/previewplatform
framework: SwiftUI
category: Previews in Xcode
title: PreviewPlatform
kind: enum
captured: 2026-05-02
---

# PreviewPlatform

Platforms that can run the preview.

## Declaration

```swift
enum PreviewPlatform
```

### Overview

Xcode infers the platform for a preview based on the currently selected target. If you have a multiplatform target and want to suggest a particular target for a preview, implement the `PreviewProvider/platform` computed property as a hint, and specify one of the preview platforms:

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }

    static var platform: PreviewPlatform? {
        PreviewPlatform.tvOS
    }
}
```





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting an operating system

- `PreviewPlatform.iOS`
- `PreviewPlatform.macOS`
- `PreviewPlatform.tvOS`
- `PreviewPlatform.watchOS`

## See Also

- `Previewable()`
- `PreviewProvider`
- `previewDisplayName(_:)`
- `PreviewModifier`
- `PreviewModifierContent`
