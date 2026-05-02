---
url: https://developer.apple.com/documentation/swiftui/creating-a-tvos-media-catalog-app-in-swiftui
framework: SwiftUI
category: App organization
title: Creating a tvOS Media Catalog App in SwiftUI
kind: article
captured: 2026-05-02
---

# Creating a tvOS Media Catalog App in SwiftUI

## Overview

This sample code project shows how to create the standard content lockups for tvOS, and provides best practices for building out rows of content shelves. It also includes examples for product pages, search views, and tab views, including the new sidebar adaptive tab view style that provides a sidebar in tvOS.

> **Note:** This sample code project is associated with WWDC24 session 10207: [Migrate your TVML app to SwiftUI](https://developer.apple.com/wwdc24/10207/)

## Sample Project Components

- **`StackView`** - Implements an example landing page for a content catalog app, defining several shelves with a showcase or hero header area above them.
- **`ButtonsView`** - Provides a showcase of the various button styles available in tvOS.
- **`DescriptionView`** - Provides an example of how to build a product page similar to those you see on the Apple TV app, with a custom material blur.
- **`SearchView`** - Shows an example of a simple search page using the `searchable(text:placement:prompt:)` and `searchSuggestions(_:)` modifiers.
- **`SidebarContentView`** - Shows how to make a sectioned sidebar using the new tab bar APIs in tvOS 18.
- **`HeroHeaderView`** - Gives an example of creating a material gradient.

## Create Content Lockups

The `borderless` button style provides the primary lockup style you use in tvOS:

```swift
Button { /* action */ } label: {
    Image("discovery_portrait")
        .resizable()
        .frame(width: 250, height: 375)
    Text("Borderless Portrait")
}
```

To attach the hover effect to a particular subview:

```swift
Button { /* action */ } label: {
    Image(systemName: "person.circle")
        .font(.title)
        .background(Color.blue.grayscale(0.7))
        .hoverEffect(.highlight)
    Text("Shaped")
}
.buttonBorderShape(.circle)
```

## Show Information-Dense Lockups

For lockups with more dense information, use the `card` button style:

```swift
Button { /* action */ } label: {
    HStack(alignment: .top, spacing: 10) {
        Image( . . . )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        VStack(alignment: .leading) {
            Text(asset.title).font(.body)
            Text("Subtitle text").font(.caption2).foregroundStyle(.secondary).lineLimit(2)
        }
    }
    .padding(12)
}
```

## Display Content Shelves

```swift
ScrollView(.horizontal) {
    LazyHStack(spacing: 40) {
        ForEach(Asset.allCases) { asset in
            // . . .
        }
    }
}
.scrollClipDisabled()
.buttonStyle(.borderless)
```

```swift
asset.portraitImage
    .resizable()
    .aspectRatio(250 / 375, contentMode: .fit)
    .containerRelativeFrame(.horizontal, count: 6, spacing: 40)
Text(asset.title)
```

## Show Content Above and Below the Fold

```swift
VStack(alignment: .leading) {
    // Header content.
}
.frame(maxWidth: .infinity, alignment: .leading)
.focusSection()
.containerRelativeFrame(.vertical, alignment: .topLeading) {
    length, _ in length * 0.8
}
```

```swift
.onScrollVisibilityChange { visible in
    withAnimation {
        belowFold = !visible
    }
}
```

## Snap at the Fold Point

```swift
struct FoldSnappingScrollTargetBehavior: ScrollTargetBehavior {
    var aboveFold: Bool
    var showcaseHeight: CGFloat

    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if aboveFold && target.rect.minY < showcaseHeight * 0.3 { return }
        if !aboveFold && target.rect.minY > showcaseHeight { return }

        let showcaseRevealThreshold = showcaseHeight * 0.7
        let snapToHideRange = showcaseRevealThreshold...showcaseHeight

        if aboveFold || snapToHideRange.contains(target.rect.origin.y) {
            target.rect.origin.y = showcaseHeight
        } else {
            target.rect.origin.y = 0
        }
    }
}
```

## Search for Content

```swift
ScrollView(.vertical) {
    LazyVGrid(
        columns: Array(repeating: .init(.flexible(), spacing: 40), count: 4),
        spacing: 40
    ) {
        ForEach(/* matching assets, sorted */) { asset in
            Button { /* action */ } label: {
                asset.landscapeImage
                    .resizable()
                    .aspectRatio(16 / 9, contentMode: .fit)
                Text(asset.title)
            }
        }
    }
    .buttonStyle(.borderless)
}
.scrollClipDisabled()
.searchable(text: $searchTerm)
.searchSuggestions {
    ForEach(/* keywords matching search term */, id: \.self) { suggestion in
        Text(suggestion)
    }
}
```
