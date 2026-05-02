---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/unignoreddescendant(of:)
framework: AppKit
category: Accessibility for AppKit
title: unignoredDescendant(of:)
kind: method
captured: 2026-05-02
---

# unignoredDescendant(of:)

Returns an unignored accessibility object, descending the hierarchy, if necessary.

## Declaration

```swift
static func unignoredDescendant(of element: Any) -> Any?
```

### Discussion

Tests whether `element` is an ignored object, returning either `element`, if it is not ignored, or the first unignored descendant of `element`. Use this function only if you know there is a linear, one-to-one, hierarchy below `element`. Otherwise, if `element` has either no unignored children or multiple unignored children, this function fails and returns `nil`.







## Availability

- macOS ?



## See Also

- `unignoredAncestor(of:)`
- `unignoredChildren(from:)`
- `unignoredChildrenForOnlyChild(from:)`
