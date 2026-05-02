---
url: https://developer.apple.com/documentation/swiftui/view/hovereffectgroup(id:in:behavior:)
framework: SwiftUI
category: Input events
title: hoverEffectGroup(id:in:behavior:)
kind: method
captured: 2026-05-02
---

# hoverEffectGroup(id:in:behavior:)

Adds a `HoverEffectGroup` to all effects defined on descendant views, and activates the group whenever this view or any descendant views are hovered.

## Declaration

```swift
nonisolated func hoverEffectGroup(id: String? = nil, in namespace: Namespace.ID, behavior: HoverEffectGroup.Behavior = .activatesGroup) -> some View

```

### Return Value

A new effect that is matched to other effects in the same group.

### Discussion

You use this modifier when all effects defined on a view and its subviews should activate together. In the following example hovering anywhere over the view will activate the `hoverEffect`s added to the `Text` and the background view, as well as any effects added to the group by other views:

```swift
struct EffectView: View {
    @Namespace var namespace

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
        .hoverEffectGroup(in: namespace)
    }
}
```

The effect group is uniquely identified by combining the `id` and `namespace` parameters. If an `id` is not provided, the effect will be identified by the `namespace` alone. Providing a `name` is useful when creating effects that use multiple, related groups.

The default behavior of a matched effect is to activate the effect group when hovered. The `behavior` parameter can be used to choose alternative behaviors. See `HoverEffectGroup/Behavior` for all possible behaviors.

## Parameters

- **id**: An optional id to give the group. If provided, the group will be uniquely identified by combining the id and the namespace.
- **namespace**: The namespace that identifies the group. If `nil`, this modifier has no effect.
- **behavior**: How the effect will behave relative to other effects in the group.





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
- `hoverEffectGroup(_:)`
- `GroupHoverEffect`
- `HoverEffectContent`
- `EmptyHoverEffectContent`
- `handPointerBehavior(_:)`
- `HandPointerBehavior`
