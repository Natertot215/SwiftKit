import SwiftUI

// SwiftUI `CompositorContent` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/compositorcontent.md
// macOS 26.0+ / visionOS 26.0+. RealityKit-style compositor protocol — no renderable surface on plain macOS apps.

struct CompositorContentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "CompositorContent",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/compositorcontent.md",
            availability: "macOS 26.0+ / visionOS 26.0+",
            blurb: """
            A protocol describing a tree of compositor entities composed via the \
            CompositorContentBuilder result builder. Drives RealityKit-style \
            content for ImmersiveSpace and similar visionOS scenes; on macOS 26 \
            the surface is reachable but only meaningful inside compositor-backed \
            scenes shared with visionOS.

            CompositorContent is @MainActor and has an associated `Body` type — \
            mirror SwiftUI's View protocol but for compositor entities. Conforming \
            types provide a `body` returning more CompositorContent. The protocol \
            also vends instance methods that mirror View's lifecycle hooks: \
            onAppear, onChange, onDisappear, and visionOS-specific ones like \
            onImmersionChange and onWorldRecenter.

            There is no SwiftKit-renderable demo for this protocol on macOS — it \
            only takes effect inside an immersive / compositor scene context. See \
            CompositorContentBuilder and AnyCompositorContent for related types.
            """,
            signatures: [
                "@MainActor protocol CompositorContent",
                "associatedtype Body",
                "var body: Self.Body { get }"
            ],
            notes: [
                "Compositor-scoped — does not render in a plain SwiftUI WindowGroup.",
                "Mirrors View: associated Body type, custom lifecycle hooks.",
                "Conforming types include AnyCompositorContent and CompositorContentBuilder.Content.",
                "Pair with @CompositorContentBuilder closures to compose entities.",
                "visionOS-leaning — most features (immersion, world recenter) are visionOS-only."
            ]
        )
    }
}

#Preview {
    CompositorContentDescribePage().frame(width: 900, height: 700)
}
