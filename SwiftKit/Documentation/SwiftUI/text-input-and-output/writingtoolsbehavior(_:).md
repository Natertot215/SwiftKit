---
url: https://developer.apple.com/documentation/swiftui/view/writingtoolsbehavior(_:)
framework: SwiftUI
category: Text input and output
title: writingToolsBehavior(_:)
kind: method
captured: 2026-05-02
---

# writingToolsBehavior(_:)

Specifies the Writing Tools behavior for text and text input in the environment.

## Declaration

```swift
@MainActor @preconcurrency func writingToolsBehavior(_ behavior: WritingToolsBehavior) -> some View

```

### Return Value

A view preferring the specified Writing Tools behavior.

### Discussion

Use this view modifier to customize or disable the Writing Tools editing experience for `Text` (when selectable), `TextField`, and `TextEditor` views.

## Parameters

- **behavior**: The Writing Tools behavior for text and text input in the environment.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- visionOS 2.4



## See Also

- `WritingToolsBehavior`
