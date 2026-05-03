import SwiftUI

// SwiftUI `FeatheredGlassBackgroundEffect` reference page.
// Source: Documentation/SwiftUI/view-styles/featheredglassbackgroundeffect.md
// visionOS 2.4+ — NOT AVAILABLE ON macOS. Code-only catalog page.

struct FeatheredGlassBackgroundEffectPage: View {
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
            Text("FeatheredGlassBackgroundEffect")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A glass background effect with a feathered (soft) edge. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/featheredglassbackgroundeffect.md · visionOS 2.4+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FGBECallout(title: "Unavailable on macOS",
                    detail: "FeatheredGlassBackgroundEffect is a visionOS-only conformer of GlassBackgroundEffect. Documented here for catalog completeness.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("API shape")
                .font(.headline)
            FGBECodeBlock(text:
                """
                struct FeatheredGlassBackgroundEffect : GlassBackgroundEffect {
                    init()
                }
                """)
            Text("Apply via .glassBackgroundEffect(FeatheredGlassBackgroundEffect()) on a visionOS view. The feathering produces a softer outer falloff than the Plate variant.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("When to choose Feathered over Plate")
                .font(.headline)
            FGBECodeBlock(text:
                """
                Feathered  — content with soft edges, glanceable widgets,
                             readouts that should blend into the spatial backdrop.
                Plate      — content needing a flat, definitive boundary
                             (text-heavy panels, controls).
                """)
        }
    }

    private struct FGBENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FGBENote] = [
        .init(title: "Soft outer falloff.", detail: "Feathered edges blend the glass material into the surrounding spatial environment, reducing visual heaviness.", symbol: "wave.3.right"),
        .init(title: "visionOS-only.", detail: "Never resolved on macOS. SwiftKit catalogs it for completeness.", symbol: "vision.pro"),
        .init(title: "Pair with low-text content.", detail: "Soft edges work best for visuals that don't depend on a hard boundary for legibility.", symbol: "photo"),
        .init(title: "Conformer of GlassBackgroundEffect.", detail: "See GlassBackgroundEffectProtocolPage for the protocol surface.", symbol: "rectangle.stack")
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

private struct FGBECallout: View {
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

private struct FGBECodeBlock: View {
    let text: String
    var body: some View {
        Text(text).font(.callout).fontDesign(.monospaced).textSelection(.enabled).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview { FeatheredGlassBackgroundEffectPage().frame(width: 1100, height: 800) }
