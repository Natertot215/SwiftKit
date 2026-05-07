import SwiftUI

struct CompositorContentGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Reference

            ReferenceTile(
                name: "CompositorContent",
                signature: "@MainActor protocol CompositorContent",
                note: "Protocol describing renderable content composed by SwiftUI's compositor. Conforming types declare a `body` of further compositor content, mirroring the View protocol's compositional shape.",
                badge: "macOS 26+"
            )

            ReferenceTile(
                name: "CompositorContentBuilder",
                signature: "@resultBuilder struct CompositorContentBuilder",
                note: "Result builder that lets compositor-content `body` properties declare their content imperatively — same authoring shape as `@ViewBuilder` for SwiftUI views.",
                badge: "macOS 26+"
            )

            ReferenceTile(
                name: "AnyCompositorContent",
                signature: "@frozen struct AnyCompositorContent : CompositorContent",
                note: "Type-erased wrapper for compositor content. Use it to store heterogeneous content nodes in collections or to return varying content from a single property.",
                badge: "macOS 26+"
            )

            ReferenceTile(
                name: "Authoring pattern",
                signature: "struct MyContent: CompositorContent { var body: some CompositorContent { ... } }",
                note: "Compositor-content types compose like Views — a `body` returning further compositor content, with the result builder collecting child nodes."
            )

            ReferenceTile(
                name: "Why no live demo?",
                signature: "// macOS 26 compositor content has no general-purpose visual surface",
                note: "CompositorContent is a foundation protocol with no canvas of its own — concrete usage depends on platform-specific compositors. Consult Apple's macOS 26 documentation for renderable conformers."
            )
        }
    }
}

extension CompositorContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.compositorContent",
        title: "CompositorContent",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "CompositorContent",
            "CompositorContentBuilder",
            "AnyCompositorContent"
        ],
        blurb: "Protocol family describing renderable content composed by SwiftUI's compositor — paired with its result builder and a type-erased AnyCompositorContent value for dynamic content trees.",
        signature: "@MainActor protocol CompositorContent",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/compositorcontent.md",
        page: { AnyView(CompositorContentGalleryPage()) }
    )
}

#Preview {
    CompositorContentGalleryPage()
        .frame(width: 900, height: 700)
}
