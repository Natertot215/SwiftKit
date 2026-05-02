---
url: https://developer.apple.com/documentation/swiftui/sectionconfiguration
framework: SwiftUI
category: View groupings
title: SectionConfiguration
kind: struct
captured: 2026-05-02
---

# SectionConfiguration

Specifies the contents of a section.

## Declaration

```swift
struct SectionConfiguration
```

### Overview

A `SectionConfiguration` includes the content of the section, as well as its header and footer.

A `SectionConfiguration` can represent either an explicit section, or groups of sibling views that are not explicitly wrapped in a section.

Notably, the `header`, `footer` and `content` properties of a `SectionConfiguration` are all `SubviewsCollection`s as they can be made up of multiple subviews. That means in most cases, the subviews collection should be treated as a collection (either indexed into, or used with a `ForEach`), or the subviews collection should be wrapped in a container view, like a layout, or other custom container:

```swift
PinboardSectionsLayout {
    ForEach(sections: content) { section in
        VStack {
            HStack { section.header }
            section.content
            HStack { section.footer }
        }
    }
}
```

Here, we want to create one view for `PinboardSectionsLayout` to place per section in content. To do that, we surround the `ForEach` body in another container, a `VStack` layout, ensuring the different subviews of section.content are treated as a single view by the surrounding layout. Additionally, surrounding the header and footer in an `HStack` layout avoids vertically stacking subviews of the header and footer which we want visually grouped together.





## Relationships

**Conforms To**: `Identifiable`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Structures

- `SectionConfiguration.Actions`
- `SectionConfiguration.ID`

### Instance Properties

- `actions`
- `containerValues`
- `content`
- `footer`
- `header`
- `id`

## See Also

- `Section`
- `SectionCollection`
