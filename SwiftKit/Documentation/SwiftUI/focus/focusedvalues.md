---
url: https://developer.apple.com/documentation/swiftui/focusedvalues
framework: SwiftUI
category: Focus
title: FocusedValues
kind: struct
captured: 2026-05-01
---

# FocusedValues

## Declaration

```swift
struct FocusedValues
```

## Abstract

A collection of state exported by the focused scene or view and its ancestors.

## Discussion

### Creating Custom Focused Values

Use the `Entry` macro to create custom focused values by extending `FocusedValues` with new properties:

```swift
extension FocusedValues {
    @Entry var focusedDocument: Binding<MyDocument>?
}
```

The `Entry` macro automatically generates the underlying key type and provides the getter and setter for the focused value. Since the default value for focused values is always `nil`, all focused values must be optional.

### Publishing Values in Your Views

Views publish focused values using the `focusedValue(_:_:)` modifier:

```swift
struct DocumentCellView: View {
    @Binding var document: MyDocument

    var body: some View {
        Text("Document Content")
            .focusedValue(\.focusedDocument, $document)
    }
}
```

For scene-wide values that should be available depending on the focused scene, use `focusedSceneValue(_:_:)`:

```swift
struct DocumentViewer: View {
    @Binding var document: MyDocument

    var body: some View {
        Text("Document Content")
            .focusedSceneValue(\.focusedDocument, $document)
    }
}
```

### Accessing the current focused value

Use the `FocusedValue` property wrapper in your `App` or `View` to read the current value in the `body`. The `FocusedBinding` can be used as a convenient way to access the `wrappedValue` if the value type of the focused value is a `Binding`:

```swift
@main
struct DocumentApp: App {
    @FocusedBinding(\.focusedDocument) var currentDocument: MyDocument?

    var body: some Scene {
        DocumentGroup(newDocument: MyDocument()) { file in
            ContentView(document: file.$document)
                .focusedValue(\.focusedDocument, file.$document)
        }
        .commands {
            CommandGroup(after: .undoRedo) {
                Button("Increment") {
                    currentDocument?.value += 1
                }.disabled(currentDocument == nil)
            }
        }
    }
}
```

## Availability

- iOS 14.0+
- iPadOS 14.0+
- Mac Catalyst 14.0+
- macOS 11.0+
- tvOS 14.0+
- visionOS 1.0+
- watchOS 7.0+

## Conforms To

- `Copyable`
- `Equatable`
- `Escapable`

## See Also

- `FocusedValue`
- `FocusedBinding`
- `View.focusedValue(_:_:)`
- `View.focusedSceneValue(_:_:)`
