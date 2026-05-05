import SwiftUI

// SwiftUI `AnyCompositorContent` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/anycompositorcontent.md
// macOS 26.0+ / visionOS 26.0+. Type-erased compositor content.

struct AnyCompositorContentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "AnyCompositorContent",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/anycompositorcontent.md",
            availability: "macOS 26.0+ / visionOS 26.0+",
            blurb: """
            A type-erased wrapper around any CompositorContent. Same role for \
            compositor scenes that AnyView plays for SwiftUI views: lets you \
            return heterogeneous compositor trees from a single function or store \
            them in a collection without exposing each concrete type.

            Two initializers — init(_:) and init(erasing:) — both wrap an \
            arbitrary CompositorContent value. The wrapper itself conforms to \
            CompositorContent so it composes with the @CompositorContentBuilder \
            DSL.

            Like AnyView, reach for AnyCompositorContent only when type erasure \
            is genuinely required. Static composition through the result builder \
            is preferred when types can be expressed naturally.
            """,
            signatures: [
                "struct AnyCompositorContent",
                "init<C: CompositorContent>(_ content: C)",
                "init(erasing other: AnyCompositorContent)",
                "// usage",
                "AnyCompositorContent(someEntity)"
            ],
            notes: [
                "Type-erased wrapper — analogous to AnyView for compositor content.",
                "Conforms to CompositorContent so it composes inside @CompositorContentBuilder.",
                "Use sparingly — prefer concrete types when the result builder accepts them.",
                "init(erasing:) lets you re-wrap an existing AnyCompositorContent without nesting.",
                "Compositor-scoped — only meaningful inside visionOS-style scene contexts."
            ]
        )
    }
}

#Preview {
    AnyCompositorContentDescribePage().frame(width: 900, height: 700)
}
