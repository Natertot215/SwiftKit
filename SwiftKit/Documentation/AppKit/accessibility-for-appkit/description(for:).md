---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/role/description(for:)
framework: AppKit
category: Accessibility for AppKit
title: description(for:)
kind: method
captured: 2026-05-02
---

# description(for:)

Returns a standard role description for a user interface element.

## Declaration

```swift
static func description(for element: Any) -> String?
```

### Discussion

This function is like the `NSAccessibility-swift.struct/Role/description(with:)` function, except that it queries `element` to get the role and subrole. The `NSAccessibility-swift.struct/Role/description(with:)` function is more efficient, but this function is useful for accessorizing base classes so that they properly handle derived classes, which may override the subrole or even the role.







## Availability

- macOS ?



## See Also

- `description(with:)`
