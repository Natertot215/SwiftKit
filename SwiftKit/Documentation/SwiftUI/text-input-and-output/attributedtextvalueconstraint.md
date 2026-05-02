---
url: https://developer.apple.com/documentation/swiftui/attributedtextvalueconstraint
framework: SwiftUI
category: Text input and output
title: AttributedTextValueConstraint
kind: protocol
captured: 2026-05-02
---

# AttributedTextValueConstraint

A protocol for defining a constraint on the value of a certain attribute.

## Declaration

```swift
protocol AttributedTextValueConstraint : Hashable, Sendable, AttributedTextFormattingDefinition
```

### Overview

Used as an `AttributedTextFormattingDefinition`, this constrains the `AttributedTextValueConstraint/AttributeKey`’s value using the `constrain(_:)-(Attributes)` function.

Given value constraints can read other attribute values, it is crucial to avoid mixing value constraints in a way where they create cyclic dependencies with undefined behavior. Thus, it is recommended to think about value constraints in the context of the `AttributedTextFormattingDefinition` they will be used in:

A simple constraint only accesses a single attribute. It can be made generic over the attribute scope so it can be reused in different `AttributedTextFormattingDefinition`s.

```swift
struct NoBlackOrWhiteForeground<Scope: AttributeScope>: AttributedTextValueConstraint {
    typealias AttributeKey = AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute

    func constrain(
        _ container: inout Attributes
    ) {
        if container.foregroundColor == .white || container.foregroundColor == .black {
            container.foregroundColor = .primary
        }
    }
}
```

When the constraint needs to access other attribute values, it is recommended to define it on a specific attribute scope that is used for a single `AttributedTextFormattingDefinition`.

```swift
extension MyTextFormattingDefinition {
    struct Scope: AttributeScope {
        /* ... */
        let foregroundColor: AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute
        let backgroundColor: AttributeScopes.SwiftUIAttributes.BackgroundColorAttribute
    }
}

struct NoEqualForegroundAndBackground: AttributedTextValueConstraint {
    typealias Scope = MyTextFormattingDefinition.Scope
    typealias AttributeKey = AttributeScopes.SwiftUIAttributes.BackgroundColorAttribute

    func constrain(
        _ container: inout Attributes
    ) {
        if let color = container.foregroundColor,
           container.backgroundColor == color
        {
            container.backgroundColor = nil
        }
    }
}
```

Constraints that access multiple attributes and are generic over the scope should document their dependencies so that the dependencies can be considered for the ordering of constraints in the `AttributedTextFormattingDefinition/body-1b01t`.

```swift
/// Makes the background color for all Genmoji blue.
///
/// - Note: This constraint depends on a valid adaptiveImageGlyph value.
struct BlueGenmojiBackgroundConstraint<Scope: AttributeScope>: AttributedTextValueConstraint {
    typealias AttributeKey = AttributeScopes.SwiftUIAttributes
        .BackgroundColorAttribute

    func constrain(
        _ container: inout Attributes
    ) {
        if container[
            AttributeScopes.SwiftUIAttributes.AdaptiveImageGlyphAttribute.self
        ] != nil {
            container.backgroundColor = .blue
        }
    }
}
```





## Relationships

**Inherits From**: `AttributedTextFormattingDefinition`, `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

**Conforming Types**: `AttributedTextFormatting.ValueConstraint`

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

- `AttributeKey`

### Instance Methods

- `constrain(_:)`

### Type Aliases

- `AttributedTextValueConstraint.Attributes`

## See Also

- `bold(_:)`
- `italic(_:)`
- `underline(_:pattern:color:)`
- `strikethrough(_:pattern:color:)`
- `textCase(_:)`
- `textCase`
- `monospaced(_:)`
- `monospacedDigit()`
- `AttributedTextFormattingDefinition`
- `AttributedTextFormatting`
