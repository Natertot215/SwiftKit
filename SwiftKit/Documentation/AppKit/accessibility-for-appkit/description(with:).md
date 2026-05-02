---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/role/description(with:)
framework: AppKit
category: Accessibility for AppKit
title: description(with:)
kind: method
captured: 2026-05-02
---

# description(with:)

Returns a standard description for a role and subrole.

## Declaration

```swift
func description(with subrole: NSAccessibility.Subrole?) -> String?
```

### Discussion

You should pass `nil` to this function if there is no subrole. This function returns a description of a standard role. For example, if you implement a button widget that does not inherit from `NSButton`, you should use this function to return a localized role description matching that returned by a standard button.







## Availability

- macOS ?



## See Also

- `description(for:)`
