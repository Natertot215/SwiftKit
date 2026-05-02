---
url: https://developer.apple.com/documentation/appkit/nsfontassetrequest
framework: AppKit
category: Fonts
title: NSFontAssetRequest
kind: class
captured: 2026-05-02
---

# NSFontAssetRequest


## Declaration

```swift
class NSFontAssetRequest
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `ProgressReporting`

## Availability

- macOS 10.13

## Topics

### Creating a Font Asset Request

- `init(fontDescriptors:options:)`
- `NSFontAssetRequest.Options`

### Downloading a Font Asset

- `download(withCompletionHandler:)`
- `downloadedFontDescriptors`

### Getting the Download Progress

- `progress`

## See Also

- `NSFont`
- `NSFontDescriptor`
- `NSFontTraitMask`
- `NSFontFamilyClass`
- `NSFontDescriptor.SymbolicTraits`
- `NSFontSymbolicTraits`
