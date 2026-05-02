---
url: https://developer.apple.com/documentation/swiftui/toolbarcustomizationbehavior
framework: SwiftUI
category: Toolbars
title: ToolbarCustomizationBehavior
kind: struct
captured: 2026-05-02
---

# ToolbarCustomizationBehavior

The customization behavior of customizable toolbar content.

## Declaration

```swift
struct ToolbarCustomizationBehavior
```

### Overview

Customizable toolbar content support different types of customization behaviors. For example, some customizable content may not be removed by the user. Some content may be placed in a toolbar that supports customization overall, but not for that particular content.

Use this type in conjunction with the `CustomizableToolbarContent/customizationBehavior(_:)` modifier.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting customization behaviors

- `default`
- `disabled`
- `reorderable`

## See Also

- `toolbar(id:content:)`
- `CustomizableToolbarContent`
- `ToolbarCustomizationOptions`
- `SearchToolbarBehavior`
