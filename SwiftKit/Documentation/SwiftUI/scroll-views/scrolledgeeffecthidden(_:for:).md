---
url: https://developer.apple.com/documentation/swiftui/view/scrolledgeeffecthidden(_:for:)
framework: SwiftUI
category: Scroll views
title: scrollEdgeEffectHidden(_:for:)
kind: method
captured: 2026-05-02
---

# scrollEdgeEffectHidden(_:for:)

Hides any scroll edge effects for scroll views within this hierarchy.

## Declaration

```swift
nonisolated func scrollEdgeEffectHidden(_ hidden: Bool = true, for edges: Edge.Set = .all) -> some View

```

### Discussion

By default, a scroll view renders an automatic edge effect style. Use this modifier to hide any edge effects for scroll views within this hierarchy.

```swift
ScrollView {
    LazyVStack {
        ForEach(data) { item in
            RowView(item)
        }
    }
}
.scrollEdgeEffectHidden()
```







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- watchOS 26.0



## See Also

- `scrollEdgeEffectStyle(_:for:)`
- `ScrollEdgeEffectStyle`
- `safeAreaBar(edge:alignment:spacing:content:)`
