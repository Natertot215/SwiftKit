import SwiftUI

// matchedGeometryEffect — pair two views by id within a Namespace; SwiftUI
// tweens position and size between them when the active branch flips.

struct MatchedGeometryEffectGalleryPage: View {
    @Namespace private var ns
    @State private var expanded: Bool = false

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live demo — two-state hero card

            VariantTile(
                name: "matchedGeometryEffect (size + position)",
                api: ".matchedGeometryEffect(id: \"hero\", in: ns)",
                height: 160
            ) {
                ZStack {
                    if expanded {
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(.tint)
                            .matchedGeometryEffect(id: "hero", in: ns)
                            .frame(width: 140, height: 80)
                    } else {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.tint)
                            .matchedGeometryEffect(id: "hero", in: ns)
                            .frame(width: 36, height: 36)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.spring(duration: 0.5, bounce: 0.25)) {
                        expanded.toggle()
                    }
                }
            }

            VariantTile(
                name: "Tap canvas to swap",
                api: "withAnimation { expanded.toggle() }"
            ) {
                Text(expanded ? "Expanded" : "Collapsed")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            // MARK: Reference

            ReferenceTile(
                name: "@Namespace",
                signature: "@propertyWrapper struct Namespace",
                note: "Declares a Namespace.ID used to scope matchedGeometryEffect identifiers. Two views with the same id in the same namespace are paired."
            )

            ReferenceTile(
                name: "matchedGeometryEffect(id:in:properties:anchor:isSource:)",
                signature: "func matchedGeometryEffect<ID: Hashable>(id: ID, in: Namespace.ID, properties: MatchedGeometryProperties = .frame, anchor: UnitPoint = .center, isSource: Bool = true) -> some View",
                note: "Synchronizes geometry between source and destination views. Defaults to interpolating both position and size; use the `properties:` parameter to interpolate only one."
            )

            ReferenceTile(
                name: "MatchedGeometryProperties",
                signature: "struct MatchedGeometryProperties : OptionSet",
                note: "Options for which geometry components participate. Members: .position, .size, .frame (the default — combines both)."
            )

            ReferenceTile(
                name: "matchedTransitionSource(id:in:)",
                signature: "func matchedTransitionSource(id: some Hashable, in: Namespace.ID) -> some View",
                note: "Pairs with NavigationStack's .navigationTransition(.zoom(sourceID:in:)) for zoom-style hero navigation. The destination view picks up the transition via the same id + namespace."
            )

            ReferenceTile(
                name: "matchedTransitionSource(id:in:configuration:)",
                signature: "func matchedTransitionSource(_:in:configuration:) -> some View",
                note: "Variant accepting a MatchedTransitionSourceConfiguration to customize the zoom transition's background, corner radius, or insets."
            )

            ReferenceTile(
                name: "MatchedTransitionSourceConfiguration",
                signature: "struct MatchedTransitionSourceConfiguration",
                note: "Customizes the zoom-style transition: background style, corner radius, and bounce. EmptyMatchedTransitionSourceConfiguration is the do-nothing default."
            )

            ReferenceTile(
                name: "EmptyMatchedTransitionSourceConfiguration",
                signature: "struct EmptyMatchedTransitionSourceConfiguration",
                note: "The zero-customization variant of MatchedTransitionSourceConfiguration. Used implicitly when you call matchedTransitionSource(id:in:) with no configuration."
            )
        }
    }
}

extension MatchedGeometryEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.matchedGeometryEffect",
        title: "MatchedGeometryEffect",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "EmptyMatchedTransitionSourceConfiguration",
            "MatchedGeometryProperties",
            "MatchedTransitionSourceConfiguration",
            "Namespace",
            "View/matchedGeometryEffect(id:in:properties:anchor:isSource:)",
            "View/matchedTransitionSource(id:in:)",
            "View/matchedTransitionSource(id:in:configuration:)"
        ],
        blurb: "Synchronizes geometry across views: matchedGeometryEffect tweens position and size between source and destination, while matchedTransitionSource pairs with navigationTransition(.zoom:) for hero-style nav effects. Both rely on a Namespace.ID — declared via the @Namespace property wrapper — to scope their identifiers.",
        signature: "matchedGeometryEffect · matchedTransitionSource · MatchedTransitionSourceConfiguration · Namespace",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/animations/matchedgeometryeffect(id:in:properties:anchor:issource:).md",
        page: { AnyView(MatchedGeometryEffectGalleryPage()) }
    )
}

#Preview {
    MatchedGeometryEffectGalleryPage()
        .frame(width: 900, height: 700)
}
