---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/resetfocus
framework: SwiftUI
category: Environment values
title: resetFocus
kind: property
captured: 2026-05-02
---

# resetFocus

An action that requests the focus system to reevaluate default focus.

## Declaration

```swift
var resetFocus: ResetFocusAction { get }
```

### Discussion

Get this environment value and call and call it as a function to force a default focus reevaluation at runtime.

```swift
@Namespace var mainNamespace
@Environment(\.resetFocus) var resetFocus

var body: some View {
    // ...
    resetFocus(in: mainNamespace)
    // ...
}
```







## Availability

- macOS 12.0
- tvOS 14.0
- watchOS 7.0



## See Also

- `ResetFocusAction`
