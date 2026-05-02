---
url: https://developer.apple.com/documentation/swiftui/documentlaunchview
framework: SwiftUI
category: Documents
title: DocumentLaunchView
kind: struct
captured: 2026-05-02
---

# DocumentLaunchView

A view to present when launching document-related user experience.

## Declaration

```swift
struct DocumentLaunchView<Actions, DocumentView> where Actions : View, DocumentView : View
```

### Overview

> **NOTE:**  An alternative to `DocumentLaunchView` is a scene variant of this API: `DocumentGroupLaunchScene`. If the app definition contains `DocumentGroup` scenes, consider using a `DocumentGroupLaunchScene` instead of this view.

Configure `DocumentLaunchView` to open and display files and trigger custom actions.

For example, an application that offers writing books can present the `DocumentLaunchView` as its launch view:

```swift
public import UniformTypeIdentifiers

struct BookEditorLaunchView: View {

    var body: some View {
        DocumentLaunchView(for: [.book]) {
            NewDocumentButton("Start New Book")
        } onDocumentOpen: { url in
            BookEditor(url)
        }
    }
}

struct BookEditor: View {
    init(_ url: URL) { }
}

extension UTType {
    static let book = UTType(exportedAs: "com.example.bookEditor")
}
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 18.0
- iPadOS 18.0

## Topics

### Initializers

- `init(_:for:_:onDocumentOpen:)`
- `init(_:for:_:onDocumentOpen:background:)`
- `init(_:for:_:onDocumentOpen:background:backgroundAccessoryView:)`
- `init(_:for:_:onDocumentOpen:background:backgroundAccessoryView:overlayAccessoryView:)`
- `init(_:for:_:onDocumentOpen:background:overlayAccessoryView:)`
- `init(_:for:_:onDocumentOpen:backgroundAccessoryView:)`
- `init(_:for:_:onDocumentOpen:backgroundAccessoryView:overlayAccessoryView:)`
- `init(_:for:_:onDocumentOpen:overlayAccessoryView:)`
- `init(_:for:backgroundStyle:_:onDocumentOpen:)`
- `init(_:for:backgroundStyle:_:onDocumentOpen:backgroundAccessoryView:)`
- `init(_:for:backgroundStyle:_:onDocumentOpen:backgroundAccessoryView:overlayAccessoryView:)`
- `init(_:for:backgroundStyle:_:onDocumentOpen:overlayAccessoryView:)`

### Instance Properties

- `body`

## See Also

- `DocumentGroupLaunchScene`
- `DocumentLaunchGeometryProxy`
- `DefaultDocumentGroupLaunchActions`
- `NewDocumentButton`
- `DocumentBaseBox`
