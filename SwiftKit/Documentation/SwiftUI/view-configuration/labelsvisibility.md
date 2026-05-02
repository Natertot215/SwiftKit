---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/labelsvisibility
framework: SwiftUI
category: View configuration
title: labelsVisibility
kind: property
captured: 2026-05-02
---

# labelsVisibility

The labels visibility set by `View/labelsVisibility(_:)`.

## Declaration

```swift
var labelsVisibility: Visibility { get set }
```

### Discussion

Read this environment value from within a view to obtain the preferred visibility for labels within the hierarchy. If you would like to dynamically hide the label of your custom view, make sure to include an accessibility label via the `View/accessibilityLabel(content:)` modifier as illustrated below:

```swift
@Environment(\.labelsVisibility)
private var labelsVisibility

var body: some View {
    VStack {
        QuizCardView()
        if labelsVisibility != .hidden {
            label
        }
    }
    .accessibilityLabel {
        label
    }
}

private var label: some View {
    Text("Quiz Card")
}
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `labelsHidden()`
- `labelsVisibility(_:)`
- `menuIndicator(_:)`
- `statusBarHidden(_:)`
- `persistentSystemOverlays(_:)`
- `Visibility`
