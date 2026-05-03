import SwiftUI

// SwiftUI `GlassBackgroundEffect` protocol reference page.
// Source: Documentation/SwiftUI/view-styles/glassbackgroundeffect.md
// visionOS 2.4+ — NOT AVAILABLE ON macOS. Code-only catalog page.
// Conformers: AutomaticGlassBackgroundEffect, FeatheredGlassBackgroundEffect,
// PlateGlassBackgroundEffect.

struct GlassBackgroundEffectProtocolPage: View {
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
            Text("GlassBackgroundEffect")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that describes a glass background effect. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glassbackgroundeffect.md · visionOS 2.4+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GBEPCallout(title: "Unavailable on macOS",
                    detail: "GlassBackgroundEffect protocol governs visionOS spatial-window background materials. macOS uses Liquid Glass via .glassEffect(_:in:) instead.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Protocol surface")
                .font(.headline)
            GBEPCodeBlock(text:
                """
                @MainActor protocol GlassBackgroundEffect {
                    associatedtype Body : View
                    typealias Configuration = GlassBackgroundEffectConfiguration

                    @ViewBuilder @MainActor
                    func makeBody(configuration: Self.Configuration) -> Self.Body
                }
                """)
            Text("Built-in conformers shipped by SwiftUI on visionOS 2.4+:")
                .font(.callout)
                .foregroundStyle(.secondary)
            GBEPCodeBlock(text:
                """
                AutomaticGlassBackgroundEffect       — system default
                FeatheredGlassBackgroundEffect       — softer edge falloff
                PlateGlassBackgroundEffect           — flatter, more solid
                """)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Custom conformers and SwiftKit's policy")
                .font(.headline)
            Text("Per project hard constraint, SwiftKit does not author custom GlassBackgroundEffect conformers — and macOS doesn't ship the consuming surface anyway.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct GBEPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GBEPNote] = [
        .init(title: "visionOS 2.4+; macOS unsupported.", detail: "The protocol shipped relatively recently in visionOS. macOS has no equivalent surface — use Liquid Glass for analogous flat-screen needs.", symbol: "vision.pro"),
        .init(title: "Three built-in conformers.", detail: "Automatic, Feathered, Plate — each with its own page in this catalog.", symbol: "rectangle.stack"),
        .init(title: "Configuration is GlassBackgroundEffectConfiguration.", detail: "See GlassBackgroundEffectConfigurationPage for the data shape passed to a custom conformer.", symbol: "doc.text"),
        .init(title: "Documented for catalog completeness.", detail: "SwiftKit indexes every documented View Styles symbol; visionOS-only entries get code-only pages explaining the surface.", symbol: "info.circle")
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

private struct GBEPCallout: View {
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

private struct GBEPCodeBlock: View {
    let text: String
    var body: some View {
        Text(text).font(.callout).fontDesign(.monospaced).textSelection(.enabled).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview { GlassBackgroundEffectProtocolPage().frame(width: 1100, height: 900) }
