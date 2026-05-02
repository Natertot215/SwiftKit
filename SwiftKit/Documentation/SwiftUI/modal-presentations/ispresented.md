---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/ispresented
framework: SwiftUI
category: Modal presentations
title: isPresented
kind: property
captured: 2026-05-02
---

# isPresented

A Boolean value that indicates whether the view associated with this environment is currently presented.

## Declaration

```swift
var isPresented: Bool { get }
```

### Discussion

You can read this value like any of the other `EnvironmentValues` by creating a property with the `Environment` property wrapper:

```swift
@Environment(\.isPresented) private var isPresented
```

Read the value inside a view if you need to know when SwiftUI presents that view. For example, you can take an action when SwiftUI presents a view by using the `View/onChange(of:initial:_:)` modifier:

```swift
.onChange(of: isPresented) { _, isPresented in
    if isPresented {
        // Do something when first presented.
    }
}
```

This behaves differently than `View/onAppear(perform:)`, which SwiftUI can call more than once for a given presentation, like when you navigate back to a view that’s already in the navigation hierarchy.

To dismiss the currently presented view, use `EnvironmentValues/dismiss`.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `dismiss`
- `DismissAction`
- `interactiveDismissDisabled(_:)`
