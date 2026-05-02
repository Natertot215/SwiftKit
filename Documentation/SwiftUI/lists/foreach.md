---
url: https://developer.apple.com/documentation/swiftui/foreach
framework: SwiftUI
category: Lists
title: ForEach
kind: struct
captured: 2026-05-02
---

# ForEach

A structure that computes views on demand from an underlying collection of identified data.

## Declaration

```swift
struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable
```

### Overview

Use `ForEach` to provide views based on a `RandomAccessCollection` of some data type. Either the collection’s elements must conform to `Identifiable` or you need to provide an `id` parameter to the `ForEach` initializer.

The following example creates a `NamedFont` type that conforms to `Identifiable`, and an array of this type called `namedFonts`. A `ForEach` instance iterates over the array, producing new `Text` instances that display examples of each SwiftUI `Font` style provided in the array.

```swift
private struct NamedFont: Identifiable {
    let name: String
    let font: Font
    var id: String { name }
}

private let namedFonts: [NamedFont] = [
    NamedFont(name: "Large Title", font: .largeTitle),
    NamedFont(name: "Title", font: .title),
    NamedFont(name: "Headline", font: .headline),
    NamedFont(name: "Body", font: .body),
    NamedFont(name: "Caption", font: .caption)
]

var body: some View {
    ForEach(namedFonts) { namedFont in
        Text(namedFont.name)
            .font(namedFont.font)
    }
}
```

Some containers like `List` or `LazyVStack` will query the elements within a for each lazily. To obtain maximal performance, ensure that the view created from each element in the collection represents a constant number of views.

For example, the following view uses an if statement which means each element of the collection can represent either 1 or 0 views, a non-constant number.

```swift
ForEach(namedFonts) { namedFont in
    if namedFont.name.count != 2 {
        Text(namedFont.name)
    }
}
```

You can make the above view represent a constant number of views by wrapping the condition in a `VStack`, an `HStack`, or a `ZStack`.

```swift
ForEach(namedFonts) { namedFont in
    VStack {
        if namedFont.name.count != 2 {
            Text(namedFont.name)
        }
    }
}
```

When enabling the following launch argument, SwiftUI will log when it encounters a view that produces a non-constant number of views in these containers:

```swift
-LogForEachSlowPath YES
```





## Relationships

**Conforms To**: `AccessibilityRotorContent`, `AttachmentContent`, `Chart3DContent`, `ChartContent`, `Copyable`, `DynamicMapContent`, `DynamicTableRowContent`, `DynamicViewContent`, `Escapable`, `MapContent`, `TabContent`, `TableRowContent`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a collection

- `init(_:)`
- `init(_:content:)`
- `init(_:id:content:)`

### Creating an editable collection

- `init(_:editActions:content:)`
- `init(_:id:editActions:content:)`

### Accessing content

- `content`
- `data`

### Initializers

- `init(sections:content:)`
- `init(subviews:content:)`

## See Also

- `ForEachSectionCollection`
- `ForEachSubviewCollection`
- `DynamicViewContent`
