---
url: https://developer.apple.com/documentation/swiftui/customizabletoolbarcontent
framework: SwiftUI
category: Toolbars
title: CustomizableToolbarContent
kind: protocol
captured: 2026-05-02
---

# CustomizableToolbarContent

Conforming types represent items that can be placed in various locations in a customizable toolbar.

## Declaration

```swift
protocol CustomizableToolbarContent : ToolbarContent where Self.Body : CustomizableToolbarContent
```







## Relationships

**Inherits From**: `ToolbarContent`

**Conforming Types**: `Group`, `ToolbarItem`, `ToolbarSpacer`, `ToolbarTitleMenu`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Using default options

- `defaultCustomization()`
- `defaultCustomization(_:options:)`

### Customizing the behavior

- `customizationBehavior(_:)`

### Instance Methods

- `hidden(_:)`
- `matchedTransitionSource(id:in:)`
- `sharedBackgroundVisibility(_:)`

## See Also

- `toolbar(id:content:)`
- `ToolbarCustomizationBehavior`
- `ToolbarCustomizationOptions`
- `SearchToolbarBehavior`
