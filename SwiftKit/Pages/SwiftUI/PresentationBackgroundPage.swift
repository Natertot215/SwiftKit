import SwiftUI

// SwiftUI presentationBackground reference page — bundles two overloads:
// • View/presentationBackground(_:)
// • View/presentationBackground(alignment:content:)
// Source: Documentation/SwiftUI/modal-presentations/presentationbackground(_:).md +
//         presentationbackground(alignment:content:).md
// macOS 13.3+ (iOS-flavored).

struct PresentationBackgroundPage: View {
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
            Text("View/presentationBackground(_:) + View/presentationBackground(alignment:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the presentation background of the enclosing sheet — either to a ShapeStyle (Color, Material) or a custom view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/presentationbackground(_:).md \u{00b7} macOS 13.3+ (iOS-flavored)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PBSnippet(
            api: ".presentationBackground(.thinMaterial)",
            code: """
            Button("View Settings") { showSettings = true }
                .sheet(isPresented: $showSettings) {
                    SettingsView()
                        .presentationDetents([.medium, .large])
                        .presentationBackground(.thinMaterial)
                }
            """,
            note: "ShapeStyle form. Pass a Material, Color, or any ShapeStyle. Compose with .presentationBackgroundInteraction for click-through behavior."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "ShapeStyle examples — Material") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".presentationBackground(.regularMaterial)")
                    APICallout(".presentationBackground(.thinMaterial)")
                    APICallout(".presentationBackground(.thickMaterial)")
                    APICallout(".presentationBackground(.ultraThinMaterial)")
                    APICallout(".presentationBackground(.bar)")
                }
                Text("Materials are the recommended way to set sheet backgrounds — they adapt to dark mode and accessibility settings.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Custom view form — alignment + content closure") {
                PBSnippet(
                    api: ".presentationBackground { Color.yellow }",
                    code: """
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
                            .presentationBackground {
                                Color.yellow
                            }
                    }
                    """,
                    note: "Pass any view as the background. Use the alignment parameter to control how it lays out behind the content."
                )
            }

            VariantBlock(title: "Custom view with alignment") {
                PBSnippet(
                    api: ".presentationBackground(alignment: .top) { Image(\"Hero\").resizable().scaledToFill() }",
                    code: """
                    .presentationBackground(alignment: .top) {
                        Image("Hero")
                            .resizable()
                            .scaledToFill()
                    }
                    """,
                    note: "Background view is laid out behind the sheet content with the given alignment. Useful for hero images at the top."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Both signatures") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout("func presentationBackground<S: ShapeStyle>(_ style: S) -> some View")
                    APICallout("func presentationBackground<V: View>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View")
                }
            }
        }
    }

    private struct PBNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PBNote] = [
        .init(title: "Two overloads — different content types.",
              detail: "Use `(_:)` for ShapeStyle (Color, Material). Use `(alignment:content:)` for a full view-builder background. Don't try to pass a view to the ShapeStyle overload — it won't compile.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Materials adapt automatically.",
              detail: "Prefer .regularMaterial / .thinMaterial / .thickMaterial over Color values — they handle dark mode, accessibility increases-contrast, and reduce-transparency.",
              symbol: "circle.lefthalf.filled"),
        .init(title: "Compose with .presentationBackgroundInteraction.",
              detail: "By default, content behind the sheet is non-interactive. Use .presentationBackgroundInteraction(.enabled) (or .enabled(upThrough: detent)) to allow taps through to the underlying view.",
              symbol: "hand.tap"),
        .init(title: "macOS effect is limited.",
              detail: "macOS sheets use window-attached chrome, so background customizations have less visible impact than on iOS. Test on the actual platform.",
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

private struct PBSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
            APICallout(api)
            if let note {
                Text(note).font(.footnote).foregroundStyle(.secondary)
            }
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

#Preview {
    PresentationBackgroundPage()
        .frame(width: 1100, height: 800)
}
