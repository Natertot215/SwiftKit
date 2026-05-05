import SwiftUI

// SwiftUI `CompositorContentBuilder` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/compositorcontentbuilder.md
// macOS 26.0+ / visionOS 26.0+. Result builder for the CompositorContent protocol.

struct CompositorContentBuilderDescribePage: View {
    var body: some View {
        DescribePage(
            title: "CompositorContentBuilder",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/compositorcontentbuilder.md",
            availability: "macOS 26.0+ / visionOS 26.0+",
            blurb: """
            A result builder for composing a collection of CompositorContent \
            elements. Same role for compositor scenes that ViewBuilder plays for \
            SwiftUI views and SceneBuilder plays for app scenes — DSL syntax that \
            collects multiple statements into a single CompositorContent value.

            Defines the standard build* methods: buildBlock for sequencing, \
            buildEither(first:) / buildEither(second:) for if/else branches, \
            buildExpression for individual statements, and buildLimitedAvailability \
            for #available. Vends a CompositorContentBuilder.Content type that \
            wraps the resulting tree.

            You don't reference this builder directly in most code — apply the \
            @CompositorContentBuilder attribute to a closure parameter to opt \
            into the DSL.
            """,
            signatures: [
                "@resultBuilder struct CompositorContentBuilder",
                "static func buildBlock(_:)",
                "static func buildEither(first:) / buildEither(second:)",
                "static func buildExpression(_:)",
                "static func buildLimitedAvailability(_:)"
            ],
            notes: [
                "Result builder — used as @CompositorContentBuilder on closure params.",
                "Mirrors @ViewBuilder / @SceneBuilder for the compositor-content world.",
                "buildEither + buildLimitedAvailability give if/else and #available branching.",
                "Vended Content type is the materialized DSL tree.",
                "visionOS-leaning — primarily relevant inside ImmersiveSpace and friends."
            ]
        )
    }
}

#Preview {
    CompositorContentBuilderDescribePage().frame(width: 900, height: 700)
}
