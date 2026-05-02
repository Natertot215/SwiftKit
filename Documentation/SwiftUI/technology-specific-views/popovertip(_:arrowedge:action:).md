---
url: https://developer.apple.com/documentation/swiftui/view/popovertip(_:arrowedge:action:)
framework: SwiftUI
category: Technology-specific views
title: popoverTip(_:arrowEdge:action:)
kind: method
captured: 2026-05-02
---

# popoverTip(_:arrowEdge:action:)

Presents a popover tip on the modified view.

## Declaration

```swift
@preconcurrency nonisolated func popoverTip(_ tip: (any Tip)?, arrowEdge: Edge? = nil, action: @escaping @MainActor @Sendable (Tips.Action) -> Void = { _ in }) -> some View

```

#### Discussion

Use this modifier to present a tip as a popover on an existing view when the tip becomes eligible for display.

```swift
import SwiftUI
import TipKit

// Define your tip's content.
struct SampleTip: Tip {
    var title: Text {
        Text("Save as a Favorite")
    }

    var message: Text? {
        Text("Your favorite backyards always appear at the top of the list.")
    }

    var image: Image? {
        Image(systemName: "star")
    }
}

struct SampleView: View {
    // Create an instance of your tip.
    var tip = SampleTip()

    var body: some View {
        VStack {
            // Add `.popoverTip` to the view you want to modify.
            // Tips.configure(options:) must be called before your tip will be eligible for display.
            Image(systemName: "star")
                .popoverTip(tip)
        }
    }
}
```

## Parameters

- **tip**: The tip to display.
- **arrowEdge**: The edge of the attachmentAnchor that defines the location of the popover’s arrow. By default, the system will choose the best orientation of the popover’s arrow.
- **action**: The action to perform when the user triggers a tip’s button.





## Availability

- iOS 17.0
- iPadOS 13.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `tipBackground(_:)`
- `tipCornerRadius(_:antialiased:)`
- `tipImageSize(_:)`
- `tipViewStyle(_:)`
- `tipImageStyle(_:)`
- `tipImageStyle(_:_:)`
- `tipImageStyle(_:_:_:)`
