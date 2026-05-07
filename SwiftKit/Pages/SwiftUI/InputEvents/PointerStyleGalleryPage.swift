import SwiftUI

struct PointerStyleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".pointerStyle(.default)",
                api: ".pointerStyle(.default)"
            ) {
                pointerSwatch("Default", style: .default)
            }

            VariantTile(
                name: ".pointerStyle(.link)",
                api: ".pointerStyle(.link)"
            ) {
                pointerSwatch("Link", style: .link)
            }

            VariantTile(
                name: ".pointerStyle(.grabIdle)",
                api: ".pointerStyle(.grabIdle)"
            ) {
                pointerSwatch("Grab", style: .grabIdle)
            }

            VariantTile(
                name: ".pointerStyle(.zoomIn)",
                api: ".pointerStyle(.zoomIn)"
            ) {
                pointerSwatch("Zoom in", style: .zoomIn)
            }

            VariantTile(
                name: ".pointerStyle(.zoomOut)",
                api: ".pointerStyle(.zoomOut)"
            ) {
                pointerSwatch("Zoom out", style: .zoomOut)
            }

            VariantTile(
                name: ".pointerStyle(.horizontalText)",
                api: ".pointerStyle(.horizontalText)"
            ) {
                pointerSwatch("I-beam", style: .horizontalText)
            }

            ReferenceTile(
                name: "PointerStyle",
                signature: "struct PointerStyle",
                note: "Customizes the system pointer's appearance over a view. Replaces NSCursor calls inside SwiftUI hierarchies — no NSViewRepresentable required."
            )

            ReferenceTile(
                name: "Built-in styles",
                signature: ".default  ·  .link  ·  .grabIdle  ·  .grabActive  ·  .zoomIn  ·  .zoomOut  ·  .horizontalText  ·  .verticalText  ·  .rectSelection",
                note: "Built-in pointer styles. .grabIdle / .grabActive form a pair for drag-handle controls; .zoomIn / .zoomOut suit magnifier UI."
            )

            ReferenceTile(
                name: "Resize cursors",
                signature: ".columnResize(directions:)  ·  .rowResize(directions:)  ·  .frameResize(position:directions:)",
                note: "Direction-aware resize cursors for split views, table columns, and resizable subviews. Pass an Edge.Set or HorizontalEdge.Set to constrain which directions the resize is valid."
            )

            ReferenceTile(
                name: "Custom shapes & images",
                signature: ".image(_:hotSpot:)  ·  .shape(_:eoFill:size:)",
                note: ".image takes an NSImage plus a hot-spot point. .shape takes a SwiftUI Shape and renders it as the cursor at the requested size — useful for crosshair / paint-tool cursors."
            )

            ReferenceTile(
                name: "View.pointerVisibility(_:)",
                signature: "func pointerVisibility(_ visibility: Visibility) -> some View",
                note: "Toggles the system cursor's visibility over a view. Pass .hidden over a custom drawing canvas where the cursor would distract; .automatic restores default behavior."
            )
        }
    }

    private func pointerSwatch(_ label: String, style: PointerStyle) -> some View {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
            .fill(.background.secondary)
            .overlay(
                Text(label)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
            .frame(width: 140, height: 60)
            .pointerStyle(style)
    }
}

extension PointerStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.pointerStyle",
        title: "PointerStyle",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "PointerStyle",
            "View/pointerStyle(_:)",
            "View/pointerVisibility(_:)"
        ],
        blurb: "Customizes the pointer's appearance over a view. Built-in styles (.default, .link, .text, .horizontalText, .grabIdle, .grabActive, .frameResize, .columnResize, .rowResize, .zoomIn, .zoomOut) plus visibility control via pointerVisibility.",
        signature: "struct PointerStyle",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/input-events/pointerstyle.md",
        page: { AnyView(PointerStyleGalleryPage()) }
    )
}

#Preview {
    PointerStyleGalleryPage()
        .frame(width: 900, height: 700)
}
