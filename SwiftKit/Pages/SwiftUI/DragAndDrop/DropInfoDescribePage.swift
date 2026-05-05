import SwiftUI

struct DropInfoDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DropInfo",
            docPath: "Documentation/SwiftUI/drag-and-drop/dropinfo.md",
            availability: "macOS 10.15+",
            blurb: """
            The current state of a drop.

            ## Overview

            DropInfo is passed to every method on `DropDelegate`. It surfaces:
            - the current drop **location** in the view's coordinate space,
            - whether the drag has items conforming to one or more uniform type identifiers, and
            - the matching `NSItemProvider` instances when you're ready to consume them.

            ```swift
            func performDrop(info: DropInfo) -> Bool {
                guard info.hasItemsConforming(to: [.plainText]) else { return false }
                for provider in info.itemProviders(for: [.plainText]) {
                    provider.loadObject(ofClass: String.self) { value, _ in
                        if let s = value as? String { handle(s) }
                    }
                }
                return true
            }
            ```

            Use `dropUpdated(info:)` to inspect the live drag location and return the appropriate `DropProposal` for the cursor badge.
            """,
            signatures: [
                "struct DropInfo",
                "info.location                   // CGPoint of the drop in view coords",
                "info.hasItemsConforming(to: [UTType])",
                "info.itemProviders(for: [UTType]) // [NSItemProvider]"
            ],
            notes: [
                "DropInfo is read-only — produced by the system and handed to your DropDelegate methods.",
                "Some accessors on DropInfo are deprecated in favor of the modern Transferable / dropDestination flow."
            ]
        )
    }
}

#Preview {
    DropInfoDescribePage()
        .frame(width: 900, height: 800)
}
