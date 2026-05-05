import SwiftUI

struct DropProposalDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DropProposal",
            docPath: "Documentation/SwiftUI/drag-and-drop/dropproposal.md",
            availability: "macOS 10.15+",
            blurb: """
            The behavior of a drop.

            ## Overview

            A DropProposal is returned from `DropDelegate.dropUpdated(info:)` to tell the system what kind of drop will happen if the user releases the mouse here. The `operation` you propose drives the cursor badge the user sees.

            ```swift
            func dropUpdated(info: DropInfo) -> DropProposal? {
                if info.hasItemsConforming(to: [.plainText]) {
                    return DropProposal(operation: .copy)      // ⌥ badge
                }
                return DropProposal(operation: .forbidden)     // ⊘ badge
            }
            ```

            Use the `init(withinApplication:outsideApplication:)` initializer when the drop should resolve differently for in-app drags vs. cross-app drags.

            Conforms to `Copyable`, `CustomDebugStringConvertible`, `Escapable`, `Sendable`.
            """,
            signatures: [
                "struct DropProposal",
                "init(operation: DropOperation)",
                "init(withinApplication: DropOperation, outsideApplication: DropOperation)"
            ],
            notes: [
                "Return nil from dropUpdated(info:) to keep the previously proposed operation.",
                "The operation in the DropProposal you return becomes the operation passed to performDrop."
            ]
        )
    }
}

#Preview {
    DropProposalDescribePage()
        .frame(width: 900, height: 800)
}
