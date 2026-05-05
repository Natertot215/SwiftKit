import SwiftUI

// AppKit Views and Controls / Related types describe page.
// Covers: NSRectAlignment — an enum of nine cases (.none, .top, .topLeading,
// .leading, .bottomLeading, .bottom, .bottomTrailing, .trailing, .topTrailing)
// for layout-direction-aware alignment of a rectangle to an edge or corner.
// Source: Documentation/AppKit/views-and-controls/nsrectalignment.md
//
// Why describe rather than render: This is an enum — a value type with no
// visual representation. It's only meaningful in contexts that consume it.

struct NSRectAlignmentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSRectAlignment",
            docPath: "Documentation/AppKit/views-and-controls/nsrectalignment.md",
            availability: "macOS 10.15+",
            blurb: """
            Constants that specify alignment to an edge or a set of edges \
            depending on the user interface layout direction. The "leading" \
            and "trailing" cases respect right-to-left layouts.

            Cases (nine total):

              \u{2022} .none — no alignment.
              \u{2022} .top, .bottom — single-edge.
              \u{2022} .leading, .trailing — single-edge, layout-direction aware.
              \u{2022} .topLeading, .topTrailing, .bottomLeading, \
            .bottomTrailing — corner alignment.

            Use this type wherever an AppKit API asks for a directional rect \
            alignment — typically inside collection-view layout configuration \
            (NSCollectionLayoutBoundarySupplementaryItem.alignment, \
            NSCollectionLayoutDecorationItem placement) and similar layout \
            APIs that need to position one rect relative to another.
            """,
            signatures: [
                "enum NSRectAlignment",
                "case none",
                "case top, topLeading, leading, bottomLeading, bottom, bottomTrailing, trailing, topTrailing",
                "init?(rawValue: Int)",
                "// Conforms to: BitwiseCopyable, Equatable, Hashable, RawRepresentable, Sendable"
            ],
            notes: [
                "Layout-direction aware: .leading is the left edge in LTR locales and the right edge in RTL locales. Same for the *Leading / *Trailing corners.",
                "Pairs with NSDirectionalEdgeInsets and NSDirectionalRectEdge — together they make up AppKit's directional-layout primitives.",
                "Equivalent to UIRectAlignment on UIKit; the Swift surface is identical.",
                "There's nothing visible to render for an enum on its own — see the consuming layout APIs (collection-view boundary supplementary items, decoration items) for live examples."
            ]
        )
    }
}

#Preview {
    NSRectAlignmentDescribePage()
        .frame(width: 900, height: 700)
}
