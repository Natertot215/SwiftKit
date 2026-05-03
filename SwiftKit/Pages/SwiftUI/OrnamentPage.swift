import SwiftUI

// SwiftUI .ornament(visibility:attachmentAnchor:contentAlignment:ornament:) +
// OrnamentAttachmentAnchor reference page.
// Sources:
//   Documentation/SwiftUI/toolbars/ornament(visibility:attachmentanchor:contentalignment:ornament:).md
//   Documentation/SwiftUI/toolbars/ornamentattachmentanchor.md
// visionOS 1.0 only \u{2014} the modifier and the anchor type are unavailable on
// macOS. SwiftKit shows the API as a code snippet for cross-platform reference;
// no live demos run on macOS 26.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct OrnamentPage: View {
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
            Text("View/ornament(\u{2026}) + OrnamentAttachmentAnchor")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents an ornament \u{2014} a panel attached to a window or scene at a positioning anchor. visionOS 1.0+ ONLY; not available on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/ornament(visibility:attachmentanchor:contentalignment:ornament:).md \u{00b7} visionOS 1.0+ (unavailable on macOS)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".ornament(attachmentAnchor: .scene(.bottom)) { OrnamentContent() }") {
            VStack(alignment: .leading, spacing: 8) {
                Text("visionOS-only API \u{2014} no rendering on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Below is the canonical Apple example, captured for cross-platform reference.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                CodeSnippet(code: """
                Text("A view with an ornament")
                    .ornament(attachmentAnchor: .scene(.bottom)) {
                        OrnamentContent()
                    }
                """)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Modifier signature") {
                CodeSnippet(code: """
                func ornament<Content: View>(
                    visibility: Visibility = .automatic,
                    attachmentAnchor: OrnamentAttachmentAnchor,
                    contentAlignment: Alignment3D = .back,
                    @ViewBuilder ornament: () -> Content
                ) -> some View
                """)
            }

            VariantBlock(title: "OrnamentAttachmentAnchor \u{2014} positioning anchors") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".scene(_:) \u{2014} attach to a UnitPoint relative to the enclosing scene", systemImage: "scope")
                    Label(".parent(_:) \u{2014} attach relative to the parent view", systemImage: "rectangle.connected.to.line.below")
                }
                .font(.callout)
                .foregroundStyle(.primary)
                APICallout(".scene(.bottom) | .scene(.top) | .scene(.leading) | .parent(.center)")
            }

            VariantBlock(title: "Common anchor positions \u{2014} UnitPoint values") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".bottom \u{2014} bottom-center of the scene", systemImage: "arrow.down")
                    Label(".top \u{2014} top-center of the scene", systemImage: "arrow.up")
                    Label(".leading \u{2014} left edge", systemImage: "arrow.left")
                    Label(".trailing \u{2014} right edge", systemImage: "arrow.right")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Why this page is code-only") {
                Text("Both .ornament(\u{2026}) and OrnamentAttachmentAnchor are documented as visionOS-only. SwiftKit targets macOS 26; the symbols don't exist in the macOS SDK at runtime. The page captures the API for reference but does not call it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "macOS-equivalent surfaces") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".toolbar { } / ToolbarItem \u{2014} for chrome-attached controls", systemImage: "rectangle.connected.to.line.below")
                    Label("Inspector / .inspector(isPresented:content:) \u{2014} for trailing detail panels", systemImage: "rectangle.righthalf.filled")
                    Label("Window(\"\u{2026}\", id:) + .windowStyle(.hiddenTitleBar) \u{2014} for floating accessory windows", systemImage: "macwindow")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "visionOS only.",
              detail: "Apple's availability block lists visionOS 1.0 and nothing else \u{2014} the modifier and the anchor type are not exposed on macOS / iOS / iPadOS / watchOS / tvOS.",
              symbol: "visionpro"),
        .init(title: "Ornaments are 3D-positioned panels.",
              detail: "On visionOS an ornament floats next to a window in volumetric space. The contentAlignment: Alignment3D parameter (default .back) decides how the ornament's content sits relative to its anchor.",
              symbol: "cube.transparent"),
        .init(title: "Visibility flows the standard SwiftUI way.",
              detail: ".automatic / .visible / .hidden \u{2014} same Visibility enum used by other show/hide modifiers.",
              symbol: "eye"),
        .init(title: "Two anchor families.",
              detail: ".scene(_:) attaches to the enclosing scene; .parent(_:) attaches relative to the parent view. Both take a UnitPoint to choose the edge / corner / center.",
              symbol: "scope"),
        .init(title: "If you need this on macOS \u{2014} use a separate Window + .windowStyle.",
              detail: "macOS doesn't have ornaments. The closest equivalents are floating accessory Windows (created via Window(\u{2026}) in the App scene) or an .inspector trailing panel.",
              symbol: "macwindow")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

private struct CodeSnippet: View {
    let code: String

    var body: some View {
        Text(code)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    OrnamentPage()
        .frame(width: 1100, height: 900)
}
