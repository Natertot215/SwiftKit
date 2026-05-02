---
url: https://developer.apple.com/documentation/appkit/nsuserinterfaceitemsearching
framework: AppKit
category: App structure
title: NSUserInterfaceItemSearching
kind: protocol
captured: 2026-05-02
---

# NSUserInterfaceItemSearching

A set of methods an app can implement to provide Spotlight for Help for its own custom help data.

## Declaration

```swift
protocol NSUserInterfaceItemSearching : NSObjectProtocol
```

### Overview

In general, users find the Help search functionality very useful. However, many large apps don’t use Apple Help API because of cross platform requirements, which means that some important Help topics are not presented as part of the Help menu. This API allows developers to incorporate their own Help topics and take full advantage of the Help feature.

In your app, you implement the `NSUserInterfaceItemSearching` protocol and then register your object with `NSApplication/registerUserInterfaceItemSearchHandler(_:)`.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Show Help Menu

- `localizedTitles(forItem:)`
- `showAllHelpTopics(forSearch:)`

### Search Help Content

- `searchForItems(withSearch:resultLimit:matchedItemHandler:)`
- `performAction(forItem:)`

## See Also

- `NSHelpManager`
