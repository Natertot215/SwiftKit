---
url: https://developer.apple.com/documentation/appkit/nsfontcollection
framework: AppKit
category: Fonts
title: NSFontCollection
kind: class
captured: 2026-05-02
---

# NSFontCollection

A font collection, which is a group of font descriptors taken together as a single object.

## Declaration

```swift
class NSFontCollection
```

### Overview

You can publicize the font collection as a named collection and it is presented through the System user interface such as the font panel and Font Book. The queries can be modified using the `NSMutableFontCollection` subclass.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSMutableFontCollection`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSMutableCopying`, `NSObjectProtocol`

## Availability

- macOS 10.7

## Topics

### Creating Font Collections

- `init(descriptors:)`
- `init(locale:)`
- `init(name:)`
- `init(name:visibility:)`
- `withAllAvailableDescriptors`

### Naming the Font Collection

- `rename(fromName:visibility:toName:)`
- `show(_:withName:visibility:)`
- `hide(withName:visibility:)`
- `allFontCollectionNames`
- `NSFontCollection.Name`
- `NSFontCollection.Visibility`

### Getting the Font Descriptors

- `matchingDescriptors`
- `matchingDescriptors(forFamily:)`
- `matchingDescriptors(forFamily:options:)`
- `matchingDescriptors(options:)`
- `NSFontCollectionMatchingOptionKey`
- `queryDescriptors`
- `exclusionDescriptors`

### Responding to Changes

- `didChangeNotification`
- `NSFontCollection.UserInfoKey`
- `NSFontCollection.ActionTypeKey`

### Initializers

- `init(coder:)`

## See Also

- `NSFontManager`
- `NSMutableFontCollection`
- `NSFontCollectionOptions`
