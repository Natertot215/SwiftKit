---
url: https://developer.apple.com/documentation/swiftui/view/interactionactivitytrackingtag(_:)
framework: SwiftUI
category: View configuration
title: interactionActivityTrackingTag(_:)
kind: method
captured: 2026-05-02
---

# interactionActivityTrackingTag(_:)

Sets a tag that you use for tracking interactivity.

## Declaration

```swift
nonisolated func interactionActivityTrackingTag(_ tag: String) -> some View

```

### Return Value

A view that uses a tracking tag.

### Discussion

The following example tracks the scrolling activity of a `List`:

```swift
List {
    Section("Today") {
        ForEach(messageStore.today) { message in
            Text(message.title)
        }
    }
}
.interactionActivityTrackingTag("MessagesList")
```

The resolved activity tracking tag is additive, so using the modifier across the view hierarchy builds the tag from top to bottom. The example below shows a hierarchical usage of this modifier with the resulting tag `Home-Feed`:

```swift
var body: some View {
    Home()
        .interactionActivityTrackingTag("Home")
}

struct Home: View {
    var body: some View {
        List {
            Text("A List Item")
            Text("A Second List Item")
            Text("A Third List Item")
        }
        .interactionActivityTrackingTag("Feed")
    }
}
```

## Parameters

- **tag**: The tag used to track user interactions hosted by this view as activities.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `disabled(_:)`
- `isEnabled`
- `invalidatableContent(_:)`
