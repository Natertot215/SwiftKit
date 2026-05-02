---
url: https://developer.apple.com/documentation/swiftui/alignmentid
framework: SwiftUI
category: Layout adjustments
title: AlignmentID
kind: protocol
captured: 2026-05-02
---

# AlignmentID

A type that you use to create custom alignment guides.

## Declaration

```swift
protocol AlignmentID
```

### Overview

Every built-in alignment guide that `VerticalAlignment` or `HorizontalAlignment` defines as a static property, like `VerticalAlignment/top` or `HorizontalAlignment/leading`, has a unique alignment identifier type that produces the default offset for that guide. To create a custom alignment guide, define your own alignment identifier as a type that conforms to the `AlignmentID` protocol, and implement the required `AlignmentID/defaultValue(in:)` method:

```swift
private struct FirstThirdAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height / 3
    }
}
```

When implementing the method, calculate the guide’s default offset from the view’s origin. If it’s helpful, you can use information from the `ViewDimensions` input in the calculation. This parameter provides context about the specific view that’s using the guide. The above example creates an identifier called `FirstThirdAlignment` and calculates a default value that’s one-third of the height of the aligned view.

Use the identifier’s type to create a static property in an extension of one of the alignment guide types, like `VerticalAlignment`:

```swift
extension VerticalAlignment {
    static let firstThird = VerticalAlignment(FirstThirdAlignment.self)
}
```

You can apply your custom guide like any of the built-in guides. For example, you can use an `HStack` to align its views at one-third of their height using the guide defined above:

```swift
struct StripesGroup: View {
    var body: some View {
        HStack(alignment: .firstThird, spacing: 1) {
            HorizontalStripes().frame(height: 60)
            HorizontalStripes().frame(height: 120)
            HorizontalStripes().frame(height: 90)
        }
    }
}

struct HorizontalStripes: View {
    var body: some View {
        VStack(spacing: 1) {
            ForEach(0..<3) { _ in Color.blue }
        }
    }
}
```

Because each set of stripes has three equal, vertically stacked rectangles, they align at the bottom edge of the top rectangle. This corresponds in each case to a third of the overall height, as measured from the origin at the top of each set of stripes:

You can also use the `View/alignmentGuide(_:computeValue:)` view modifier to alter the behavior of your custom guide for a view, as you might alter a built-in guide. For example, you can change one of the stacks of stripes from the previous example to align its `firstThird` guide at two thirds of the height instead:

```swift
struct StripesGroupModified: View {
    var body: some View {
        HStack(alignment: .firstThird, spacing: 1) {
            HorizontalStripes().frame(height: 60)
            HorizontalStripes().frame(height: 120)
            HorizontalStripes().frame(height: 90)
                .alignmentGuide(.firstThird) { context in
                    2 * context.height / 3
                }
        }
    }
}
```

The modified guide calculation causes the affected view to place the bottom edge of its middle rectangle on the `firstThird` guide, which aligns with the bottom edge of the top rectangle in the other two groups:







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting the default value

- `defaultValue(in:)`

## See Also

- `Aligning views within a stack`
- `Aligning views across stacks`
- `alignmentGuide(_:computeValue:)`
- `Alignment`
- `HorizontalAlignment`
- `VerticalAlignment`
- `DepthAlignment`
- `ViewDimensions`
- `ViewDimensions3D`
- `SpatialContainer`
