---
url: https://developer.apple.com/documentation/swiftui/view/alternatingrowbackgrounds(_:)
framework: SwiftUI
category: Lists
title: alternatingRowBackgrounds(_:)
kind: method
captured: 2026-05-02
---

# alternatingRowBackgrounds(_:)

Overrides whether lists and tables in this view have alternating row backgrounds.

## Declaration

```swift
nonisolated func alternatingRowBackgrounds(_ behavior: AlternatingRowBackgroundBehavior = .enabled) -> some View

```

### Discussion

This can be used in conjunction with an explicit list or table style or used by itself to customize the row backgrounds of the automatic style. The only list style this has no effect on is `.sidebar.`

```swift
List(recipe.ingredients) {
    Text($0.name)
}
.listStyle(.bordered)
.alternatingRowBackgrounds()
```

This is able to be combined with `scrollContentBackground(_:)` and applies an alternating row background on top of the overall list or table background.

This can also be combined with `listRowBackground`, which overrides the background for a specific list row, replacing the automatic alternating background for that row.

## Parameters

- **behavior**: Whether alternating row backgrounds are enabled or not.





## Availability

- macOS 14.0



## See Also

- `listRowBackground(_:)`
- `AlternatingRowBackgroundBehavior`
- `backgroundProminence`
- `BackgroundProminence`
