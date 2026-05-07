import SwiftUI

struct ContentShapeGalleryPage: View {
    @State private var defaultTaps: Int = 0
    @State private var enlargedTaps: Int = 0
    @State private var circleTaps: Int = 0

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Default hit-test (no contentShape)",
                api: "Image(systemName:).onTapGesture { … }  // hit area = visible glyph"
            ) {
                VStack(spacing: 6) {
                    Image(systemName: "star")
                        .font(.title)
                        .foregroundStyle(.tint)
                        .padding(20)
                        .background(Color.accentColor.opacity(0.05))
                        .onTapGesture { defaultTaps += 1 }
                    Text("taps: \(defaultTaps)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: ".contentShape(Rectangle())",
                api: ".padding(20).contentShape(Rectangle())"
            ) {
                VStack(spacing: 6) {
                    Image(systemName: "star")
                        .font(.title)
                        .foregroundStyle(.tint)
                        .padding(20)
                        .background(Color.accentColor.opacity(0.05))
                        .contentShape(Rectangle())
                        .onTapGesture { enlargedTaps += 1 }
                    Text("taps: \(enlargedTaps)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "Custom shape — Circle",
                api: ".contentShape(Circle())"
            ) {
                VStack(spacing: 6) {
                    Rectangle()
                        .fill(Color.accentColor.opacity(0.15))
                        .frame(width: 100, height: 100)
                        .contentShape(Circle())
                        .onTapGesture { circleTaps += 1 }
                    Text("taps: \(circleTaps)  (corners ignored)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "View.contentShape(_:eoFill:)",
                signature: "func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape",
                note: "Defines the hit-testing region of a view independently of its visual frame. Useful when padding or transparent pixels would otherwise miss taps and clicks."
            )

            ReferenceTile(
                name: "View.contentShape(_:_:eoFill:) — kind-scoped",
                signature: "func contentShape<S>(_ kind: ContentShapeKinds, _ shape: S, eoFill: Bool = false) -> some View where S : Shape",
                note: "Targets the shape to a specific interaction layer — e.g. enlarge the click region for .interaction without changing the .dragPreview shape that draws under the cursor."
            )

            ReferenceTile(
                name: "ContentShapeKinds",
                signature: "OptionSet  ·  .interaction  ·  .dragPreview  ·  .contextMenuPreview  ·  .focusEffect  ·  .hoverEffect  ·  .accessibility",
                note: "Each kind scopes a content shape to one interaction surface. .interaction is the click/tap hit region; .dragPreview is what's lifted on drag; .hoverEffect bounds the hover effect's mask."
            )

            ReferenceTile(
                name: "eoFill",
                signature: "eoFill: Bool = false  // even-odd fill rule",
                note: "Pass true to apply the even-odd fill rule when the supplied shape is self-intersecting (e.g. a path with multiple loops). Default non-zero rule is correct for the common case."
            )
        }
    }
}

extension ContentShapeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.contentShape",
        title: "ContentShape",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/contentShape(_:eoFill:)",
            "View/contentShape(_:_:eoFill:)",
            "ContentShapeKinds"
        ],
        blurb: "Defines the hit-testing region of a view independently from its visual frame. The kind parameter scopes the shape per interaction (interaction, dragPreview, contextMenuPreview, focusEffect, hoverEffect, accessibility).",
        signature: "func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/input-events/contentshape(_:eofill:).md",
        page: { AnyView(ContentShapeGalleryPage()) }
    )
}

#Preview {
    ContentShapeGalleryPage()
        .frame(width: 900, height: 700)
}
