import SwiftUI

// SwiftUI `GeometryProxy` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/geometryproxy.md
// macOS 10.15+. The value type vended by GeometryReader's closure.

struct GeometryProxyDescribePage: View {
    var body: some View {
        DescribePage(
            title: "GeometryProxy",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/geometryproxy.md",
            availability: "macOS 10.15+",
            blurb: """
            A proxy for accessing the size and coordinate space of a container view. \
            You don't construct a GeometryProxy directly — it is vended to the \
            closure of GeometryReader (or GeometryReader3D), and to the transform \
            closure of View/onGeometryChange(for:of:action:).

            The proxy exposes:
            \u{2022} size — the container's CGSize.
            \u{2022} safeAreaInsets — EdgeInsets describing system insets.
            \u{2022} frame(in:) — the container's CGRect in any CoordinateSpace.
            \u{2022} bounds(of:) — the bounds of a named CoordinateSpace if reachable.
            \u{2022} transform(in:) — the affine transform between this view and a space.
            \u{2022} subscript(_:Anchor<T>) — resolves an Anchor preference into the proxy's space.
            \u{2022} containerCornerInsets — corner-insets describing rounded container chrome.

            For a working demo, see View/GeometryReader and View/onGeometryChange(for:of:action:).
            """,
            signatures: [
                "struct GeometryProxy",
                "var size: CGSize",
                "var safeAreaInsets: EdgeInsets",
                "func frame(in: some CoordinateSpaceProtocol) -> CGRect",
                "func bounds(of: NamedCoordinateSpace) -> CGRect?",
                "func transform(in: some CoordinateSpaceProtocol) -> ProjectionTransform",
                "subscript<T>(anchor: Anchor<T>) -> T"
            ],
            notes: [
                "Always supplied by SwiftUI \u{2014} not directly constructible.",
                "frame(in:) accepts .global, .local, .named(_:), .scrollView, immersiveSpace.",
                "subscript(_:) resolves Anchor<T> into a value in this proxy's space.",
                "containerCornerInsets reports rounded-container chrome (e.g. windows, cards).",
                "Do NOT capture across re-layouts \u{2014} read inside GeometryReader's closure each pass."
            ]
        )
    }
}

#Preview {
    GeometryProxyDescribePage().frame(width: 900, height: 700)
}
