---
url: https://developer.apple.com/documentation/swiftui/attributedtextformattingdefinition
framework: SwiftUI
category: Text input and output
title: AttributedTextFormattingDefinition
kind: protocol
captured: 2026-05-02
---

# AttributedTextFormattingDefinition

A protocol for defining how text can be styled in a view.

## Declaration

```swift
protocol AttributedTextFormattingDefinition<Scope>
```

### Overview

A formatting definition consists of an attribute scope and a number of value constraints. It is applied to a view hierarchy using the `View/attributedTextFormattingDefinition(_:)-81jn6` view modifier and affects nested `Text` and `TextEditor` views when initialized with `AttributedString`.

Create a formatting definition by first choosing an attribute scope that contains all attributes relevant for your view. All other attributes will be ignored by value constraints and by the affected views.

Use the `Foundation/AttributeScopes/SwiftUIAttributes` for the default set of attributes supported by SwiftUI. You can create your own scope only listing out a subset of the attributes in SwiftUI’s attribute scope. You can also include custom attributes in your scope. This allows you to take advantage of advanced attributed string features, such as `AttributedStringKey/runBoundaries`.

Custom attributes also allow you to separate semantic information stored on the text, e.g. the information that a sequence of characters refers a specific person in contacts, from how this part of the text is to be formatted, e.g. with the foreground color “purple”. The rules defining what values attributes can have, are called `AttributedTextValueConstraint`s.

```swift
struct ContactsArePurple: AttributedTextValueConstraint {
    typealias Scope = MyScope
    typealias AttributeKey = Scope.ForegroundColorAttribute

    func constrain(_ container: inout Attributes) {
        if container.annotation == .contact {
            container.foregroundColor = .purple
        } else {
            container.foregroundColor = nil
        }
    }
}
```

While associating formatting with custom semantic attributes is one important use case, value constraints are a generic mechanism for constraining the formatting that is available in a text editor - with or without dependencies on other attributes. For example, a value constraint could also be used to only allow a single, solid underline, but not a double underline or a dashed underline.

SwiftUI validates formatting UI provided by the system to the user to make sure only controls that are compatible with your formatting definition and its constraints are visible and enabled. If the system formatting UI does not provide sufficient utility based on your formatting definition, or you provide custom UI that is better tailored to your text editing experience, consider hiding the system-provided UI using the `View/textInputFormattingControlVisibility(_:for:)` view modifier.

To declare the attributed text formatting definition, specify the attribute scope in the generic of the `AttributedTextFormattingDefinition/body-1b01t`’s type, and list all value constraints inside the `AttributedTextFormattingDefinition/body-1b01t` using result builder syntax:

```swift
struct MyTextFormattingDefinition: AttributedTextFormattingDefinition {
    var body: some AttributedTextFormattingDefinition<
        AttributeScopes.SwiftUIAttributes
    > {
        ValueConstraint(
            for: \.underlineStyle,
            values: [nil, .single],
            default: .single)
        MyAttributedTextValueConstraint()
        ContactsArePurple()
    }
}
```

Use the `View/attributedTextFormattingDefinition(_:)-81jn6` view modifier to apply the definition to a view.





## Relationships

**Inherited By**: `AttributedTextValueConstraint`

**Conforming Types**: `AttributedTextFormatting.AnyDefinition`, `AttributedTextFormatting.EmptyDefinition`, `AttributedTextFormatting.TupleDefinition`, `AttributedTextFormatting.ValueConstraint`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0

## Topics

### Associated Types

- `Body`
- `Scope`

### Instance Properties

- `body`

### Instance Methods

- `constrain(_:)`

### Type Aliases

- `AttributedTextFormattingDefinition.ValueConstraint`

## See Also

- `bold(_:)`
- `italic(_:)`
- `underline(_:pattern:color:)`
- `strikethrough(_:pattern:color:)`
- `textCase(_:)`
- `textCase`
- `monospaced(_:)`
- `monospacedDigit()`
- `AttributedTextValueConstraint`
- `AttributedTextFormatting`
