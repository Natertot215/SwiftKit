---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/buttonsizing
framework: SwiftUI
category: Environment values
title: buttonSizing
kind: property
captured: 2026-05-02
---

# buttonSizing

The preferred sizing behavior of buttons in the view hierarchy.

## Declaration

```swift
var buttonSizing: ButtonSizing { get }
```

### Discussion

Views may use the specified button sizing when determining the size they choose to be in their primary axis within their parent view’s proposed size.

Use `View/buttonSizing(_:)` to set the preferred sizing behavior in the environment. Many built-in controls that display as a button adapt to this environment value. You can read the environment value in your own views and styles as well to adapt to the preferred sizing.

```swift
struct CustomButtonStyle: ButtonStyle {
    @Environment(\.buttonSizing) private var buttonSizing

    private var maxWidth: CGFloat {
        switch buttonSizing {
        case .flexible: .infinity
        case .fitted, _: nil
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: maxWidth)
            .background(.tint, in: Capsule())
    }
}
```







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0
