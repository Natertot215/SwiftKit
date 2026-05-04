import SwiftUI

struct AdoptingDragAndDropDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Adopting Drag and Drop Using SwiftUI",
            docPath: "Documentation/SwiftUI/drag-and-drop/adopting-drag-and-drop-using-swiftui.md",
            availability: "macOS 13.0+",
            blurb: """
            Enable drag-and-drop interactions in lists, tables and custom views.

            ## Overview

            This sample code project demonstrates how a SwiftUI view can act as a drag source or drop destination.

            To enable drag interactions, add the draggable(_:) modifier to a view to send or receive Transferable items within an app, among a collection of your own apps, or between your apps and others that support the import or export of a specified data format. To handle dropped content, use the dropDestination(for:action:isTargeted:) modifier to receive the expected dropped item.

            In the sample app, people can drag a contact from a list of contacts and drop it into another app such as Contacts, Notes, or Messages. Additionally, people can drag and drop new contacts from other apps into the sample app.

            ## Enable Drag Interactions

            Add the draggable(_:) modifier to a view to send items that conform to the Transferable protocol:

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

            When someone drags a contact, the app uses the draggable(_:preview:) modifier to define a custom preview for the dragged item.

            ## Enable Drop Interactions

            Use the dropDestination(for:action:isTargeted:) modifier to receive dragged items and define the destination that handles the dropped content:

            ```swift
            .dropDestination(for: Contact.self) { droppedContacts, index in
                dataModel.handleDroppedContacts(droppedContacts: droppedContacts, index: index)
            }
            ```

            ## Transfer Representations

            The Transferable protocol describes how you serialize and deserialize your model object for sharing and data transfer. It provides a transfer representation by composing built-in TransferRepresentation types:

            ```swift
            static var transferRepresentation: some TransferRepresentation {
                // Custom content type transfer
                CodableRepresentation(contentType: .exampleContact)
                // vCard import/export
                DataRepresentation(contentType: .vCard) { contact in
                    try contact.toVCardData()
                } importing: { data in
                    try await parseVCardData(data)
                }
                .suggestedFileName { $0.fullName }
                // String proxy
                ProxyRepresentation { contact in contact.phoneNumber }
            }
            ```

            ## Handling Dropped Contacts

            The handler checks whether the dropped item already exists (and moves it) or is new (and inserts it):

            ```swift
            func handleDroppedContacts(droppedContacts: [Contact], index: Int? = nil) {
                guard let firstContact = droppedContacts.first else { return }
                if let existingIndex = contacts.firstIndex(where: { $0.id == firstContact.id }) {
                    let indexSet = IndexSet(integer: existingIndex)
                    contacts.move(fromOffsets: indexSet, toOffset: index ?? contacts.endIndex)
                } else {
                    contacts.insert(firstContact, at: index ?? contacts.endIndex)
                }
            }
            ```
            """,
            notes: [
                "Full article: Documentation/SwiftUI/drag-and-drop/adopting-drag-and-drop-using-swiftui.md",
                "See also: Making a View into a Drag Source (Documentation/SwiftUI/drag-and-drop/making-a-view-into-a-drag-source.md)."
            ]
        )
    }
}

#Preview {
    AdoptingDragAndDropDescribePage()
        .frame(width: 900, height: 900)
}
