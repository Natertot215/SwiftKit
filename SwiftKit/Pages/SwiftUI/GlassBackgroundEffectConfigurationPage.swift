import SwiftUI

// SwiftUI `GlassBackgroundEffectConfiguration` reference page.
// Source: Documentation/SwiftUI/view-styles/glassbackgroundeffectconfiguration.md
// visionOS 2.4+ — NOT AVAILABLE ON macOS. Code-only catalog page.

struct GlassBackgroundEffectConfigurationPage: View {
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
            Text("GlassBackgroundEffectConfiguration")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The properties of a glass background effect. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glassbackgroundeffectconfiguration.md · visionOS 2.4+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GBECCallout(title: "Unavailable on macOS",
                    detail: "GlassBackgroundEffectConfiguration is the data shape passed to a GlassBackgroundEffect.makeBody on visionOS. Documented here for catalog completeness.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("API shape (visionOS reference)")
                .font(.headline)
            GBECCodeBlock(text:
                """
                struct GlassBackgroundEffectConfiguration {
                    // Public surface evolves; consult the visionOS docs for the
                    // current member set. Typically exposes the affected view
                    // (or content slot) for re-rendering inside makeBody.
                }
                """)
            Text("SwiftKit does NOT author custom GlassBackgroundEffect conformers per project hard constraint.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Typical visionOS conformer")
                .font(.headline)
            GBECCodeBlock(text:
                """
                struct MyGlassBackground: GlassBackgroundEffect {
                    func makeBody(configuration: Configuration) -> some View {
                        // Decorate the configuration's content view here.
                        Color.clear
                    }
                }
                """)
        }
    }

    private struct GBECNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GBECNote] = [
        .init(title: "visionOS-only.", detail: "Configuration is consumed by GlassBackgroundEffect.makeBody — that protocol is visionOS-only.", symbol: "vision.pro"),
        .init(title: "Public members evolve.", detail: "Apple's visionOS releases iterate; the configuration's exposed members may shift. Check the live docs when targeting visionOS.", symbol: "calendar"),
        .init(title: "SwiftKit does NOT author conformers.", detail: "Per project hard constraint. Documenting the surface only.", symbol: "lock"),
        .init(title: "Catalog completeness.", detail: "SwiftKit lists every documented View Styles symbol; visionOS-only entries get code-only pages.", symbol: "info.circle")
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

private struct GBECCallout: View {
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

private struct GBECCodeBlock: View {
    let text: String
    var body: some View {
        Text(text).font(.callout).fontDesign(.monospaced).textSelection(.enabled).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview { GlassBackgroundEffectConfigurationPage().frame(width: 1100, height: 800) }
