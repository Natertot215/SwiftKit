---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/unignoredancestor(of:)
framework: AppKit
category: Accessibility for AppKit
title: unignoredAncestor(of:)
kind: method
captured: 2026-05-02
---

# unignoredAncestor(of:)

Returns an unignored accessibility object, ascending the hierarchy, if necessary.

## Declaration

```swift
static func unignoredAncestor(of element: Any) -> Any?
```

### Discussion

Tests whether `element` is an ignored object, returning either `element`, if it is not ignored, or the first unignored ancestor of `element`.







## Availability

- macOS ?



## See Also

- `unignoredChildren(from:)`
- `unignoredChildrenForOnlyChild(from:)`
- `unignoredDescendant(of:)`
