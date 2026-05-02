---
url: https://developer.apple.com/documentation/swiftui/disclosuregroupstyle
framework: SwiftUI
category: View styles
title: DisclosureGroupStyle
kind: protocol
captured: 2026-05-02
---

# DisclosureGroupStyle

A type that specifies the appearance and interaction of disclosure groups within a view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol DisclosureGroupStyle
```

### Overview

To configure the disclosure group style for a view hierarchy, use the `View/disclosureGroupStyle(_:)` modifier.

To create a custom disclosure group style, declare a type that conforms to `DisclosureGroupStyle`. Implement the `DisclosureGroupStyle/makeBody(configuration:)` method to return a view that composes the elements of the `configuration` that SwiftUI provides to your method.

```swift
struct MyDisclosureStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Button {
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            } label: {
                HStack(alignment: .firstTextBaseline) {
                    configuration.label
                    Spacer()
                    Text(configuration.isExpanded ? "hide" : "show")
                        .foregroundColor(.accentColor)
                        .font(.caption.lowercaseSmallCaps())
                        .animation(nil, value: configuration.isExpanded)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            if configuration.isExpanded {
                configuration.content
            }
        }
    }
}
```

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `AutomaticDisclosureGroupStyle`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0

## Topics

### Getting the styles

- `automatic`

### Creating custom disclosure group styles

- `makeBody(configuration:)`
- `DisclosureGroupStyleConfiguration`
- `DisclosureGroupStyle.Configuration`
- `Body`

### Supporting types

- `AutomaticDisclosureGroupStyle`

## See Also

- `listStyle(_:)`
- `ListStyle`
- `tableStyle(_:)`
- `TableStyle`
- `TableStyleConfiguration`
- `disclosureGroupStyle(_:)`
