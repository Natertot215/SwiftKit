---
url: https://developer.apple.com/documentation/appkit/nstextcontentmanager
framework: AppKit
category: TextKit
title: NSTextContentManager
kind: class
captured: 2026-05-02
---

# NSTextContentManager

An abstract class that defines the interface and a default implementation for managing the text document contents.

## Declaration

```swift
class NSTextContentManager
```







## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSTextContentStorage`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `NSTextElementProvider`

## Availability

- macOS 12.0

## Topics

### Creating a content manager

- `init()`
- `init(coder:)`

### Controlling backing store synchronization

- `automaticallySynchronizesToBackingStore`

### Performing transactions

- `hasEditingTransaction`
- `performEditingTransaction(_:)`
- `recordEditAction(in:newTextRange:)`

### Working with layout managers

- `primaryTextLayoutManager`
- `textLayoutManagers`
- `automaticallySynchronizesTextLayoutManagers`
- `addTextLayoutManager(_:)`
- `removeTextLayoutManager(_:)`
- `synchronizeTextLayoutManagers(_:)`

### Customizing and validating text elements

- `delegate`
- `NSTextContentManagerDelegate`
- `NSTextContentManager.EnumerationOptions`

### Finding a specific text element

- `textElements(for:)`

## See Also

- `NSTextContentStorage`
- `NSAttributedString`
- `NSMutableAttributedString`
