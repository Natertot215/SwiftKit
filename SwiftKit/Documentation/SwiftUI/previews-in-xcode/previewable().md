---
url: https://developer.apple.com/documentation/swiftui/previewable()
framework: SwiftUI
category: Previews in Xcode
title: Previewable()
kind: macro
captured: 2026-05-02
---

# Previewable()

Tag allowing a dynamic property to appear inline in a preview.

## Declaration

```swift
@attached(peer) macro Previewable()
```

### Overview

Tagging a variable declaration at root scope in your `#Preview` body with ‘@Previewable’ allows you to use dynamic properties inline in previews. The `#Preview` macro will generate an embedded SwiftUI view; tagged declarations become properties on the view, and all remaining statements form the view’s body.

```swift
#Preview("toggle") {
    @Previewable @State var toggled = true
    return Toggle("Loud Noises", isOn: $toggled)
}
```

It is an error to use `@Previewable` outside of a `#Preview` body closure.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `PreviewProvider`
- `PreviewPlatform`
- `previewDisplayName(_:)`
- `PreviewModifier`
- `PreviewModifierContent`
