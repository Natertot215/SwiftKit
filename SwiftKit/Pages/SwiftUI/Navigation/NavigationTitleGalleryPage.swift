import SwiftUI

// SwiftUI `View/navigationTitle(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationtitle(_:).md
// macOS 13.0+. Multiple overloads exist — Text, LocalizedStringKey, String, and a
// Binding<String> for editable titles. Apple's docs note that macOS surfaces the
// title in the window titlebar (or a column's toolbar inside a NavigationSplitView).
// SwiftKit pages embed their stacks in fixed-size cards, so the title shows up
// inside the embedded toolbar rather than in the host window's titlebar.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct NavigationTitleGalleryPage: View {
    @State private var editableTitle: String = "Editable Title"

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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/navigationTitle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the view's title for purposes of navigation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationtitle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".navigationTitle(\"Inbox\")") {
            NavigationStack {
                List(0..<4, id: \.self) { i in
                    Text("Message \(i + 1)")
                }
                .navigationTitle("Inbox")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "String literal") {
                DemoCard(api: ".navigationTitle(\"Sent\")") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Item \(i)") }
                            .navigationTitle("Sent")
                    }
                }
            }

            VariantBlock(title: "Text — full Text styling supported") {
                DemoCard(api: ".navigationTitle(Text(\"Drafts\").italic())") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Item \(i)") }
                            .navigationTitle(Text("Drafts").italic())
                    }
                }
            }

            VariantBlock(title: "Inside a NavigationSplitView column") {
                DemoCard(api: ".navigationTitle(\"Mailboxes\") on the sidebar") {
                    NavigationSplitView {
                        List(0..<4, id: \.self) { i in Text("Mailbox \(i)") }
                            .navigationTitle("Mailboxes")
                    } detail: {
                        Text("Detail")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Editable title — Binding<String> overload (macOS surfaces an inline editor in the titlebar)") {
                DemoCard(api: ".navigationTitle($editableTitle) — Binding<String>") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Row \(i)") }
                            .navigationTitle($editableTitle)
                    }
                }
                HStack {
                    Text("title = \(editableTitle)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button("Reset") { editableTitle = "Editable Title" }
                }
            }
        }
    }

    // MARK: Notes

    private struct NTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NTNote] = [
        .init(title: "macOS surfaces the title in the window titlebar — or column toolbar.",
              detail: "On a top-level NavigationStack the title fills the window's titlebar. Inside a NavigationSplitView, the modifier on each column targets that column's local toolbar. Embedded SwiftKit pages render the title inside the embedded toolbar.",
              symbol: "macwindow"),
        .init(title: "Multiple overloads — String, LocalizedStringKey, Text, and Binding<String>.",
              detail: "Apple ships overloads for static strings, localized keys, `Text` (for italic / heavy weight / etc.), and a `Binding<String>` that allows the user to edit the title inline (macOS shows a click-to-rename affordance in the titlebar).",
              symbol: "switch.2"),
        .init(title: "Apply inside the navigation container — typically on the root content.",
              detail: "Place .navigationTitle on the View that fills the column or stack root (often a List). Applying it on the NavigationStack itself works too, but the modifier is most commonly attached to the root content for clarity.",
              symbol: "arrow.up"),
        .init(title: "Pairs with .navigationSubtitle and .navigationDocument.",
              detail: "On macOS, the title shares titlebar real estate with .navigationSubtitle (smaller secondary line) and the proxy icon supplied by .navigationDocument. Combine them to recreate Mail / Notes / Pages-style window chrome.",
              symbol: "rectangle.lefthalf.filled.righthalf.striped.horizontal")
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

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
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

extension NavigationTitleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationTitle",
        title: "NavigationTitle",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/navigationTitle(_:)",
            "View/navigationSubtitle(_:)",
            "View/navigationDocument(_:)",
            "View/navigationDocument(_:preview:)"
        ],
        blurb: "Configures the navigation chrome of a stack or split view: window/title bar text via navigationTitle, secondary navigationSubtitle, and document-bound title metadata via navigationDocument.",
        signature: "func navigationTitle(_ titleKey: LocalizedStringKey) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationtitle(_:).md",
        page: { AnyView(NavigationTitleGalleryPage()) }
    )
}

#Preview {
    NavigationTitleGalleryPage()
        .frame(width: 1100, height: 800)
}
