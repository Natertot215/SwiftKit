---
url: https://developer.apple.com/documentation/swiftui/section
framework: SwiftUI
category: View groupings
title: Section
kind: struct
captured: 2026-05-02
---

# Section

A container view that you can use to add hierarchy within certain views.

## Declaration

```swift
struct Section<Parent, Content, Footer>
```

### Overview

Use `Section` instances in views like `List`, `Picker`, and `Form` to organize content into separate sections. Each section has custom content that you provide on a per-instance basis. You can also provide headers and footers for each section.

#### Collapsible sections

Create sections that expand and collapse by using an initializer that accepts an `isExpanded` binding. A collapsible section in a `List` that uses the `ListStyle/sidebar` style shows a disclosure indicator next to the section’s header. Tapping on the disclosure indicator toggles the appearance of the section’s content.

> **NOTE:** Not all contexts provide a default control to trigger collapse or expansion.





## Relationships

**Conforms To**: `Copyable`, `Escapable`, `TableRowContent`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a section

- `init(content:)`
- `init(_:content:)`

### Adding headers and footers

- `init(content:header:)`
- `init(content:footer:)`
- `init(content:header:footer:)`

### Controlling collapsibility

- `init(_:isExpanded:content:)`
- `init(isExpanded:content:header:)`

### Deprecated symbols

- `init(header:content:)`
- `init(footer:content:)`
- `init(header:footer:content:)`
- `collapsible(_:)`

## See Also

- `SectionCollection`
- `SectionConfiguration`
