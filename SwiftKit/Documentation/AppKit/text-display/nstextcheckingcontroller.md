---
url: https://developer.apple.com/documentation/appkit/nstextcheckingcontroller
framework: AppKit
category: Text display
title: NSTextCheckingController
kind: class
captured: 2026-05-02
---

# NSTextCheckingController


## Declaration

```swift
class NSTextCheckingController
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.15

## Topics

### Initializers

- `init(client:)`

### Instance Properties

- `client`
- `spellCheckerDocumentTag`

### Instance Methods

- `changeSpelling(_:)`
- `checkSpelling(_:)`
- `checkText(in:types:options:)`
- `checkTextInDocument(_:)`
- `checkTextInSelection(_:)`
- `considerTextChecking(for:)`
- `didChangeSelectedRange()`
- `didChangeText(in:)`
- `ignoreSpelling(_:)`
- `insertedText(in:)`
- `invalidate()`
- `menu(at:clickedOnSelection:effectiveRange:)`
- `orderFrontSubstitutionsPanel(_:)`
- `showGuessPanel(_:)`
- `updateCandidates()`
- `validAnnotations()`

## See Also

- `NSTextCheckingClient`
- `NSTextInputTraits`
- `NSTextInputTraitType`
