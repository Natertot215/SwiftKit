---
url: https://developer.apple.com/documentation/swiftui/font
framework: SwiftUI
category: Text input and output
title: Font
kind: struct
captured: 2026-05-02
---

# Font

An environment-dependent font.

## Declaration

```swift
@frozen struct Font
```

### Overview

The system resolves a font’s value at the time it uses the font in a given environment because `Font` is a late-binding token.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting standard fonts

- `extraLargeTitle2`
- `extraLargeTitle`
- `largeTitle`
- `title`
- `title2`
- `title3`
- `headline`
- `subheadline`
- `body`
- `callout`
- `caption`
- `caption2`
- `footnote`

### Getting system fonts

- `system(_:design:weight:)`
- `system(size:weight:design:)`
- `Font.Design`
- `Font.TextStyle`
- `Font.Weight`

### Creating custom fonts

- `custom(_:fixedSize:)`
- `custom(_:size:relativeTo:)`
- `custom(_:size:)`

### Getting a font from another font

- `init(_:)`

### Styling a font

- `bold()`
- `italic()`
- `monospaced()`
- `monospacedDigit()`
- `smallCaps()`
- `lowercaseSmallCaps()`
- `uppercaseSmallCaps()`
- `weight(_:)`
- `width(_:)`
- `Font.Width`
- `leading(_:)`
- `Font.Leading`

### Deprecated symbols

- `system(_:design:)`
- `system(size:weight:design:)`

### Structures

- `Font.Context`
- `Font.Resolved`

### Instance Methods

- `bold(_:)`
- `italic(_:)`
- `lowercaseSmallCaps(_:)`
- `monospaced(_:)`
- `pointSize(_:)`
- `resolve(in:)`
- `scaled(by:)`
- `smallCaps(_:)`
- `uppercaseSmallCaps(_:)`

### Type Properties

- `default`

### Type Methods

- `system(size:weight:design:)`

## See Also

- `Applying custom fonts to text`
- `font(_:)`
- `fontDesign(_:)`
- `fontWeight(_:)`
- `fontWidth(_:)`
- `font`
