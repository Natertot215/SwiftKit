---
url: https://developer.apple.com/documentation/appkit/nsbindingoption
framework: AppKit
category: Cocoa bindings
title: NSBindingOption
kind: struct
captured: 2026-05-02
---

# NSBindingOption


## Declaration

```swift
struct NSBindingOption
```

### Discussion

Values that are used as keys in the options dictionary passed to the `NSObject-swift.class/bind(_:to:withKeyPath:options:)` method.

These keys are also used in the dictionary returned as the `NSBindingInfoKey/options` value of `NSObject-swift.class/infoForBinding(_:)`. For more information, see `cocoa-bindings`.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Binding Options

- `allowsEditingMultipleValuesSelection`
- `allowsNullArgument`
- `alwaysPresentsApplicationModalAlerts`
- `conditionallySetsEditable`
- `conditionallySetsEnabled`
- `conditionallySetsHidden`
- `contentPlacementTag`
- `continuouslyUpdatesValue`
- `createsSortDescriptor`
- `deletesObjectsOnRemove`
- `displayName`
- `displayPattern`
- `handlesContentAsCompoundValue`
- `insertsNullPlaceholder`
- `invokesSeparatelyWithArrayObjects`
- `multipleValuesPlaceholder`
- `noSelectionPlaceholder`
- `notApplicablePlaceholder`
- `nullPlaceholder`
- `predicateFormat`
- `raisesForNotApplicableKeys`
- `selectorName`
- `selectsAllWhenSettingContent`
- `validatesImmediately`
- `valueTransformer`
- `valueTransformerName`

### Initializers

- `init(rawValue:)`

## See Also

- `NSDictionaryController`
- `NSDictionaryControllerKeyValuePair`
- `NSBindingName`
- `NSBindingInfoKey`
- `NSIsControllerMarker(_:)`
- `NSKeyValueBindingCreation`
- `Binding dictionary keys`
