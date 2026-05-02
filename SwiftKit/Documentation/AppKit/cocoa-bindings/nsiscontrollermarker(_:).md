---
url: https://developer.apple.com/documentation/appkit/nsiscontrollermarker(_:)
framework: AppKit
category: Cocoa bindings
title: NSIsControllerMarker(_:)
kind: func
captured: 2026-05-02
---

# NSIsControllerMarker(_:)

Tests whether a given object is special marker object used for indicating the state of a selection in relation to a key.

## Declaration

```swift
func NSIsControllerMarker(_ object: Any?) -> Bool
```

### Return Value

`true` if the object is one of the designated controller markers or `false` if it is not.

### Discussion

This function helps you to create bindings between user interface elements and controller objects. The Application Kit predefines several special marker objects used as values for indicating selection state; currently these are `NSMultipleValuesMarker`, `NSNoSelectionMarker`, and `NSNotApplicableMarker`. These markers are typed as `id` and only exist for the purpose of indicating a state; they are never archived and cannot be used as object values in controls. You use this function to test whether a given object value is a marker, in which case it is not directly assignable to the object that is bound. This check is important, especially since additional markers may be added in the future.

See the `NSKeyValueBinding.h` header file for further details.

## Parameters

- **object**: Specify the object you want to check. This parameter can be `nil`.





## Availability

- macOS ?



## See Also

- `NSDictionaryController`
- `NSDictionaryControllerKeyValuePair`
- `NSBindingName`
- `NSBindingOption`
- `NSBindingInfoKey`
- `NSKeyValueBindingCreation`
- `Binding dictionary keys`
