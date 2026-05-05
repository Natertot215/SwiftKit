import SwiftUI

// SwiftUI `ContentMode` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/contentmode.md
// macOS 10.15+. Constants that define how a view's content fills the available space.

struct ContentModeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ContentMode",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/contentmode.md",
            availability: "macOS 10.15+",
            blurb: """
            Two-case enum that tells a sizing modifier whether to fit content inside the \
            available space (preserving aspect ratio, possibly leaving empty regions) or \
            fill it (preserving aspect ratio, possibly clipping overflow).

            ContentMode is what View/aspectRatio(_:contentMode:), View/scaledToFit(), \
            View/scaledToFill(), and Image's resizable() consume to decide between fit \
            and fill behavior. As a value type it has no rendering of its own \u{2014} the \
            visible behavior comes from the modifier that takes it as a parameter.

            See View/scaledToFit, View/scaledToFill, and View/aspectRatio for live \
            demonstrations.
            """,
            signatures: [
                "ContentMode.fit",
                "ContentMode.fill",
                "Image(\"hero\").resizable().aspectRatio(contentMode: .fit)",
                "view.aspectRatio(16/9, contentMode: .fill)"
            ],
            notes: [
                ".fit \u{2014} content stays whole, may leave empty regions on one axis.",
                ".fill \u{2014} content fills the space, may clip on one axis.",
                "CaseIterable / Hashable / Sendable \u{2014} safe to switch on or store.",
                "No own appearance \u{2014} the visible difference comes from the modifier consuming it."
            ]
        )
    }
}

#Preview {
    ContentModeDescribePage()
        .frame(width: 900, height: 700)
}
