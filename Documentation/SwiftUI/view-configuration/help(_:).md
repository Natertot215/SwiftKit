---
url: https://developer.apple.com/documentation/swiftui/view/help(_:)
framework: SwiftUI
category: View configuration
title: help(_:)
kind: method
captured: 2026-05-02
---

# help(_:)

Adds help text to a view using a text view that you provide.

## Declaration

```swift
nonisolated func help(_ text: Text) -> some View

```

### Discussion

Adding help to a view configures the view’s accessibility hint and its help tag (also called a *tooltip*tooltip) in macOS or visionOS. For more information on using help tags, see `doc://com.apple.documentation/design/Human-Interface-Guidelines/offering-help` in the Human Interface Guidelines.

```swift
Slider("Opacity", value: $selectedShape.opacity)
    .help(Text("Adjust the opacity of the selected \(selectedShape.name)"))
```

## Parameters

- **text**: The `Text` view to use as help.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0
