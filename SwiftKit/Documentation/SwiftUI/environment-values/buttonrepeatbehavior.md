---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/buttonrepeatbehavior
framework: SwiftUI
category: Environment values
title: buttonRepeatBehavior
kind: property
captured: 2026-05-02
---

# buttonRepeatBehavior

Whether buttons with this associated environment should repeatedly trigger their actions on prolonged interactions.

## Declaration

```swift
var buttonRepeatBehavior: ButtonRepeatBehavior { get }
```

### Discussion

A value of `enabled` means that buttons will be able to repeatedly trigger their action, and `disabled` means they should not. A value of `automatic` means that buttons will defer to default behavior.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `Button`
- `buttonStyle(_:)`
- `buttonBorderShape(_:)`
- `buttonRepeatBehavior(_:)`
- `ButtonBorderShape`
- `ButtonRole`
- `ButtonRepeatBehavior`
- `ButtonSizing`
