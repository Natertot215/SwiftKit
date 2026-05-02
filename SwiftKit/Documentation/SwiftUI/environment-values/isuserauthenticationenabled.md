---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/isuserauthenticationenabled
framework: SwiftUI
category: Environment values
title: isUserAuthenticationEnabled
kind: property
captured: 2026-05-02
---

# isUserAuthenticationEnabled

The current system user authentication enablement status.

## Declaration

```swift
var isUserAuthenticationEnabled: Bool { get }
```

### Discussion

Use this value to determine whether the system will issue additional device-owner authentication challenges before revealing this piece of user interface from under a system-installed shield.

Your app can respond to changes in this value to take appropriate action, like installing or uninstalling a bespoke UI shield for sensitive content.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0
