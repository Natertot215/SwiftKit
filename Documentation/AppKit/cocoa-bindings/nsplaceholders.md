---
url: https://developer.apple.com/documentation/appkit/nsplaceholders
framework: AppKit
category: Cocoa bindings
title: NSPlaceholders
kind: collectionGroup
captured: 2026-05-02
---

# NSPlaceholders

A set of methods that an object can implement to register default placeholders to be displayed for a binding, when no other placeholder is specified.



### Overview

Individual placeholder values can be specified for each of the marker objects (described in `selection-markers`), as well as when the property is `nil`.

Placeholders are used when a property of an instance of the receiving class is accessed through a key value coding compliant method, and returns `nil` or a specialized marker.









## Topics

### Managing default placeholders

- `setDefaultPlaceholder(_:for:with:)`
- `defaultPlaceholder(for:with:)`

### Constants

- `Selection Markers`

## See Also

- `NSBindingSelectionMarker`
