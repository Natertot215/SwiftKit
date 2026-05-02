---
url: https://developer.apple.com/documentation/appkit/nstextlinefragment
framework: AppKit
category: TextKit
title: NSTextLineFragment
kind: class
captured: 2026-05-02
---

# NSTextLineFragment

A class that represents a line fragment as a single textual layout and rendering unit inside a text layout fragment.

## Declaration

```swift
class NSTextLineFragment
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 12.0

## Topics

### Creating line fragments

- `init(attributedString:range:)`
- `init(coder:)`
- `init(string:attributes:range:)`

### Line fragment characteristics

- `attributedString`
- `characterRange`
- `glyphOrigin`
- `typographicBounds`

### Finding specific text

- `characterIndex(for:)`
- `fractionOfDistanceThroughGlyph(for:)`
- `locationForCharacter(at:)`

### Drawing

- `draw(at:in:)`

## See Also

- `Using TextKit 2 to interact with text`
- `NSTextLayoutManager`
- `NSTextContainer`
- `NSTextLayoutFragment`
- `NSTextViewportLayoutController`
- `NSTextLayoutOrientationProvider`
