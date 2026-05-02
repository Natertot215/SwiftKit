---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityactions(category:_:)
framework: SwiftUI
category: Accessible controls
title: accessibilityActions(category:_:)
kind: method
captured: 2026-05-02
---

# accessibilityActions(category:_:)

Adds multiple accessibility actions to the view with a specific category. Actions allow assistive technologies, such as VoiceOver, to interact with the view by invoking the action and are grouped by their category. When multiple action modifiers with an equal category are applied to the view, the actions are combined together.

## Declaration

```swift
nonisolated func accessibilityActions<Content>(category: AccessibilityActionCategory, @ViewBuilder _ content: () -> Content) -> some View where Content : View

```

### Discussion

Var body: some View { EditorView() .accessibilityActions(category: .edit) { ForEach(editActions) { action in Button(action.title) { action() } } if hasTextSuggestions { Button(“Show Text Suggestions”) { presentTextSuggestions() } } } }

## Parameters

- **category**: The category the accessibility actions are grouped by.
- **content**: The accessibility actions added to the view.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `accessibilityAction(_:_:)`
- `accessibilityActions(_:)`
- `accessibilityAction(named:_:)`
- `accessibilityAction(action:label:)`
- `accessibilityAction(intent:label:)`
- `accessibilityAction(_:intent:)`
- `accessibilityAction(named:intent:)`
- `accessibilityAdjustableAction(_:)`
- `accessibilityScrollAction(_:)`
- `AccessibilityActionKind`
- `AccessibilityAdjustmentDirection`
- `AccessibilityActionCategory`
