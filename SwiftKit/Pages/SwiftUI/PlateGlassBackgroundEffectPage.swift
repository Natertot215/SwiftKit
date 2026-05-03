import SwiftUI

// SwiftUI `PlateGlassBackgroundEffect` reference page.
// Source: Documentation/SwiftUI/view-styles/plateglassbackgroundeffect.md
// visionOS 2.4+ — NOT AVAILABLE ON macOS. Code-only catalog page.

struct PlateGlassBackgroundEffectPage: View {
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
            Text("PlateGlassBackgroundEffect")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A glass background effect with a flat, plate-like surface. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/plateglassbackgroundeffect.md · visionOS 2.4+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PGBECallout(title: "Unavailable on macOS",
                    detail: "PlateGlassBackgroundEffect is a visionOS-only conformer of GlassBackgroundEffect. Documented here for catalog completeness.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("API shape")
                .font(.headline)
            PGBECodeBlock(text:
                """
                struct PlateGlassBackgroundEffect : GlassBackgroundEffect {
                    init()
                }
                """)
            Text("Apply via .glassBackgroundEffect(PlateGlassBackgroundEffect()) on a visionOS view. The plate finish produces a definitive, flat-edged glass slab.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("When to choose Plate over Feathered")
                .font(.headline)
            PGBECodeBlock(text:
                """
                Plate      — text-heavy panels, control surfaces, dialogs that
                             benefit from a clear, hard outer boundary.
                Feathered  — glanceable visuals, soft-edged cards.
                """)
        }
    }

    private struct PGBENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PGBENote] = [
        .init(title: "Hard outer boundary.", detail: "Plate gives the glass surface a definitive edge — useful when content needs a clear container.", symbol: "rectangle"),
        .init(title: "visionOS-only.", detail: "Never resolved on macOS. SwiftKit catalogs it for completeness.", symbol: "vision.pro"),
        .init(title: "Pair with text-heavy content.", detail: "Hard edges anchor reading material; the plate finish improves legibility against complex spatial backdrops.", symbol: "doc.text"),
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

private struct PGBECallout: View {
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

private struct PGBECodeBlock: View {
    let text: String
    var body: some View {
        Text(text).font(.callout).fontDesign(.monospaced).textSelection(.enabled).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview { PlateGlassBackgroundEffectPage().frame(width: 1100, height: 800) }
