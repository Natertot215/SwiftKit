---
url: https://developer.apple.com/documentation/swiftui/view/hovereffectgroup()
framework: SwiftUI
category: Input events
title: hoverEffectGroup()
kind: method
captured: 2026-05-02
---

# hoverEffectGroup()

Adds an implicit `HoverEffectGroup` to all effects defined on descendant views, so that all effects added to subviews activate as a group whenever this view or any descendant views are hovered.

## Declaration

```swift
nonisolated func hoverEffectGroup() -> some View

```

### Return Value

A view that activates the given hover group, as well as all effects added to subviews.

### Discussion

You use this modifier when all effects defined on a view and its subviews should activate together. In the following example hovering anywhere over the view will activate the `hoverEffect`s added to the `Text` and the background view:

```swift
struct EffectView: View {
    var effectGroup: HoverEffectGroup?

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
            Text("12 Issues")
                .hoverEffect { effect, isActive, _ in
                    effect.opacity(isActive ? 1 : 0.5)
                }
        }
        .padding()
        .background {
            Capsule()
                .fill(.yellow)
                .hoverEffect { effect, isActive, _ in
                    effect.opacity(isActive ? 0.25 : 0.1)
                }
        }
        .hoverEffectGroup()
   }
}
```







## Availability

- visionOS 2.0



## See Also

- `hoverEffect(_:)`
- `HoverEffect`
- `hoverEffect(_:in:isEnabled:)`
- `hoverEffect(in:isEnabled:body:)`
- `CustomHoverEffect`
- `ContentHoverEffect`
- `HoverEffectGroup`
- `hoverEffectGroup(_:)`
- `hoverEffectGroup(id:in:behavior:)`
- `GroupHoverEffect`
- `HoverEffectContent`
- `EmptyHoverEffectContent`
- `handPointerBehavior(_:)`
- `HandPointerBehavior`
