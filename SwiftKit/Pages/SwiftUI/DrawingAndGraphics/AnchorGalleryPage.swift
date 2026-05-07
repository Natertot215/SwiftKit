import SwiftUI

struct AnchorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live demo — anchorPreference + GeometryProxy resolution

            VariantTile(
                name: "anchorPreference + overlayPreferenceValue",
                api: ".anchorPreference(key:value:.bounds, transform: { $0 })"
            ) {
                AnchorBoundsDemo()
            }

            // MARK: Reference

            ReferenceTile(
                name: "Anchor<Value>",
                signature: "@frozen struct Anchor<Value>",
                note: "An opaque token derived from a view-relative anchor source (a point or rectangle). Resolve to a concrete value via `GeometryProxy[anchor]` to obtain coordinates in the proxy's coordinate space."
            )

            ReferenceTile(
                name: "Anchor.Source",
                signature: "struct Anchor.Source<Value>  ·  .bounds  ·  .rect(_:)  ·  .point(_:)  ·  .topLeading…",
                note: "Static factories produce sources that, when read through anchorPreference, yield Anchor<CGRect> or Anchor<CGPoint> values."
            )

            ReferenceTile(
                name: "View.anchorPreference(key:value:transform:)",
                signature: "func anchorPreference<A, K: PreferenceKey>(key: K.Type = K.self, value: Anchor<A>.Source, transform: (Anchor<A>) -> K.Value) -> some View",
                note: "Captures an Anchor source from this view, transforms it into a preference value, and propagates it up the view tree. Pair with `.overlayPreferenceValue` or `.backgroundPreferenceValue` to draw based on the resolved geometry."
            )

            ReferenceTile(
                name: "GeometryProxy subscript",
                signature: "subscript<T>(anchor: Anchor<T>) -> T",
                note: "Resolves an Anchor to a concrete value (CGRect or CGPoint) in the proxy's coordinate space."
            )

            ReferenceTile(
                name: "Alignment3D",
                signature: "@frozen struct Alignment3D",
                note: "Three-dimensional alignment used by depth-aware layouts. Composes a horizontal alignment, vertical alignment, and depth alignment.",
                badge: "macOS 14+"
            )

            ReferenceTile(
                name: "DepthAlignmentID",
                signature: "protocol DepthAlignmentID",
                note: "Depth-axis alignment guide ID — sibling to HorizontalAlignment and VerticalAlignment, used by Alignment3D to align in the z-axis.",
                badge: "macOS 14+"
            )
        }
    }
}

/// Live anchorPreference demo — captures the inner pill's bounds and draws a
/// dashed outline overlay using the resolved CGRect.
private struct AnchorBoundsDemo: View {
    private struct AnchorKey: PreferenceKey {
        static let defaultValue: Anchor<CGRect>? = nil
        static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
            value = nextValue() ?? value
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.secondary.opacity(0.12))

            Text("Aa")
                .font(.subheadline)
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(.tint, in: Capsule())
                .foregroundStyle(.white)
                .anchorPreference(key: AnchorKey.self, value: .bounds) { $0 }
        }
        .frame(width: 140, height: 80)
        .overlayPreferenceValue(AnchorKey.self) { anchor in
            GeometryReader { proxy in
                if let anchor {
                    let rect = proxy[anchor]
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(.tint, style: StrokeStyle(lineWidth: 1, dash: [3, 2]))
                        .frame(width: rect.width + 8, height: rect.height + 8)
                        .position(x: rect.midX, y: rect.midY)
                }
            }
        }
    }
}

extension AnchorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.anchor",
        title: "Anchor",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Anchor", "Alignment3D", "DepthAlignmentID"],
        blurb: "An opaque value derived from an anchor source and a particular view — converted to a coordinate-space value via GeometryProxy. Includes 3D alignment IDs used by Alignment3D for depth-aware layouts.",
        signature: "@frozen struct Anchor<Value>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/anchor.md",
        page: { AnyView(AnchorGalleryPage()) }
    )
}

#Preview {
    AnchorGalleryPage()
        .frame(width: 900, height: 700)
}
