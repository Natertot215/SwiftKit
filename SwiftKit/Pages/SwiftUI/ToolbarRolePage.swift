import SwiftUI

// SwiftUI .toolbarRole(_:) + ToolbarRole reference page.
// Sources:
//   Documentation/SwiftUI/toolbars/toolbarrole(_:).md
//   Documentation/SwiftUI/toolbars/toolbarrole.md
// macOS 13.0+. Cases: .automatic, .browser, .editor, .navigationStack.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarRolePage: View {
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
            Text("View/toolbarRole(_:) + ToolbarRole")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the semantic role for content populating the toolbar. SwiftUI uses the role to influence how the toolbar renders (e.g. iPadOS browser apps lead-align their title).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarrole(_:).md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarRole(.automatic)") {
            NavigationStack {
                Text(".automatic \u{2014} system picks per platform")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationTitle("Document")
                    .toolbarRole(.automatic)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button { } label: { Label("Add", systemImage: "plus") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system picks") {
                DemoFrame(api: ".toolbarRole(.automatic)") {
                    NavigationStack {
                        Text("Default role")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbarRole(.automatic)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".browser \u{2014} iPadOS-only (unavailable on macOS)") {
                APICallout(".toolbarRole(.browser) // iOS / iPadOS only")
                Text("ToolbarRole.browser is unavailable in the macOS SDK. On iPadOS it lead-aligns the navigation title for browser-style apps. macOS apps don't need this hint \u{2014} the unified toolbar already handles browser layouts.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: ".editor \u{2014} for document editors") {
                DemoFrame(api: ".toolbarRole(.editor)") {
                    NavigationStack {
                        Text("Editor role")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Untitled")
                            .toolbarRole(.editor)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Save", systemImage: "square.and.arrow.down") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".navigationStack \u{2014} iPadOS-only (unavailable on macOS)") {
                APICallout(".toolbarRole(.navigationStack) // iOS / iPadOS only")
                Text("ToolbarRole.navigationStack is unavailable in the macOS SDK. NavigationStack already drives this layout on macOS without the explicit role.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "ToolbarRole \u{2014} four cases (macOS exposes only .automatic and .editor)") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".automatic \u{2014} system picks based on context", systemImage: "wand.and.stars")
                    Label(".editor \u{2014} document editor layout", systemImage: "doc.text")
                    Label(".browser \u{2014} iPadOS-only", systemImage: "safari")
                    Label(".navigationStack \u{2014} iPadOS-only", systemImage: "rectangle.stack")
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
        .init(title: "Role is intent, not pixels.",
              detail: "ToolbarRole tells SwiftUI what kind of app the toolbar belongs to. The framework uses it to make platform-specific layout choices (title alignment, item spacing, default placements).",
              symbol: "questionmark.circle"),
        .init(title: "iPadOS browser apps lead-align the title.",
              detail: "From Apple's example: .toolbarRole(.browser) automatically leading-aligns the navigation title in iPadOS. macOS already lead-aligns the title in .unified styles; the role mostly affects iPadOS rendering.",
              symbol: "iphone"),
        .init(title: "Sendable.",
              detail: "ToolbarRole is Sendable + SendableMetatype. Cheap to ferry across actor boundaries.",
              symbol: "tag"),
        .init(title: "Not a styling knob.",
              detail: "If you want to change colors / materials, use .toolbarBackground / .toolbarColorScheme / .toolbarForegroundStyle. ToolbarRole is for semantic intent.",
              symbol: "paintbrush")
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

#Preview {
    ToolbarRolePage()
        .frame(width: 1100, height: 1100)
}
