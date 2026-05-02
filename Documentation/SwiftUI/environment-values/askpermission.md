---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/askpermission
framework: SwiftUI
category: Environment values
title: askPermission
kind: property
captured: 2026-05-02
---

# askPermission

An action that sends a permission question to a parent or guardian.

## Declaration

```swift
var askPermission: AskPermissionAction { get }
```

### Discussion

Use this environment value to get an `AskPermissionAction` instance for the current `Environment`. Then call the instance to send a permission question. You call the instance directly because it defines a `AskPermissionAction/callAsFunction(_:)` method that Swift calls when you call the instance directly.







## Availability

- iOS 26.5 (beta)
- iPadOS 26.5 (beta)
- Mac Catalyst 26.5 (beta)
- macOS 26.5 (beta)
- visionOS 26.5 (beta)
