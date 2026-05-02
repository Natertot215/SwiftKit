---
url: https://developer.apple.com/documentation/swiftui/documentgrouplaunchscene
framework: SwiftUI
category: Documents
title: DocumentGroupLaunchScene
kind: struct
captured: 2026-05-02
---

# DocumentGroupLaunchScene

A launch scene for document-based applications.

## Declaration

```swift
struct DocumentGroupLaunchScene<Actions> where Actions : View
```

### Overview

You can use this launch scene alongside `DocumentGroup` scenes. If you don’t implement a `DocumentGroup` in the app declaration, you can get the same design by implementing a `DocumentLaunchView`.

If you don’t provide the title of the scene, it displays the application name. If you don’t provide the actions builder, the scene has the default “Create Document” action that creates new documents. To customize the document launch experience, you can replace the standard screen background and title, add decorative views, and add custom actions.

A `DocumentGroupLaunchScene` configures the document browser on the bottom sheet to open content types from all the document groups in the app definition. A `DocumentGroupLaunchScene` also configures the document groups to create documents of the first content type that your application can create and write.

For more information, see `FileDocument.writableContentTypes` and `ReferenceFileDocument.writableContentTypes`.





## Relationships

**Conforms To**: `Scene`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- visionOS 2.0

## Topics

### Initializers

- `init(_:_:background:)`
- `init(_:_:background:backgroundAccessoryView:)`
- `init(_:_:background:backgroundAccessoryView:overlayAccessoryView:)`
- `init(_:_:background:overlayAccessoryView:)`
- `init(_:backgroundStyle:_:)`
- `init(_:backgroundStyle:_:backgroundAccessoryView:)`
- `init(_:backgroundStyle:_:backgroundAccessoryView:overlayAccessoryView:)`
- `init(_:backgroundStyle:_:overlayAccessoryView:)`

## See Also

- `DocumentLaunchView`
- `DocumentLaunchGeometryProxy`
- `DefaultDocumentGroupLaunchActions`
- `NewDocumentButton`
- `DocumentBaseBox`
