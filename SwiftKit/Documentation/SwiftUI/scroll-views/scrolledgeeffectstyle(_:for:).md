---
url: https://developer.apple.com/documentation/swiftui/view/scrolledgeeffectstyle(_:for:)
framework: SwiftUI
category: Scroll views
title: scrollEdgeEffectStyle(_:for:)
kind: method
captured: 2026-05-02
---

# scrollEdgeEffectStyle(_:for:)

Configures the scroll edge effect style for scroll views within this hierarchy.

## Declaration

```swift
nonisolated func scrollEdgeEffectStyle(_ style: ScrollEdgeEffectStyle?, for edges: Edge.Set) -> some View

```

### Discussion

By default, a scroll view renders an automatic edge effect. Use this modifier to change the scroll edge effect style.

```swift
ScrollView {
    LazyVStack {
        ForEach(data) { item in
            RowView(item)
        }
    }
}
.scrollEdgeEffectStyle(.hard, for: .all)
```







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- watchOS 26.0



## See Also

- `scrollEdgeEffectHidden(_:for:)`
- `ScrollEdgeEffectStyle`
- `safeAreaBar(edge:alignment:spacing:content:)`
