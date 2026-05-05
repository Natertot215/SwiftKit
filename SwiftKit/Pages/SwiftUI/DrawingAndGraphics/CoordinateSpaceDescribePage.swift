import SwiftUI

// SwiftUI `CoordinateSpace` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/coordinatespace.md
// macOS 10.15+. Resolved coordinate-space enum produced by CoordinateSpaceProtocol.

struct CoordinateSpaceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "CoordinateSpace",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/coordinatespace.md",
            availability: "macOS 10.15+",
            blurb: """
            A resolved coordinate space — the value produced when a CoordinateSpaceProtocol \
            value is passed into the layout system. You rarely write CoordinateSpace \
            directly; instead use the static properties and functions on \
            CoordinateSpaceProtocol — .global, .local, .named(_:) — and the system \
            resolves them for you.

            The cases are .global (window-relative root space), .local (the calling \
            view's own space), and .named(AnyHashable) (a space tagged elsewhere via \
            View/coordinateSpace(_:)).

            CoordinateSpace conforms to Hashable and Equatable, with isGlobal / isLocal \
            convenience flags for testing the case at runtime.
            """,
            signatures: [
                "enum CoordinateSpace",
                "static var global: CoordinateSpace { get }",
                "static var local: CoordinateSpace { get }",
                "static func named(_ name: AnyHashable) -> CoordinateSpace",
                "var isGlobal: Bool",
                "var isLocal: Bool"
            ],
            notes: [
                "Prefer CoordinateSpaceProtocol values (.global / .local / .named(_:)) at call sites.",
                "Hashable / Equatable \u{2014} safe to compare and store in collections.",
                ".global is window-relative; .local is caller-relative; .named is tagged via .coordinateSpace.",
                "isGlobal / isLocal flags identify the case without a switch.",
                "macOS 14 introduced NamedCoordinateSpace and CoordinateSpaceProtocol \u{2014} the modern API."
            ]
        )
    }
}

#Preview {
    CoordinateSpaceDescribePage().frame(width: 900, height: 700)
}
