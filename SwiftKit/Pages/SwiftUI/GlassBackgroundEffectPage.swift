import SwiftUI

// SwiftUI `View/glassBackgroundEffect(displayMode:)` + `(in:displayMode:)` reference page.
// Source: Documentation/SwiftUI/view-styles/glassbackgroundeffect(displaymode:).md (and (in:displayMode:).md)
// visionOS 1.0+ — NOT AVAILABLE ON macOS. Page is code-only with explicit
// unavailability note. SwiftKit catalogs the API for completeness.

struct GlassBackgroundEffectPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/glassBackgroundEffect(displayMode:) + (in:displayMode:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a glass background effect to a view. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glassbackgroundeffect(displaymode:).md · visionOS 1.0+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GBECallout(
            title: "Unavailable on macOS",
            detail: "glassBackgroundEffect is a visionOS surface-and-environment API. macOS uses .glassEffect(_:in:) (Liquid Glass, macOS 26+) for analogous material effects.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("API surface — visionOS only")
                .font(.headline)
            GBECodeBlock(text:
                """
                func glassBackgroundEffect(
                    displayMode: GlassBackgroundDisplayMode = .always
                ) -> some View

                func glassBackgroundEffect<S: Shape>(
                    in shape: S,
                    displayMode: GlassBackgroundDisplayMode = .always
                ) -> some View
                """)
            Text("Both overloads return a view with a Liquid Glass background applied. The (in:displayMode:) form clips the effect to a custom shape; the bare form uses the view's frame.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("On macOS, the closest equivalent is .glassEffect(_:in:)")
                .font(.headline)
            GBECodeBlock(text:
                """
                // visionOS:
                Text("Hello").glassBackgroundEffect()

                // macOS 26+ analog:
                Text("Hello")
                    .padding()
                    .glassEffect()
                """)
            Text("The two APIs aren't identical — visionOS's variant has spatial/depth semantics that macOS's flat-screen Liquid Glass doesn't. But for surface chrome the macOS .glassEffect modifier is the right reach.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct GBENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GBENote] = [
        .init(title: "visionOS-only — never invoked on macOS.",
              detail: "SwiftKit's macOS-only catalog never exercises this API at runtime. It's documented for reference because Apple's catalog lists it under View styles.",
              symbol: "vision.pro"),
        .init(title: "Not the same as .glassEffect (macOS 26+).",
              detail: ".glassBackgroundEffect is a visionOS spatial-window background. .glassEffect is a flat-screen Liquid Glass surface. Different paradigms despite similar names.",
              symbol: "rectangle.split.2x1"),
        .init(title: "displayMode controls when the background appears.",
              detail: "GlassBackgroundDisplayMode has .always, .implicit, .never. See GlassBackgroundDisplayModePage for details.",
              symbol: "switch.2"),
        .init(title: "Custom shape via the (in:displayMode:) overload.",
              detail: "Pass any Shape to clip the glass background. Same idea as the macOS .glassEffect(_:in:) shape parameter.",
              symbol: "shape"),
        .init(title: "Documented here for catalog completeness.",
              detail: "SwiftKit lists every documented View Styles API. visionOS-only entries get code-only pages explaining the surface and pointing to the macOS analog.",
              symbol: "info.circle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct GBECallout: View {
    let title: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundStyle(.orange)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct GBECodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    GlassBackgroundEffectPage()
        .frame(width: 1100, height: 1000)
}
