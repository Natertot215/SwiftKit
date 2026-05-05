import SwiftUI

// SwiftUI `CoordinateSpaceProtocol` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/coordinatespaceprotocol.md
// macOS 14.0+. Frame-of-reference protocol for the layout system.

struct CoordinateSpaceProtocolDescribePage: View {
    var body: some View {
        DescribePage(
            title: "CoordinateSpaceProtocol",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/coordinatespaceprotocol.md",
            availability: "macOS 14.0+",
            blurb: """
            A frame of reference within the layout system. Every view's geometry — \
            size, position, transform — is defined in the local coordinate space of \
            its parent. To convert a frame into another space, pass a CoordinateSpaceProtocol \
            value into GeometryProxy.frame(in:), DragGesture(coordinateSpace:), and \
            similar APIs.

            Three system-provided conformers are sufficient for almost all cases:
            \u{2022} GlobalCoordinateSpace — exposed as .global, the window root.
            \u{2022} LocalCoordinateSpace — exposed as .local, the caller's own space.
            \u{2022} NamedCoordinateSpace — exposed as .named(_:), .scrollView, .immersiveSpace, etc.

            You don't typically conform to CoordinateSpaceProtocol yourself; reach \
            for the static accessors on the protocol when you need a CoordinateSpace.
            """,
            signatures: [
                "protocol CoordinateSpaceProtocol",
                "static var global: GlobalCoordinateSpace { get }",
                "static var local: LocalCoordinateSpace { get }",
                "static func named(_ name: AnyHashable) -> NamedCoordinateSpace",
                "static var scrollView: NamedCoordinateSpace",
                "static func scrollView(axis: Axis) -> NamedCoordinateSpace"
            ],
            notes: [
                "macOS 14+ \u{2014} the modern layer over CoordinateSpace's enum cases.",
                "Conformers: GlobalCoordinateSpace, LocalCoordinateSpace, NamedCoordinateSpace.",
                "Use the static accessors (.global / .local / .named) instead of constructing values.",
                ".scrollView resolves the nearest enclosing ScrollView's space.",
                "Pass into GeometryProxy.frame(in:), DragGesture(coordinateSpace:), spatial gestures."
            ]
        )
    }
}

#Preview {
    CoordinateSpaceProtocolDescribePage().frame(width: 900, height: 700)
}
