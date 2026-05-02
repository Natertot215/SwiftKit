---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/unignoredchildren(from:)
framework: AppKit
category: Accessibility for AppKit
title: unignoredChildren(from:)
kind: method
captured: 2026-05-02
---

# unignoredChildren(from:)

Returns a list of unignored accessibility objects, descending the hierarchy, if necessary.

## Declaration

```swift
static func unignoredChildren(from originalChildren: [Any]) -> [Any]
```

### Discussion

This function first tests whether `originalChildren` contains any ignored objects. If the array contains no ignored objects, the function returns `originalChildren`. If the array contains ignored objects, this function returns a new array that contains the contents of `originalChildren`, but with each ignored object replaced by its unignored descendant.







## Availability

- macOS ?



## See Also

- `unignoredAncestor(of:)`
- `unignoredChildrenForOnlyChild(from:)`
- `unignoredDescendant(of:)`
