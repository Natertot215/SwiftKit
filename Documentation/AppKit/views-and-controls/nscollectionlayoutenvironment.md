---
url: https://developer.apple.com/documentation/appkit/nscollectionlayoutenvironment
framework: AppKit
category: Views and controls
title: NSCollectionLayoutEnvironment
kind: protocol
captured: 2026-05-02
---

# NSCollectionLayoutEnvironment

A protocol used to provide information about the layout’s container and environment traits, such as size classes and display scale factor.

## Declaration

```swift
@MainActor protocol NSCollectionLayoutEnvironment : NSObjectProtocol
```

### Overview

In a section provider, you use the layout environment to get information about the context that the layout appears in. You can get information about the layout’s container, such as its size and content insets, and the traits of its environment, such as size classes, display scale factor, and user interface idiom. You use this information while rendering the layout’s sections to help you make decisions about how to display the layout.

For example, the following code uses the layout environment’s trait collection to check whether the UI is in Dark Mode while creating the layout’s sections.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS 10.15

## Topics

### Getting the layout’s container

- `container`
