---
url: https://developer.apple.com/documentation/swiftui/scrollviewreader
framework: SwiftUI
category: Scroll views
title: ScrollViewReader
kind: struct
captured: 2026-05-02
---

# ScrollViewReader

A view that provides programmatic scrolling, by working with a proxy to scroll to known child views.

## Declaration

```swift
@frozen struct ScrollViewReader<Content> where Content : View
```

### Overview

The scroll view reader’s content view builder receives a `ScrollViewProxy` instance; you use the proxy’s `ScrollViewProxy/scrollTo(_:anchor:)` to perform scrolling.

The following example creates a `ScrollView` containing 100 views that together display a color gradient. It also contains two buttons, one each at the top and bottom. The top button tells the `ScrollViewProxy` to scroll to the bottom button, and vice versa.

```swift
@Namespace var topID
@Namespace var bottomID

var body: some View {
    ScrollViewReader { proxy in
        ScrollView {
            Button("Scroll to Bottom") {
                withAnimation {
                    proxy.scrollTo(bottomID)
                }
            }
            .id(topID)

            VStack(spacing: 0) {
                ForEach(0..<100) { i in
                    color(fraction: Double(i) / 100)
                        .frame(height: 32)
                }
            }

            Button("Top") {
                withAnimation {
                    proxy.scrollTo(topID)
                }
            }
            .id(bottomID)
        }
    }
}

func color(fraction: Double) -> Color {
    Color(red: fraction, green: 1 - fraction, blue: 0.5)
}
```

> **IMPORTANT:** You may not use the `ScrollViewProxy` during execution of the `content` view builder; doing so results in a runtime error. Instead, only actions created within `content` can call the proxy, such as gesture handlers or a view’s `onChange(of:perform:)` method.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating a scroll view reader

- `init(content:)`

### Configuring a scroll view reader

- `content`

## See Also

- `ScrollView`
- `ScrollViewProxy`
