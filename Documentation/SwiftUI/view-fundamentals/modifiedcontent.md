---
url: https://developer.apple.com/documentation/swiftui/modifiedcontent
framework: SwiftUI
category: View fundamentals
title: ModifiedContent
kind: struct
captured: 2026-05-02
---

# ModifiedContent

A value with a modifier applied to it.

## Declaration

```swift
@frozen struct ModifiedContent<Content, Modifier>
```







## Relationships

**Conforms To**: `Animatable`, `Chart3DContent`, `Copyable`, `CustomHoverEffect`, `DynamicMapContent`, `DynamicTableRowContent`, `DynamicViewContent`, `Equatable`, `Escapable`, `HoverEffectContent`, `MapContent`, `Scene`, `Sendable`, `SendableMetatype`, `TableRowContent`, `View`, `ViewModifier`, `VisualEffect`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a modified content view

- `init(content:modifier:)`
- `content`
- `modifier`

### Instance Methods

- `accessibility(activationPoint:)`
- `accessibility(addTraits:)`
- `accessibility(hidden:)`
- `accessibility(hint:)`
- `accessibility(identifier:)`
- `accessibility(inputLabels:)`
- `accessibility(label:)`
- `accessibility(removeTraits:)`
- `accessibility(selectionIdentifier:)`
- `accessibility(sortPriority:)`
- `accessibility(value:)`
- `accessibilityAction(_:_:)`
- `accessibilityAction(_:intent:)`
- `accessibilityAction(named:_:)`
- `accessibilityAction(named:intent:)`
- `accessibilityActivationPoint(_:)`
- `accessibilityActivationPoint(_:isEnabled:)`
- `accessibilityAddTraits(_:)`
- `accessibilityAdjustableAction(_:)`
- `accessibilityCustomContent(_:_:importance:)`
- `accessibilityDirectTouch(_:options:)`
- `accessibilityDragPoint(_:description:)`
- `accessibilityDragPoint(_:description:isEnabled:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityHeading(_:)`
- `accessibilityHidden(_:)`
- `accessibilityHidden(_:isEnabled:)`
- `accessibilityHint(_:)`
- `accessibilityHint(_:isEnabled:)`
- `accessibilityIdentifier(_:)`
- `accessibilityIdentifier(_:isEnabled:)`
- `accessibilityInputLabels(_:)`
- `accessibilityInputLabels(_:isEnabled:)`
- `accessibilityLabel(_:)`
- `accessibilityLabel(_:isEnabled:)`
- `accessibilityRemoveTraits(_:)`
- `accessibilityRespondsToUserInteraction(_:)`
- `accessibilityRespondsToUserInteraction(_:isEnabled:)`
- `accessibilityScrollAction(_:)`
- `accessibilityScrollStatus(_:isEnabled:)`
- `accessibilitySortPriority(_:)`
- `accessibilityTextContentType(_:)`
- `accessibilityValue(_:)`
- `accessibilityValue(_:isEnabled:)`
- `accessibilityZoomAction(_:)`

## See Also

- `Configuring views`
- `Reducing view modifier maintenance`
- `modifier(_:)`
- `ViewModifier`
- `EmptyModifier`
- `EnvironmentalModifier`
- `ManipulableModifier`
- `ManipulableResponderModifier`
- `ManipulableTransformBindingModifier`
- `ManipulationGeometryModifier`
- `ManipulationGestureModifier`
- `ManipulationUsingGestureStateModifier`
- `Manipulable`
