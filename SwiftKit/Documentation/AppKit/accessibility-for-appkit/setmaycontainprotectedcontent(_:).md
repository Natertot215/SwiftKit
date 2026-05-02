---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/setmaycontainprotectedcontent(_:)
framework: AppKit
category: Accessibility for AppKit
title: setMayContainProtectedContent(_:)
kind: method
captured: 2026-05-02
---

# setMayContainProtectedContent(_:)

Sets whether the app may have protected content.

## Declaration

```swift
static func setMayContainProtectedContent(_ flag: Bool) -> Bool
```

### Discussion

Uses the value of `flag` to specify whether the app may have protected content. Protected content is identified by a value of `true` for `NSAccessibilityContainsProtectedContentAttribute`, but if `NSAccessibilitySetMayContainProtectedContent` returns `false`, the value of `NSAccessibilityContainsProtectedContentAttribute` is ignored. This function returns `true` on success.







## Availability

- macOS ?
