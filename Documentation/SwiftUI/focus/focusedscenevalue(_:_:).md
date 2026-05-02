---
url: https://developer.apple.com/documentation/swiftui/view/focusedscenevalue(_:_:)
framework: SwiftUI
category: Focus
title: focusedSceneValue(_:_:)
kind: method
captured: 2026-05-02
---

# focusedSceneValue(_:_:)

Modifies this view by injecting a value that you provide for use by other views whose state depends on the focused scene.

## Declaration

```swift
nonisolated func focusedSceneValue<T>(_ keyPath: WritableKeyPath<FocusedValues, T?>, _ value: T) -> some View

```

### Return Value

A modified representation of this view.

### Discussion

Use this method instead of `View/focusedValue(_:_:)` for values that must be visible regardless of where focus is located in the active scene. For example, if an app needs a command for moving focus to a particular text field in the sidebar, it could use this modifier to publish a button action that’s visible to command views as long as the scene is active, and regardless of where focus happens to be in it.

```swift
struct Sidebar: View {
    @FocusState var isFiltering: Bool

    var body: some View {
        VStack {
            TextField(...)
                .focused(when: $isFiltering)
                .focusedSceneValue(\.filterAction) {
                    isFiltering = true
                }
        }
    }
}

struct NavigationCommands: Commands {
    @FocusedValue(\.filterAction) var filterAction

    var body: some Commands {
        CommandMenu("Navigate") {
            Button("Filter in Sidebar") {
                filterAction?()
            }
        }
        .disabled(filterAction == nil)
    }
}

extension FocusedValues {
    @Entry var filterAction: (() -> Void)?
}
```

## Parameters

- **keyPath**: The key path to associate `value` with when adding it to the existing table of published focus values.
- **value**: The focus value to publish.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `focusedValue(_:)`
- `focusedValue(_:_:)`
- `focusedSceneValue(_:)`
- `FocusedValues`
