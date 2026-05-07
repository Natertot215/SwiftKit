---
url: https://developer.apple.com/documentation/swiftui/adopting-drag-and-drop-using-swiftui
framework: SwiftUI
category: Drag and drop
title: Adopting drag and drop using SwiftUI
kind: article
captured: 2026-05-01
---

# Adopting Drag and Drop Using SwiftUI

## Abstract
Enable drag-and-drop interactions in lists, tables and custom views.

## Overview
This sample code project demonstrates how a SwiftUI view can act as a drag source or drop destination.

To enable drag interactions, add the `draggable(_:)` modifier to a view to send or receive `Transferable` items within an app, among a collection of your own apps, or between your apps and others that support the import or export of a specified data format. To handle dropped content, use the `dropDestination(for:action:isTargeted:)` modifier to receive the expected dropped item.

In the sample app, people can drag a contact from a list of contacts and drop it into another app such as Contacts, Notes, or Messages. Additionally, people can drag and drop new contacts from other apps, like Contacts or Notes, into the sample app.

On iPad, people can use this sample with a second app such as Contacts or Notes in Split View. People can drag a row from this app into Contacts or drag a contact from Contacts into this app.

## Enable Drag Interactions

To enable dragging, add the `draggable(_:)` modifier to a view to send items that conform to `Transferable` protocol.

```swift
List {
    ForEach(dataModel.contacts) { contact in
        NavigationLink {
            ContactDetailView(contact: contact)
        } label: {
            CompactContactView(contact: contact)
                .draggable(contact) {
                    ThumbnailView(contact: contact)
                }
        }
    }
}
```

When someone drags a contact from a list of contacts, the app uses the `draggable(_:preview:)` modifier to define a custom preview for the dragged item.

## Enable Drop Interactions

Use the `dropDestination(for:action:isTargeted:)` modifier to receive dragged items and define the destination that handles the dropped content.

```swift
.dropDestination(for: Contact.self) { droppedContacts, index in
    dataModel.handleDroppedContacts(droppedContacts: droppedContacts, index: index)
}
```

The modifier expects a type `Contact` which conforms to the `Transferable` protocol. The implementation uses `transferRepresentation` to receive a dragged item representing the dropped contact information.

### Transfer Representations

```swift
static var transferRepresentation: some TransferRepresentation {
    // Allows a Contact to be transferred with a custom content type.
    CodableRepresentation(contentType: .exampleContact)
    // Allows importing and exporting Contact data as a vCard.
    DataRepresentation(contentType: .vCard) { contact in
        try contact.toVCardData()
    } importing: { data in
        try await parseVCardData(data)
    }
    .suggestedFileName { $0.fullName }
    // Enables exporting the `phoneNumber` string as a proxy for the entire `Contact`.
    ProxyRepresentation { contact in
        contact.phoneNumber
    } importing: { value in
        Contact(id: UUID().uuidString, givenName: value, familyName: "", phoneNumber: "")
    }
}
```

### Handling Dropped Contacts

```swift
func handleDroppedContacts(droppedContacts: [Contact], index: Int? = nil) {
    guard let firstContact = droppedContacts.first else {
        return
    }
    if let existingIndex = contacts.firstIndex(where: { $0.id == firstContact.id }) {
        let indexSet = IndexSet(integer: existingIndex)
        contacts.move(fromOffsets: indexSet, toOffset: index ?? contacts.endIndex)
    } else {
        contacts.insert(firstContact, at: index ?? contacts.endIndex)
    }
}
```

## Availability

| Platform | Version |
|----------|---------|
| iOS | 18.0+ |
| iPadOS | 18.0+ |
| Mac Catalyst | 18.0+ |
| macOS | 15.0+ |
| visionOS | 2.0+ |
| Xcode | 16.0+ |

## See Also
- Making a view into a drag source
