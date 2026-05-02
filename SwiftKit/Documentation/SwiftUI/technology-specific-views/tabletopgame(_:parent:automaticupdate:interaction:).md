---
url: https://developer.apple.com/documentation/swiftui/view/tabletopgame(_:parent:automaticupdate:interaction:)
framework: SwiftUI
category: Technology-specific views
title: tabletopGame(_:parent:automaticUpdate:interaction:)
kind: method
captured: 2026-05-02
---

# tabletopGame(_:parent:automaticUpdate:interaction:)

Supplies a closure which returns a new interaction whenever needed.

## Declaration

```swift
@MainActor @preconcurrency func tabletopGame(_ game: TabletopGame, parent: Entity, automaticUpdate: Bool = true, interaction make: @escaping (TabletopInteraction.Value) -> any TabletopInteraction.Delegate) -> some View

```









## Availability

- visionOS 2.0



## See Also

- `tabletopGame(_:parent:automaticUpdate:)`
