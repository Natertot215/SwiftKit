---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityrotor(_:entries:)
framework: SwiftUI
category: Accessible navigation
title: accessibilityRotor(_:entries:)
kind: method
captured: 2026-05-02
---

# accessibilityRotor(_:entries:)

Create an Accessibility Rotor with the specified user-visible label, and entries generated from the content closure.

## Declaration

```swift
nonisolated func accessibilityRotor<Content>(_ label: LocalizedStringResource, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent

```

### Discussion

An Accessibility Rotor is a shortcut for Accessibility users to quickly navigate to specific elements of the user interface, and optionally specific ranges of text within those elements.

In the following example, a Message application creates a Rotor allowing users to navigate to specifically the messages originating from VIPs.

```swift
// `messages` is a list of `Identifiable` `Message`s.

ScrollView {
    LazyVStack {
        ForEach(messages) { message in
            MessageView(message)
        }
    }
}
.accessibilityElement(children: .contain)
.accessibilityRotor("VIPs") {
    // Not all the MessageViews are generated at once, the model
    // knows about all the messages.
    ForEach(messages) { message in
        // If the Message is from a VIP, make a Rotor entry for it.
        if message.isVIP {
            AccessibilityRotorEntry(message.subject, id: message.id)
        }
    }
}
```

## Parameters

- **label**: Localized label identifying this Rotor to the user.
- **entries**: Content used to generate Rotor entries. This can include AccessibilityRotorEntry structs, as well as constructs such as if and ForEach.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `accessibilityRotor(_:entries:entryID:entryLabel:)`
- `accessibilityRotor(_:entries:entryLabel:)`
- `accessibilityRotor(_:textRanges:)`
