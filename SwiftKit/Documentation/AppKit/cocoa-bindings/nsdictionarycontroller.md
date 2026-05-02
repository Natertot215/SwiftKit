---
url: https://developer.apple.com/documentation/appkit/nsdictionarycontroller
framework: AppKit
category: Cocoa bindings
title: NSDictionaryController
kind: class
captured: 2026-05-02
---

# NSDictionaryController

A bindings-compatible controller that manages the display and editing of a dictionary of key-value pairs.

## Declaration

```swift
class NSDictionaryController
```

### Overview

`NSDictionaryController` transforms the contents of a dictionary into an array of key-value pairs that can be bound to user interface items such as the columns of an `NSTableView`.

The content of an `NSDictionaryController` instance is specified using the inherited method `NSObjectController/content` or by binding an `NSDictionary` instance to the `NSBindingName/contentDictionary` binding. New key/value pairs inserted into the dictionary are created using the `NSDictionaryController/newObject()` method. The initial key name is set to the string returned by `NSDictionaryController/initialKey` . The initial key name is copied to the newly inserted object, while the object returned by `NSDictionaryController/initialValue` is simply retained. As new items are inserted the controller enumerates the initial key name, resulting in key names such as “key”, “key1”, “key2”, and so on. This behavior can be customized by overriding `NSDictionaryController/newObject()`.

An `NSDictionaryController` instance can be configured to exclude specified keys in a dictionary from being returned by `NSArrayController/arrangedObjects` using the `NSDictionaryController/excludedKeys` property. Similarly, you can specify an array of key names that are always included in the arranged objects, even if they are not present in the content dictionary, using the `NSDictionaryController/includedKeys` property.

`NSDictionaryController` supports providing localized key names for the keys in the dictionary, allowing a user-friendly representation of the key name to be displayed. The localized key names are specified by a dictionary (using `NSDictionaryController/localizedKeyDictionary`) or by providing a strings table (using `NSDictionaryController/localizedKeyDictionary`).

The `NSArrayController/arrangedObjects` method returns an array of objects that implement the `NSDictionaryControllerKeyValuePair` informal protocol. User interface controls are bound to the arranged objects array using key paths such as: `arrangedObjects.key` (displays the key name), `arrangedObjects.value` (displays the value for the key), or `arrangedObjects.localizedKey` (displays the localized key name). See `NSDictionaryControllerKeyValuePair` for more information.

> **NOTE:**  You must enable the “Validates Immediately” option for the value binding of all controls that edit the key names or values returned by `NSArrayController/arrangedObjects`.

`NSDictionaryController` overrides `NSArrayController/arrangedObjects` to return an array of objects that implement the `NSDictionaryControllerKeyValuePair` informal protocol. For more information, see `NSDictionaryControllerKeyValuePair`.

The constants listed below are used to specify a binding to `NSObject-swift.class/bind(_:to:withKeyPath:options:)`, `NSObject-swift.class/infoForBinding(_:)`, `NSObject-swift.class/unbind(_:)`, and `NSObject-swift.class/valueClassForBinding(_:)`. For more information, see `cocoa-bindings`.

- `NSBindingName/contentDictionary`
- `NSBindingName/includedKeys`
- `NSBindingName/excludedKeys`
- `NSBindingName/localizedKeyDictionary`
- `NSBindingName/initialKey`
- `NSBindingName/initialValue`





## Relationships

**Inherits From**: `NSArrayController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSEditorRegistration`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.5

## Topics

### Arranging Objects

- `arrangedObjects`

### Creating New Entries

- `newObject()`

### Localizing Key Names

- `localizedKeyDictionary`
- `localizedKeyTable`

### Keys to Display

- `includedKeys`
- `excludedKeys`

### Setting Initial Key and Values

- `initialKey`
- `initialValue`

## See Also

- `NSDictionaryControllerKeyValuePair`
- `NSBindingName`
- `NSBindingOption`
- `NSBindingInfoKey`
- `NSIsControllerMarker(_:)`
- `NSKeyValueBindingCreation`
- `Binding dictionary keys`
