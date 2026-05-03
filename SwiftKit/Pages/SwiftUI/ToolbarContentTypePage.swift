import SwiftUI

// SwiftUI `ToolbarContent` (protocol) reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarcontent.md
// macOS 11.0+. Conforming types: DefaultToolbarItem, Group, ToolbarItem,
// ToolbarItemGroup, ToolbarSpacer, ToolbarTitleMenu. Inherited by
// CustomizableToolbarContent. ToolbarContent is what .toolbar { … } eats.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarContentTypePage: View {
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
            Text("ToolbarContent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The protocol every item in a .toolbar { } closure conforms to. Lets you write custom toolbar-content composites.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarcontent.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "EditorTools: ToolbarContent { var body: some ToolbarContent { \u{2026} } }") {
            NavigationStack {
                Text("Custom ToolbarContent type wraps grouped items")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar {
                        EditorTools()
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Conforming types currently in the SwiftUI surface") {
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(conformers, id: \.self) { name in
                        Label(name, systemImage: "checkmark")
                            .font(.callout)
                            .foregroundStyle(.primary)
                    }
                    APICallout("DefaultToolbarItem \u{00b7} Group \u{00b7} ToolbarItem \u{00b7} ToolbarItemGroup \u{00b7} ToolbarSpacer \u{00b7} ToolbarTitleMenu")
                }
            }

            VariantBlock(title: "Group<C: ToolbarContent> \u{2014} compose conditionally") {
                DemoFrame(api: "Group { if cond { ToolbarItem { \u{2026} } } else { ToolbarItem { \u{2026} } } }") {
                    NavigationStack {
                        Text("Group lets if/else live inside a ToolbarContentBuilder")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                Group {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                }
                            }
                    }
                }
            }
        }
    }

    private let conformers: [String] = [
        "ToolbarItem",
        "ToolbarItemGroup",
        "ToolbarSpacer (macOS 26+)",
        "DefaultToolbarItem (macOS 26+)",
        "ToolbarTitleMenu",
        "Group (when its content is ToolbarContent)"
    ]

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Instance methods on ToolbarContent") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".hidden(_:) \u{2014} hide an item without removing it from the model", systemImage: "eye.slash")
                        .font(.callout).foregroundStyle(.primary)
                    Label(".matchedTransitionSource(id:in:) \u{2014} act as a zoom transition source", systemImage: "rectangle.connected.to.line.below")
                        .font(.callout).foregroundStyle(.primary)
                    Label(".sharedBackgroundVisibility(_:) \u{2014} share/hide the toolbar background", systemImage: "rectangle")
                        .font(.callout).foregroundStyle(.primary)
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
        .init(title: "@MainActor by default \u{2014} declare conformance in an extension to opt out.",
              detail: "From the docs: \"Isolation to the main actor is the default, but it's not required. Declare the conformance in an extension to opt out of main actor isolation.\"",
              symbol: "circle.dashed"),
        .init(title: "Useful for extracting reusable toolbar fragments.",
              detail: "If three views all need the same Save / Print / Export trio, write a struct EditorTools: ToolbarContent and reuse it. Each call site just writes .toolbar { EditorTools() }.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Inherited by CustomizableToolbarContent.",
              detail: "If you want a custom composite to be usable inside .toolbar(id:), conform to CustomizableToolbarContent (which itself inherits ToolbarContent). Each child item must also be customizable (i.e. have an id).",
              symbol: "slider.horizontal.3"),
        .init(title: "ToolbarContentBuilder is the result builder that powers .toolbar { } closures.",
              detail: "Same role as @ViewBuilder for views. Supports up to 10 statements per buildBlock plus buildIf / buildEither / buildLimitedAvailability for conditionals.",
              symbol: "hammer")
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

// Reusable custom ToolbarContent type \u{2014} demonstrates the protocol.
private struct EditorTools: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .primaryAction) {
            Button { } label: { Label("Save", systemImage: "square.and.arrow.down") }
            Button { } label: { Label("Print", systemImage: "printer") }
            Button { } label: { Label("Export", systemImage: "square.and.arrow.up") }
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
    ToolbarContentTypePage()
        .frame(width: 1100, height: 900)
}
