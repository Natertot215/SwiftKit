---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/unignoredchildrenforonlychild(from:)
framework: AppKit
category: Accessibility for AppKit
title: unignoredChildrenForOnlyChild(from:)
kind: method
captured: 2026-05-02
---

# unignoredChildrenForOnlyChild(from:)

Returns a list of unignored accessibility objects, descending the hierarchy, if necessary.

## Declaration

```swift
static func unignoredChildrenForOnlyChild(from originalChild: Any) -> [Any]
```

### Discussion

Tests whether `originalChild` is an ignored object and returns an array containing either `originalChild`, if it is not ignored, or its unignored descendants.







## Availability

- macOS ?



## See Also

- `unignoredAncestor(of:)`
- `unignoredChildren(from:)`
- `unignoredDescendant(of:)`
