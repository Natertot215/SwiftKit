---
url: https://developer.apple.com/documentation/swiftui/dismissbehavior
framework: SwiftUI
category: Windows
title: DismissBehavior
kind: struct
captured: 2026-05-02
---

# DismissBehavior

Programmatic window dismissal behaviors.

## Declaration

```swift
struct DismissBehavior
```

### Overview

Use values of this type to control window dismissal during the current transaction.

For example, to dismiss windows showing a modal presentation that would otherwise prohibit dismissal, use the `DismissBehavior/destructive` behavior:

```swift
struct DismissWindowButton: View {
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        Button("Close Auxiliary Window") {
            withTransaction(\.dismissBehavior, .destructive) {
                dismissWindow(id: "auxiliary")
            }
        }
    }
}
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Getting behaviors

- `destructive`
- `interactive`

## See Also

- `dismissWindow`
- `DismissWindowAction`
- `dismiss`
- `DismissAction`
