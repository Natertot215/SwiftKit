---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/parameterizedattribute
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibility.ParameterizedAttribute
kind: struct
captured: 2026-05-01
---

# NSAccessibility.ParameterizedAttribute

## Declaration

```swift
struct ParameterizedAttribute
```

## Abstract

Values that describe parameterized attributes.

## Overview

`ParameterizedAttribute` is a structure that defines constants for parameterized accessibility attributes in AppKit. These attributes allow you to query information about accessibility elements by passing parameters.

## Attribute Names

- **`attributedStringForRange`** - Does not use attributes from Appkit/AttributedString.h (`NSAttributedString`).
- **`boundsForRange`** - The rectangle (`NSValue` containing an `NSRect` value) enclosing the specified range of characters.
- **`cellForColumnAndRow`** - The cell at the specified row and column. *(Deprecated)*
- **`indexForChildUIElementAttribute`** - Index for child UI element attribute.
- **`indexForChildUIElementInNavigationOrderAttribute`** - Index for child UI element in navigation order attribute.
- **`layoutPointForScreenPoint`** - The point in the layout area corresponding to the specified point on the screen. *(Deprecated)*
- **`layoutSizeForScreenSize`** - The size of the layout area in points corresponding to the specified screen size.
- **`lineForIndex`** - The line number of the specified character. *(Deprecated)*
- **`rangeForIndex`** - The full range of characters composing a single glyph.
- **`rangeForLine`** - The range of characters corresponding to the specified line number.
- **`rangeForPosition`** - The range of characters composing the glyph at the specified point.
- **`resultsForSearchPredicateParameterizedAttribute`** - Results for search predicate parameterized attribute.
- **`rtfForRange`** - The RTF data describing the specified range of characters.
- **`screenPointForLayoutPoint`** - The screen point corresponding to the specified point in the layout area.
- **`screenSizeForLayoutSize`** - The size of the screen in points corresponding to the specified size of the layout area.
- **`stringForRange`** - The substring specified by the range.
- **`styleRangeForIndex`** - The full range of characters with the same style as the specified character.
- **`uiElementsForSearchPredicateParameterizedAttribute`** - UI elements for search predicate parameterized attribute.

## Initializers

- **`init(rawValue:)`** - Creates a new instance with the specified raw string value.

## Conformance

`ParameterizedAttribute` conforms to:
- `Equatable`
- `Hashable`
- `RawRepresentable`
- `Sendable`

## Availability

**macOS** 10.0 and later

## See Also

- `NSAccessibility.Action`
- `NSAccessibility.Attribute`
- `NSAccessibility.Role`
- `NSAccessibility.Subrole`
