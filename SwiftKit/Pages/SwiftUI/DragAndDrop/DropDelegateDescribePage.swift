import SwiftUI

struct DropDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DropDelegate",
            docPath: "Documentation/SwiftUI/drag-and-drop/dropdelegate.md",
            availability: "macOS 10.15+",
            blurb: """
            An interface that you implement to interact with a drop operation in a view modified to accept drops.

            ## Overview

            The DropDelegate protocol provides a comprehensive and flexible way to interact with a drop operation. Specify a drop delegate when you modify a view to accept drops with the `View/onDrop(of:delegate:)` method.

            Alternatively, for simple drop cases that don't require the full functionality of a drop delegate, you can modify a view to accept drops using the `View/onDrop(of:isTargeted:perform:)` method. This method handles the drop using a closure you provide as part of the modifier.

            ## Drop lifecycle methods

            ```swift
            struct MyDelegate: DropDelegate {
                func dropEntered(info: DropInfo)            // cursor entered drop region
                func dropExited(info: DropInfo)             // cursor left drop region
                func dropUpdated(info: DropInfo) -> DropProposal? // called continuously; return nil to keep last proposal
                func validateDrop(info: DropInfo) -> Bool   // confirm drop is allowed
                func performDrop(info: DropInfo) -> Bool    // commit the drop; return true on success
            }
            ```

            DropDelegate.dropUpdated(info:) is called every time the drag moves — keep it fast. Return nil to keep the last proposed operation.
            """,
            signatures: [
                "@MainActor @preconcurrency protocol DropDelegate",
                "view.onDrop(of: [.plainText], delegate: MyDelegate())"
            ],
            notes: [
                "Pair with onDrop(of:delegate:) to receive the full lifecycle.",
                "For simple cases, prefer onDrop(of:isTargeted:perform:) or the modern dropDestination(for:action:isTargeted:)."
            ]
        )
    }
}

#Preview {
    DropDelegateDescribePage()
        .frame(width: 900, height: 800)
}
