---
url: https://developer.apple.com/documentation/appkit/nsaccessibility
framework: AppKit
category: Deprecated symbols
title: NSAccessibility
kind: collectionGroup
captured: 2026-05-02
---

# NSAccessibility

A legacy, informal protocol that Apple doesn’t recommend for active use.



### Overview

The `NSAccessibility` informal protocol defines an old, key-based API. For the most part, Apple doesn’t recommend using this API. Use the method-based API in `NSAccessibilityProtocol` instead. However, there are a few methods and properties that are still relevant. You can combine the `NSObject-swift.class/accessibilityHitTest(_:)` method, and the `NSAccessibilityLayoutArea/accessibilityFocusedUIElement` and `NSObject-swift.class/accessibilityNotifiesWhenDestroyed` properties with the new `NSAccessibilityProtocol` protocol.









## Topics

### Available Methods and Properties

- `accessibilityFocusedUIElement`
- `accessibilityHitTest(_:)`
- `accessibilityNotifiesWhenDestroyed`

### Constants

- `Standard Attributes`
- `Text-Specific Attributes`
- `Text-Specific Parameterized Attributes`
- `Text Attributed-String Attributes and Constants`
- `Window-Specific Attributes`
- `App-Specific Attributes`
- `Grid View Attributes`
- `Table View and Outline View Attributes`
- `Outline View Attributes`
- `Cell-Based Table Attributes`
- `Cell-Based Table Parameterized Attributes`
- `Cell Attributes`
- `Layout Area Attributes`
- `Layout Area Parameterized Attributes`
- `Layout Item Attributes`
- `Slider Attributes`
- `Screen Matte Attributes`
- `Ruler View Attributes`
- `Linkage Elements`
- `Miscellaneous Attributes`
- `Column Sort Direction`
- `Measurement Unit Attributes`
- `Orientations`
- `Ruler Marker Type Values`
- `Actions`

### Deprecated

- `accessibilityActionDescription(_:)`
- `accessibilityActionNames()`
- `accessibilityArrayAttributeCount(_:)`
- `accessibilityArrayAttributeValues(_:index:maxCount:)`
- `accessibilityAttributeNames()`
- `accessibilityAttributeValue(_:)`
- `accessibilityAttributeValue(_:forParameter:)`
- `accessibilityIndex(ofChild:)`
- `accessibilityIsAttributeSettable(_:)`
- `accessibilityIsIgnored()`
- `accessibilityParameterizedAttributeNames()`
- `accessibilityPerformAction(_:)`
- `accessibilitySetOverrideValue(_:forAttribute:)`
- `accessibilitySetValue(_:forAttribute:)`

## See Also

- `NSEditorRegistration`
- `NSInputServiceProvider`
- `NSInputServerMouseTracker`
- `NSDrawerDelegate`
