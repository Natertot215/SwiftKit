import SwiftUI

struct DropSessionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "DropSession",
            docPath: "Documentation/SwiftUI/drag-and-drop/dropsession.md",
            availability: "macOS 26.0+",
            blurb: """
            Describes the ongoing drop session on the destination side.

            ## Overview

            DropSession exposes per-frame information for an in-progress drop on macOS 26+. It identifies the session, reports how many items are being transferred, surfaces a `localSession` value for in-app drags (so source and destination can coordinate without round-tripping through pasteboards), and reports the cursor location and current phase.

            ```swift
            // Inside a drop callback that receives a DropSession:
            if let local = session.localSession {
                // Same-app drag — read source state directly.
            }
            print(session.itemsCount, session.location, session.phase)
            ```

            DropSession conforms to `Identifiable`, `Copyable`, and `CustomDebugStringConvertible`. It has nested `DropSession.ID` and `DropSession.LocalSession` types.
            """,
            signatures: [
                "struct DropSession : Identifiable",
                "session.id           // DropSession.ID",
                "session.itemsCount   // number of items being dropped",
                "session.localSession // DropSession.LocalSession?",
                "session.location     // CGPoint of the drop",
                "session.phase        // current phase of the drop"
            ],
            notes: [
                "DropSession is macOS 26.0+ — distinct from DropInfo, which is the macOS 10.15-era DropDelegate companion.",
                "Use DropSession.localSession to detect in-app drags and short-circuit pasteboard work."
            ]
        )
    }
}

#Preview {
    DropSessionDescribePage()
        .frame(width: 900, height: 800)
}
