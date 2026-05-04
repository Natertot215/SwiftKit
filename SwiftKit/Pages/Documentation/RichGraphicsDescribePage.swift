import SwiftUI

struct RichGraphicsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Add Rich Graphics to Your SwiftUI App",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/add-rich-graphics-to-your-swiftui-app.md",
            availability: "macOS 12.0+",
            blurb: """
            Make your apps stand out by adding background materials, vibrancy, custom graphics, and animations.

            ## Overview

            This sample code project is associated with WWDC21 session 10021. It demonstrates how to use SwiftUI's rich graphics APIs — including Canvas, GraphicsContext, background materials, vibrancy effects, custom shapes, and symbol animations — to build visually distinctive interfaces.

            ## Key APIs Covered

            Canvas — A view that renders immediate-mode 2D drawing commands using a GraphicsContext. Ideal for custom drawing that goes beyond standard SwiftUI views.

            GraphicsContext — The drawing surface passed into a Canvas closure. Supports paths, images, text, transforms, blending modes, and filters.

            Background materials — Use .ultraThinMaterial, .thinMaterial, .regularMaterial, .thickMaterial, and .ultraThickMaterial as backgrounds for frosted-glass effects.

            TimelineView — Drive periodic or animation-linked updates to a Canvas or other views using a schedule.

            Symbol Effects — Apply animated symbol effects using the symbolEffect(_:) modifier.

            ## See Also

            Canvas and GraphicsContext — the primary APIs this sample exercises.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/drawing-and-graphics/add-rich-graphics-to-your-swiftui-app.md",
                "Associated with WWDC21 session 10021: developer.apple.com/wwdc21/10021/"
            ]
        )
    }
}

#Preview {
    RichGraphicsDescribePage()
        .frame(width: 900, height: 900)
}
