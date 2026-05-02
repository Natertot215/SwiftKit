---
url: https://developer.apple.com/documentation/swiftui/alignment
framework: SwiftUI
category: Layout adjustments
title: Alignment
kind: struct
captured: 2026-05-02
---

# Alignment

An alignment in both axes.

## Declaration

```swift
@frozen struct Alignment
```

### Overview

An `Alignment` contains a `HorizontalAlignment` guide and a `VerticalAlignment` guide. Specify an alignment to direct the behavior of certain layout containers and modifiers, like when you place views in a `ZStack`, or layer a view in front of or behind another view using `View/overlay(alignment:content:)` or `View/background(alignment:content:)`, respectively. During layout, SwiftUI brings the specified guides of the affected views together, aligning the views.

SwiftUI provides a set of built-in alignments that represent common combinations of the built-in horizontal and vertical alignment guides. The blue boxes in the following diagram demonstrate the alignment named by each box’s label, relative to the background view:

The following code generates the diagram above, where each blue box appears in an overlay that’s configured with a different alignment:

```swift
struct AlignmentGallery: View {
    var body: some View {
        BackgroundView()
            .overlay(alignment: .topLeading) { box(".topLeading") }
            .overlay(alignment: .top) { box(".top") }
            .overlay(alignment: .topTrailing) { box(".topTrailing") }
            .overlay(alignment: .leading) { box(".leading") }
            .overlay(alignment: .center) { box(".center") }
            .overlay(alignment: .trailing) { box(".trailing") }
            .overlay(alignment: .bottomLeading) { box(".bottomLeading") }
            .overlay(alignment: .bottom) { box(".bottom") }
            .overlay(alignment: .bottomTrailing) { box(".bottomTrailing") }
            .overlay(alignment: .leadingLastTextBaseline) { box(".leadingLastTextBaseline") }
            .overlay(alignment: .trailingFirstTextBaseline) { box(".trailingFirstTextBaseline") }
    }

    private func box(_ name: String) -> some View {
        Text(name)
            .font(.system(.caption, design: .monospaced))
            .padding(2)
            .foregroundColor(.white)
            .background(.blue.opacity(0.8), in: Rectangle())
    }
}

private struct BackgroundView: View {
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow {
                Text("Some text in an upper quadrant")
                Color.gray.opacity(0.3)
            }
            GridRow {
                Color.gray.opacity(0.3)
                Text("More text in a lower quadrant")
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .foregroundColor(.secondary)
        .border(.gray)
    }
}
```

To avoid crowding, the alignment diagram shows only two of the available text baseline alignments. The others align as their names imply. Notice that the first text baseline alignment aligns with the top-most line of text in the background view, while the last text baseline aligns with the bottom-most line. For more information about text baseline alignment, see `VerticalAlignment`.

In a left-to-right language like English, the leading and trailing alignments appear on the left and right edges, respectively. SwiftUI reverses these in right-to-left language environments. For more information, see `HorizontalAlignment`.

#### Custom alignment

You can create custom alignments — which you typically do to make use of custom horizontal or vertical guides — by using the `Alignment/init(horizontal:vertical:)` initializer. For example, you can combine a custom vertical guide called `firstThird` with the built-in horizontal `HorizontalAlignment/center` guide, and use it to configure a `ZStack`:

```swift
ZStack(alignment: Alignment(horizontal: .center, vertical: .firstThird)) {
    // ...
}
```

For more information about creating custom guides, including the code that creates the custom `firstThird` alignment in the example above, see `AlignmentID`.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting top guides

- `topLeading`
- `top`
- `topTrailing`

### Getting middle guides

- `leading`
- `center`
- `trailing`

### Getting bottom guides

- `bottomLeading`
- `bottom`
- `bottomTrailing`

### Getting text baseline guides

- `leadingFirstTextBaseline`
- `centerFirstTextBaseline`
- `trailingFirstTextBaseline`
- `leadingLastTextBaseline`
- `centerLastTextBaseline`
- `trailingLastTextBaseline`

### Creating a custom alignment

- `init(horizontal:vertical:)`
- `horizontal`
- `vertical`

## See Also

- `Aligning views within a stack`
- `Aligning views across stacks`
- `alignmentGuide(_:computeValue:)`
- `HorizontalAlignment`
- `VerticalAlignment`
- `DepthAlignment`
- `AlignmentID`
- `ViewDimensions`
- `ViewDimensions3D`
- `SpatialContainer`
