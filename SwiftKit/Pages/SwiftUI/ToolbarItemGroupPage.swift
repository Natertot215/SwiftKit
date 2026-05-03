import SwiftUI

// SwiftUI `ToolbarItemGroup` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbaritemgroup.md
// macOS 11.0+. init(placement:content:) and init(placement:content:label:).
// One ToolbarItemGroup = one logical group; the framework gets a one-to-one
// mapping between controls and toolbar items, which fixes layout/spacing.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarItemGroupPage: View {
    @State private var bold = false
    @State private var italic = false
    @State private var underline = false

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
            Text("ToolbarItemGroup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A model that represents a group of ToolbarItems sharing a placement.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbaritemgroup.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "ToolbarItemGroup(placement: .primaryAction) { Toggle, Toggle, Toggle }") {
            NavigationStack {
                Text("Three format toggles in one group")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar {
                        ToolbarItemGroup(placement: .primaryAction) {
                            Toggle(isOn: $bold) { Image(systemName: "bold") }
                            Toggle(isOn: $italic) { Image(systemName: "italic") }
                            Toggle(isOn: $underline) { Image(systemName: "underline") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(placement:content:)") {
                DemoFrame(api: "ToolbarItemGroup(placement: .primaryAction) { Button, Button }") {
                    NavigationStack {
                        Text("Two grouped buttons")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItemGroup(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                    Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "init(placement:content:label:) \u{2014} group with a label (iOS-flavored on macOS)") {
                DemoFrame(api: "ToolbarItemGroup(placement: .primaryAction, content: { \u{2026} }, label: { Text(\"Format\") })") {
                    NavigationStack {
                        Text("Group with a Label")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItemGroup(placement: .primaryAction) {
                                    Toggle(isOn: $bold) { Image(systemName: "bold") }
                                    Toggle(isOn: $italic) { Image(systemName: "italic") }
                                } label: {
                                    Label("Format", systemImage: "textformat")
                                }
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Bound state across the group") {
                DemoFrame(api: "Toggle($bold) / Toggle($italic) / Toggle($underline)") {
                    NavigationStack {
                        VStack {
                            Text("bold=\(bold ? "1" : "0") italic=\(italic ? "1" : "0") underline=\(underline ? "1" : "0")")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItemGroup(placement: .primaryAction) {
                                Toggle(isOn: $bold) { Image(systemName: "bold") }
                                Toggle(isOn: $italic) { Image(systemName: "italic") }
                                Toggle(isOn: $underline) { Image(systemName: "underline") }
                            }
                        }
                    }
                }
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "One ToolbarItemGroup = one placement, N controls.",
              detail: "All children share the group's placement. If you need different placements per control, use multiple ToolbarItem instances instead.",
              symbol: "rectangle.3.offgrid"),
        .init(title: "The Apple-recommended way to lay out related controls.",
              detail: "From the docs: \"wrapping a related group of toolbar items together in a ToolbarItemGroup provides a one-to-one mapping between controls and toolbar items which results in the correct layout and spacing on each platform.\"",
              symbol: "checkmark.seal"),
        .init(title: "Conforms to ToolbarContent (not Customizable).",
              detail: "Use ToolbarItem(id:\u{2026}) inside .toolbar(id:) when items must be reorderable / removable; ToolbarItemGroup is for fixed groups.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "label: closure is iOS-flavored.",
              detail: "On macOS the labeled init renders the group inline; the label content is mostly used by iOS to title an overflowing group. Safe to use either form on macOS.",
              symbol: "iphone")
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
    ToolbarItemGroupPage()
        .frame(width: 1100, height: 900)
}
