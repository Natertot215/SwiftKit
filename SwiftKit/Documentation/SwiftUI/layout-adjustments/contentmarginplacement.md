---
url: https://developer.apple.com/documentation/swiftui/contentmarginplacement
framework: SwiftUI
category: Layout adjustments
title: ContentMarginPlacement
kind: struct
captured: 2026-05-02
---

# ContentMarginPlacement

The placement of margins.

## Declaration

```swift
struct ContentMarginPlacement
```

### Overview

Different views can support customizating margins that appear in different parts of that view. Use values of this type to customize those margins of a particular placement.

For example, use a `ContentMarginPlacement/scrollIndicators` placement to customize the margins of scrollable view’s scroll indicators separately from the margins of a scrollable view’s content.

Use this type with the `View/contentMargins(_:for:)` modifier.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting the placement

- `automatic`
- `scrollContent`
- `scrollIndicators`

## See Also

- `contentMargins(_:for:)`
- `contentMargins(_:_:for:)`
