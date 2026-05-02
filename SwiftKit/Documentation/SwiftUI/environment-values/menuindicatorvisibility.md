---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/menuindicatorvisibility
framework: SwiftUI
category: Environment values
title: menuIndicatorVisibility
kind: property
captured: 2026-05-02
---

# menuIndicatorVisibility

The menu indicator visibility to apply to controls within a view.

## Declaration

```swift
var menuIndicatorVisibility: Visibility { get set }
```

### Discussion

> **NOTE:** On tvOS, the standard button styles do not include a menu indicator, so this modifier will have no effect when using a built-in button style. You can implement an indicator in your own `ButtonStyle` implementation by checking the value of this environment value.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 17.0
- visionOS 1.0



## See Also

- `menuIndicator(_:)`
