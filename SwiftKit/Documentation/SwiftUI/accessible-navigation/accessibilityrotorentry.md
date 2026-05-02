---
url: https://developer.apple.com/documentation/swiftui/accessibilityrotorentry
framework: SwiftUI
category: Accessible navigation
title: AccessibilityRotorEntry
kind: struct
captured: 2026-05-02
---

# AccessibilityRotorEntry

A struct that represents an entry in an Accessibility Rotor.

## Declaration
```swift
struct AccessibilityRotorEntry<ID>
```

## Availability
- iOS 15.0+
- iPadOS 15.0+
- Mac Catalyst 15.0+
- macOS 12.0+
- tvOS 15.0+
- visionOS 1.0+
- watchOS 8.0+

## Overview
Enables users with accessibility needs to quickly navigate to specific UI elements and optionally specific text ranges within those elements.

## Key Features
- **Label & Identifier**: Each entry has a label to identify it to users and an identifier to determine which accessibility element to navigate to
- **Text Range Support**: Optional range specification for navigating to specific positions within element text
- **Preparation Handler**: Optional closure called before navigation (e.g., scrolling elements into view)
- **Namespace Support**: Can be used with `@Namespace` for complex layouts

## Initializers
- `init(_:textRange:prepare:)` — Basic entry associated with the rotor's owner element
- `init(_:id:textRange:prepare:)` — Entry with custom identifier
- `init(_:id:in:textRange:prepare:)` — Entry with namespace support
- `init(_:_:in:textRange:prepare:)` — Entry with custom label, identifier, and namespace

## Basic Example
```swift
.accessibilityRotor("VIPs") {
    ForEach(messages) { message in
        if message.isVIP {
            AccessibilityRotorEntry(message.subject, id: message.id)
        }
    }
}
```

## Namespace Example
```swift
struct MessageListView: View {
    @Namespace var namespace

    var body: some View {
        ScrollViewReader { scroller in
            ScrollView {
                LazyVStack {
                    ForEach(allMessages) { message in
                        Text(message.content)
                            .accessibilityRotorEntry(
                                "\(message.id)_content",
                                in: namespace
                            )
                    }
                }
            }
            .accessibilityRotor("VIP Messages") {
                ForEach(vipMessages) { vipMessage in
                    AccessibilityRotorEntry(vipMessage.subject,
                        id: "\(vipMessage.id)_content", in: namespace)
                    {
                        scroller.scrollTo(vipMessage.id)
                    }
                }
            }
        }
    }
}
```

## Conformance
- `AccessibilityRotorContent`
- `Copyable`
- `Escapable`

## See Also
- `AccessibilityRotorContent`
- `AccessibilitySystemRotor`
- `View.accessibilityRotor(_:entries:)`
