import SwiftUI

struct DefersSystemGesturesGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "View.defersSystemGestures(on:)",
                signature: "func defersSystemGestures(on edges: Edge.Set) -> some View",
                note: "Tells the system that an app's gesture should take precedence over the system edge gesture for the specified screen edges. Edge.Set values combine via array literal: [.leading, .trailing].",
                badge: "iOS 16.0+ / iPadOS 16.0+"
            )

            ReferenceTile(
                name: "Edge.Set values",
                signature: ".all  ·  .top  ·  .leading  ·  .trailing  ·  .bottom  ·  .horizontal  ·  .vertical",
                note: "OptionSet specifying which screen edges defer the system gesture. Use .all when capturing every edge inside a full-screen canvas; use single edges to coexist with system gestures elsewhere."
            )

            ReferenceTile(
                name: "When to apply",
                signature: "Reserve for full-screen drawing, gaming, and AR canvases that genuinely need edge swipes.",
                note: "Deferring system gestures forces a noticeable two-step swipe to invoke them. Overuse breaks user expectations — apply only to surfaces where the cost is worth the captured edge."
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "Unavailable in macOS — affects iOS / iPadOS only.",
                note: "Cataloged here for SDK completeness. SwiftKit cannot demo this modifier live on its macOS-only target; it compiles only in code paths gated by #if os(iOS)."
            )
        }
    }
}

extension DefersSystemGesturesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.defersSystemGestures",
        title: "DefersSystemGestures",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/defersSystemGestures(on:)"
        ],
        blurb: "Sets the screen edges from which an app gesture takes precedence over the system's edge gesture. Useful inside drawing or game canvases that need to capture edge swipes.",
        signature: "func defersSystemGestures(on edges: Edge.Set) -> some View",
        availability: "iOS 16.0+ / iPadOS 16.0+",
        docPath: "Documentation/SwiftUI/gestures/deferssystemgestures(on:).md",
        page: { AnyView(DefersSystemGesturesGalleryPage()) }
    )
}

#Preview {
    DefersSystemGesturesGalleryPage()
        .frame(width: 900, height: 700)
}
