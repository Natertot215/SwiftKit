import SwiftUI

// SwiftUI drag-and-drop reference page.
// Covers: draggable(_:), draggable(_:preview:), dropDestination(for:action:isTargeted:),
//         onDrag(_:), onDrag(_:preview:), onDrop(of:isTargeted:perform:), onDrop(of:delegate:)
// Source: Documentation/SwiftUI/drag-and-drop/

struct DraggableAndDropPage: View {
    @State private var items = ["Apple", "Banana", "Cherry", "Date"]
    @State private var droppedHere: [String] = []
    @State private var dropTargeted = false

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("draggable · dropDestination · onDrag · onDrop")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Make views drag sources and drop destinations using Transferable.")
                .font(.callout).foregroundStyle(.secondary)
            Text("draggable / dropDestination macOS 13.0+ · onDrag / onDrop macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "draggable(_:) + dropDestination(for:action:isTargeted:)") {
            HStack(spacing: 20) {
                // Drag source
                VStack(alignment: .leading, spacing: 8) {
                    Text("Drag sources").font(.headline).foregroundStyle(.secondary)
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                            .draggable(item)
                    }
                }

                Image(systemName: "arrow.right")
                    .foregroundStyle(.secondary)

                // Drop destination
                VStack(alignment: .leading, spacing: 8) {
                    Text("Drop target").font(.headline).foregroundStyle(.secondary)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(dropTargeted ? Color.accentColor.opacity(0.15) : Color.secondary.opacity(0.1))
                        .frame(width: 180, height: 120)
                        .overlay {
                            if droppedHere.isEmpty {
                                Text("Drop here").foregroundStyle(.secondary)
                            } else {
                                VStack(alignment: .leading, spacing: 4) {
                                    ForEach(droppedHere.suffix(4), id: \.self) { item in
                                        Text(item)
                                            .font(.caption)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 3)
                                            .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 4))
                                    }
                                }
                                .padding(8)
                            }
                        }
                        .dropDestination(for: String.self) { dropped, _ in
                            droppedHere.append(contentsOf: dropped)
                            return true
                        } isTargeted: { targeted in
                            dropTargeted = targeted
                        }
                }
            }
            APICallout(
                ".draggable(item)\n.dropDestination(for: String.self) { dropped, _ in … } isTargeted: { t in … }"
            )
            Text("Drag a fruit name onto the drop target. The isTargeted closure updates dropTargeted to show the highlight.")
                .font(.footnote).foregroundStyle(.secondary)
            if !droppedHere.isEmpty {
                Button("Clear") { droppedHere = [] }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "draggable(_:preview:) — custom drag preview") {
                snippet("""
                Text("Drag me")
                    .draggable("payload") {
                        // Custom preview shown under the cursor:
                        Label("Dragging…", systemImage: "doc")
                            .padding(8)
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 8))
                    }
                """)
                Text("The trailing closure is a @ViewBuilder for the visual drag preview. If omitted, SwiftUI uses a snapshot of the view.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onDrag(_:) — legacy NSItemProvider-based drag") {
                snippet("""
                Text("Legacy drag")
                    .onDrag {
                        NSItemProvider(object: "payload" as NSString)
                    }
                // Use draggable(_:) + Transferable instead for new code.
                """)
                Text("onDrag(_:) is the pre-macOS 13 drag API using NSItemProvider. Prefer draggable(_:) with Transferable for new code.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onDrop(of:isTargeted:perform:) — legacy drop") {
                snippet("""
                view.onDrop(
                    of: [.plainText],
                    isTargeted: $isTargeted
                ) { providers in
                    providers.first?.loadObject(ofClass: String.self) { str, _ in
                        DispatchQueue.main.async { handle(str) }
                    }
                    return true
                }
                """)
                Text("onDrop(of:isTargeted:perform:) uses UTType and NSItemProvider — older API. Use dropDestination(for:) with Transferable instead.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onDrop(of:delegate:) — custom DropDelegate") {
                snippet("""
                struct MyDelegate: DropDelegate {
                    func performDrop(info: DropInfo) -> Bool { … }
                    func dropEntered(info: DropInfo) { … }
                    func dropExited(info: DropInfo) { … }
                    func dropUpdated(info: DropInfo) -> DropProposal? {
                        DropProposal(operation: .copy)
                    }
                    func validateDrop(info: DropInfo) -> Bool { true }
                }
                view.onDrop(of: [.plainText], delegate: MyDelegate())
                """)
                Text("DropDelegate gives full control over enter/exit/update/validate/perform phases. DropInfo provides the session location and item providers. DropProposal selects the drop operation (.copy, .move, .forbidden, .generic).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "itemProvider(_:) — custom item provider for standard drag") {
                snippet("""
                // Apply to a view that's already a drag source via List reordering:
                ForEach(items) { item in
                    Row(item)
                        .itemProvider { NSItemProvider(object: item.id as NSString) }
                }
                """)
                Text("itemProvider(_:) overrides the item provider used by system drag interactions (e.g., List reorder drags).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "springLoadingBehavior(_:)") {
                snippet("""
                dropTarget
                    .springLoadingBehavior(.enabled)   // default for most controls
                    .springLoadingBehavior(.disabled)  // turn off spring loading
                """)
                Text("Spring loading lets users drag over a folder/button and hover to trigger navigation. Enabled by default on controls that support it.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "DropOperation values") {
                snippet("""
                DropOperation.copy     // copies the item
                DropOperation.move     // moves the item
                DropOperation.forbidden// shows a ⊘ cursor — drop not allowed
                DropOperation.generic  // platform-default operation
                """)
            }

            Block(title: "Transferable conformance requirement") {
                snippet("""
                // Your type must conform to Transferable:
                struct Contact: Transferable {
                    var name: String
                    static var transferRepresentation: some TransferRepresentation {
                        CodableRepresentation(contentType: .contact)
                    }
                }
                // Then:
                view.draggable(contact)
                view.dropDestination(for: Contact.self) { … }
                """)
                Text("draggable(_:) and dropDestination(for:) require the transferred type to conform to Transferable. Built-in types like String, URL, Image conform already.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("arrow.up.and.down", "draggable / dropDestination (macOS 13+) are the modern Transferable-based APIs. onDrag / onDrop are NSItemProvider-based and still work but are harder to use.")
            noteRow("eye", "isTargeted in dropDestination and onDrop lets you visually highlight the drop zone — change the background color when targeted is true.")
            noteRow("doc.on.doc", "Multiple Transferable representations can be layered (CodableRepresentation + ProxyRepresentation) so the payload works in different apps.")
            noteRow("exclamationmark.triangle", "DropDelegate.dropUpdated(info:) is called every time the drag moves — keep it fast. Return nil to keep the last proposed operation.")
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
    DraggableAndDropPage().frame(width: 1100, height: 900)
}
