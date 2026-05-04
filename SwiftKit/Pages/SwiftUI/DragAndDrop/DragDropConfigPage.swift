import SwiftUI

// SwiftUI drag-and-drop configuration types reference page.
// Covers: DragConfiguration, DropConfiguration, DragSession, DropSession,
//         DragDropPreviewsFormation, DropInfo, DropProposal, DropOperation
// Source: Documentation/SwiftUI/drag-and-drop/

struct DragDropConfigPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("DragConfiguration · DropConfiguration · DragSession · DragDropPreviewsFormation")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Advanced configuration types for the SwiftUI drag-and-drop system (macOS 26+).")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 26.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "DragConfiguration — configure a drag operation") {
            snippet("""
            // DragConfiguration lets you specify a drag session's behavior:
            let config = DragConfiguration(
                allowedOperations: [.copy, .move],
                previewsFormation: .stack
            )
            view.draggable(item, configuration: config)
            """)
            APICallout("DragConfiguration(allowedOperations:previewsFormation:)")
            Text("DragConfiguration is macOS 26.0+. It wraps options that were previously only accessible through AppKit's NSDraggingSession.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "DropConfiguration — configure a drop target") {
                snippet("""
                let dropConfig = DropConfiguration(
                    allowedOperations: [.copy],
                    isActive: true
                )
                view.dropDestination(for: String.self,
                                     configuration: dropConfig) { items, loc in
                    handle(items)
                    return true
                }
                """)
                Text("DropConfiguration refines which drag operations the drop target accepts, and whether it's currently active.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "DragDropPreviewsFormation — preview stacking") {
                snippet("""
                // Controls how multiple dragged items are arranged visually:
                DragDropPreviewsFormation.default  // system default
                DragDropPreviewsFormation.stack    // stacked at an angle
                DragDropPreviewsFormation.list     // vertical list
                DragDropPreviewsFormation.fan      // fanned out
                """)
                Text("DragDropPreviewsFormation is macOS 26+. Set it on DragConfiguration to control how multiple selected items look during the drag.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "DragSession — the active drag") {
                snippet("""
                // DragSession provides information about an in-progress drag:
                // Available in onDrag / DropDelegate / DragConfiguration callbacks
                session.items           // [NSItemProvider] being dragged
                session.allowedOperations // .copy, .move, .link, …
                session.draggingFrame   // CGRect of the drag in screen coords
                session.draggingFormation // current preview formation
                session.animatesToStartingPositionsOnCancelOrFail
                """)
                Text("DragSession is a protocol (backed by NSDraggingInfo on macOS) that surfaces drag metadata during an active operation.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "DropSession — the active drop") {
                snippet("""
                // DropSession is available in DropDelegate callbacks:
                func dropUpdated(info: DropInfo) -> DropProposal? {
                    let session = info.dropSession
                    if session.hasItemsConforming(to: [.plainText]) {
                        return DropProposal(operation: .copy)
                    }
                    return DropProposal(operation: .forbidden)
                }
                """)
                Text("DropSession wraps the drop information. Access it via DropInfo.dropSession inside DropDelegate methods.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "DropInfo — in DropDelegate") {
                snippet("""
                // DropInfo is passed to every DropDelegate method:
                info.location               // CGPoint — drop position in view
                info.dropSession            // DropSession
                info.hasItemsConforming(to:) // Bool — quick check
                info.itemProviders(for:)     // [NSItemProvider]
                """)
            }

            Block(title: "DropProposal — operation intent") {
                snippet("""
                // Return from dropUpdated(info:) to indicate the operation:
                DropProposal(operation: .copy)      // ⌥ badge
                DropProposal(operation: .move)      // no badge
                DropProposal(operation: .forbidden) // ⊘ badge
                DropProposal(operation: .generic)   // system default
                """)
                Text("The DropProposal you return from dropUpdated controls the cursor badge and the operation passed to performDrop.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("puzzlepiece", "DragConfiguration and DropConfiguration are macOS 26.0+ additions. For older targets, use the NSDraggingInfo / DropDelegate approach.")
            noteRow("square.stack.3d.up", "DragDropPreviewsFormation only affects the visual stacking of multi-item drags — it has no effect on single-item drags.")
            noteRow("info.circle", "DragSession and DropSession wrap AppKit's NSDraggingSession/NSDraggingInfo. You get them via DropDelegate callbacks or DragConfiguration handlers.")
            noteRow("arrow.triangle.branch", "DropOperation.move on macOS triggers the source to delete the original item — only use .move when both source and destination agree on ownership transfer.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    DragDropConfigPage().frame(width: 1100, height: 800)
}
