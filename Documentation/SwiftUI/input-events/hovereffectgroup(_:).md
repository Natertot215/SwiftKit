---
url: https://developer.apple.com/documentation/swiftui/view/hovereffectgroup(_:)
framework: SwiftUI
category: Input events
title: hoverEffectGroup(_:)
kind: method
captured: 2026-05-02
---

# hoverEffectGroup(_:)

Adds a `HoverEffectGroup` to all effects defined on descendant views, and activates the group whenever this view or any descendant views are hovered.

## Declaration

```swift
nonisolated func hoverEffectGroup(_ group: HoverEffectGroup?) -> some View

```

### Return Value

A view that activates the given hover group, as well as all effects added to subviews.

### Discussion

You use this modifier when all effects defined on a view and its subviews should activate together. In the following example hovering anywhere over the view will activate the `hoverEffect`s added to the `Text` and the background view, as well as any effects added to the group by other views:

```swift
struct EffectView: View {
    let effectGroup: HoverEffectGroup?

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
       .hoverEffectGroup(effectGroup)
   }
}
```

## Parameters

- **group**: The `HoverEffectGroup` to activate when this view or any subviews are hovered. If `nil`, this modifier has no effect.





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
- `hoverEffectGroup()`
- `hoverEffectGroup(id:in:behavior:)`
- `GroupHoverEffect`
- `HoverEffectContent`
- `EmptyHoverEffectContent`
- `handPointerBehavior(_:)`
- `HandPointerBehavior`
