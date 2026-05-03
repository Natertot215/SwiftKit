import SwiftUI

// SwiftUI `AutomaticGlassBackgroundEffect` reference page.
// Source: Documentation/SwiftUI/view-styles/automaticglassbackgroundeffect.md
// visionOS 2.4+ — NOT AVAILABLE ON macOS. Code-only catalog page.

struct AutomaticGlassBackgroundEffectPage: View {
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
            Text("AutomaticGlassBackgroundEffect")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The default GlassBackgroundEffect — the system picks the appropriate variant. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/automaticglassbackgroundeffect.md · visionOS 2.4+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        AGBECallout(title: "Unavailable on macOS",
                    detail: "AutomaticGlassBackgroundEffect is a visionOS-only conformer of GlassBackgroundEffect. Documented here for catalog completeness.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("API shape")
                .font(.headline)
            AGBECodeBlock(text:
                """
                struct AutomaticGlassBackgroundEffect : GlassBackgroundEffect {
                    init()
                }
                """)
            Text("Picked by SwiftUI when no explicit GlassBackgroundEffect is provided. Resolves per spatial context (window, ornament, sheet).")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Typical visionOS usage")
                .font(.headline)
            AGBECodeBlock(text:
                """
                Text("Window")
                    .glassBackgroundEffect()  // resolves to AutomaticGlassBackgroundEffect
                """)
        }
    }

    private struct AGBENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [AGBENote] = [
        .init(title: "Default conformer.", detail: "When you don't pass an explicit effect, SwiftUI resolves to AutomaticGlassBackgroundEffect.", symbol: "wand.and.stars"),
        .init(title: "Per-context resolution.", detail: "The system picks Feathered or Plate (or another variant) based on spatial container, viewing distance, etc.", symbol: "questionmark.circle"),
        .init(title: "visionOS-only.", detail: "Never resolved on macOS. SwiftKit catalogs it for completeness.", symbol: "vision.pro"),
        .init(title: "macOS analog: .glassEffect(.regular).", detail: "Closest flat-screen equivalent on macOS 26+. Not API-compatible — different surface entirely.", symbol: "rectangle.split.2x1")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct AGBECallout: View {
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: "exclamationmark.triangle.fill")
                .font(.headline).foregroundStyle(.orange)
            Text(detail).font(.callout).foregroundStyle(.secondary)
        }
        .padding(16).frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct AGBECodeBlock: View {
    let text: String
    var body: some View {
        Text(text).font(.callout).fontDesign(.monospaced).textSelection(.enabled).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview { AutomaticGlassBackgroundEffectPage().frame(width: 1100, height: 800) }
