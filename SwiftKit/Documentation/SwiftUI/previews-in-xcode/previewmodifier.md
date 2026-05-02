---
url: https://developer.apple.com/documentation/swiftui/previewmodifier
framework: SwiftUI
category: Previews in Xcode
title: PreviewModifier
kind: protocol
captured: 2026-05-02
---

# PreviewModifier

A type that defines an environment in which previews can appear.

## Declaration

```swift
@MainActor protocol PreviewModifier
```

### Overview

Conforming types can define shared contexts that will be cached by the preview system, then reused across participating previews. For example, you might create a model container here and populate it with sample data; in your `body` method you would then apply it to the preview using the `.modelContainer` view modifier.

```swift
struct SampleData: PreviewModifier {
    static func makeSharedContext() throws -> ModelContainer {
        let container = try ModelContainer(for: Snack.self)
        container.mainContext.insert(Snack.potatoChips)
        return container
    }

    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
 }
```

Use the `.modifier` preview trait to attach modifiers to a preview.

```swift
#Preview(traits: .modifier(SampleData())) {
    @Previewable @Query var snacks: [Snack]
    return SnackView(snack: snacks.first!)
}
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Associated Types

- `Body`
- `Context`

### Instance Methods

- `body(content:context:)`

### Type Aliases

- `PreviewModifier.Content`

### Type Methods

- `makeSharedContext()`

## See Also

- `Previewable()`
- `PreviewProvider`
- `PreviewPlatform`
- `previewDisplayName(_:)`
- `PreviewModifierContent`
