import SwiftUI

// SwiftUI `View/toolbar(content:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbar(content:).md
// macOS 11.0+. Populates the window toolbar with ToolbarItem / ToolbarItemGroup.
// Embedded demos use NavigationStack { … }.toolbar so the demo's toolbar renders
// within the framed area, not in the host SwiftKit window.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct ToolbarContentPage: View {
    @State private var bold = false
    @State private var italic = false
    @State private var query = ""

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
            Text("View/toolbar(content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Populates the toolbar or navigation bar with the specified items via a ToolbarContentBuilder closure.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbar(content:).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbar { ToolbarItem(placement: .primaryAction) { Button(\u{2026}) } }") {
            NavigationStack {
                Text("Document body")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button {
                            } label: {
                                Label("Add", systemImage: "plus")
                            }
                        }
                    }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Multiple ToolbarItems") {
                DemoFrame(api: "ToolbarItem(placement: .primaryAction) { \u{2026} } \u{00d7} N") {
                    NavigationStack {
                        Text("Three primary actions")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("New", systemImage: "plus") }
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Info", systemImage: "info.circle") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "ToolbarItemGroup") {
                DemoFrame(api: "ToolbarItemGroup(placement: .primaryAction) { Toggle, Toggle }") {
                    NavigationStack {
                        Text("Format toggles")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItemGroup(placement: .primaryAction) {
                                    Toggle(isOn: $bold) { Image(systemName: "bold") }
                                    Toggle(isOn: $italic) { Image(systemName: "italic") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "Mixed semantic placements") {
                DemoFrame(api: ".navigation, .principal, .primaryAction") {
                    NavigationStack {
                        Text("Editor")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Untitled")
                            .toolbar {
                                ToolbarItem(placement: .navigation) {
                                    Button { } label: { Image(systemName: "sidebar.left") }
                                }
                                ToolbarItem(placement: .principal) {
                                    Text("Principal").font(.headline)
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Bound controls inside a ToolbarItemGroup") {
                DemoFrame(api: "Toggle(isOn: $bold) / Toggle(isOn: $italic)") {
                    NavigationStack {
                        VStack {
                            Text("bold = \(bold ? "true" : "false") \u{00b7} italic = \(italic ? "true" : "false")")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItemGroup(placement: .primaryAction) {
                                Toggle(isOn: $bold) { Image(systemName: "bold") }
                                Toggle(isOn: $italic) { Image(systemName: "italic") }
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "TextField in the toolbar") {
                DemoFrame(api: "ToolbarItem { TextField(\"\u{2026}\", text: $query) }") {
                    NavigationStack {
                        Text("query = \"\(query)\"")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    TextField("Search", text: $query)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(minWidth: 160)
                                }
                            }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: ".toolbar { \u{2026} } takes a @ToolbarContentBuilder closure.",
              detail: "Inside the closure you compose ToolbarItem, ToolbarItemGroup, ToolbarSpacer (macOS 26), DefaultToolbarItem (macOS 26), and ToolbarTitleMenu \u{2014} the conforming ToolbarContent types.",
              symbol: "hammer"),
        .init(title: "Wrap related controls in ToolbarItemGroup for one-to-one layout mapping.",
              detail: "Apple's docs recommend it: a group preserves grouping/spacing across platforms and gives the system a single hint for overflow behavior.",
              symbol: "rectangle.3.offgrid"),
        .init(title: "On macOS the toolbar attaches to the enclosing window's chrome.",
              detail: "When the modifier sits inside a NavigationStack/NavigationSplitView, the items render in the window's titlebar/toolbar surface. The demos here are framed inside a fixed-size NavigationStack so the chrome appears within the demo card rather than the host SwiftKit window.",
              symbol: "macwindow"),
        .init(title: "Overflow is automatic.",
              detail: "If items don't fit the available width, the system creates an overflow menu \u{2014} you don't manage truncation manually. Use ToolbarSpacer or explicit placements to influence which items get pushed.",
              symbol: "ellipsis.circle"),
        .init(title: "For user-customizable order/visibility, use .toolbar(id:content:) with ToolbarItem(id:\u{2026}).",
              detail: "Plain .toolbar(content:) is fixed; .toolbar(id:) opts the toolbar into the macOS Customize Toolbar\u{2026} panel.",
              symbol: "slider.horizontal.3")
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

// MARK: - Reusable demo helpers (page-local)

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
    ToolbarContentPage()
        .frame(width: 1100, height: 900)
}
