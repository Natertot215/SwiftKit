import SwiftUI

// SwiftUI `GlassBackgroundDisplayMode` reference page.
// Source: Documentation/SwiftUI/view-styles/glassbackgrounddisplaymode.md
// visionOS 1.0+ — NOT AVAILABLE ON macOS. Code-only catalog page.

struct GlassBackgroundDisplayModePage: View {
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
            Text("GlassBackgroundDisplayMode")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The conditions under which a glass background appears. (visionOS only.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glassbackgrounddisplaymode.md · visionOS 1.0+ — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GBDMCallout(title: "Unavailable on macOS",
                    detail: "GlassBackgroundDisplayMode parameterizes glassBackgroundEffect(_:), which is visionOS-only. Documented here for catalog completeness.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Documented type properties")
                .font(.headline)
            GBDMCodeBlock(text:
                """
                .always     — background always visible
                .implicit   — system decides per context
                .never      — background suppressed
                """)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Typical visionOS usage")
                .font(.headline)
            GBDMCodeBlock(text:
                """
                Text("Window")
                    .glassBackgroundEffect(displayMode: .always)
                """)
            Text("On macOS this code only compiles when targeting visionOS. SwiftKit's macOS-only build never reaches this surface.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct GBDMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GBDMNote] = [
        .init(title: "visionOS-only enum.", detail: "Three cases drive whether the Liquid Glass background ever materializes around a view. macOS doesn't ship the consuming modifier.", symbol: "vision.pro"),
        .init(title: ".implicit defers to context.", detail: "The system shows the background only when the surrounding context requests one (e.g., presented sheets in spatial windows).", symbol: "questionmark.circle"),
        .init(title: ".always forces it; .never suppresses it.", detail: "Use .always when you depend on the visual chrome regardless of context. Use .never to opt out when nesting in another translucent surface.", symbol: "switch.2"),
        .init(title: "Documented here for catalog completeness.", detail: "SwiftKit lists every documented View Styles type, including visionOS-only ones, so the catalog mirrors Apple's index.", symbol: "info.circle")
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

private struct GBDMCallout: View {
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

private struct GBDMCodeBlock: View {
    let text: String
    var body: some View {
        Text(text).font(.callout).fontDesign(.monospaced).textSelection(.enabled).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview { GlassBackgroundDisplayModePage().frame(width: 1100, height: 800) }
