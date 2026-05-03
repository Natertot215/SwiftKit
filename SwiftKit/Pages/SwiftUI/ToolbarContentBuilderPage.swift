import SwiftUI

// SwiftUI `ToolbarContentBuilder` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarcontentbuilder.md
// macOS 11.0+. The result builder that powers .toolbar { … } closures.
// Same shape as @ViewBuilder: buildBlock(_:_:_:…) up to 10 args,
// buildIf, buildEither(first:/second:), buildExpression, buildLimitedAvailability.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarContentBuilderPage: View {
    @State private var showShare = true

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
            Text("ToolbarContentBuilder")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Result builder that constructs a ToolbarContent collection from multi-expression closures. The toolbar equivalent of @ViewBuilder.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarcontentbuilder.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbar { ToolbarItem(\u{2026}); ToolbarItem(\u{2026}) }") {
            NavigationStack {
                Text("Implicit ToolbarContentBuilder accumulates two items")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar {
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

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Conditional via if/else \u{2014} buildEither(first:/second:)") {
                DemoFrame(api: "if showShare { ToolbarItem(share) } else { ToolbarItem(more) }") {
                    NavigationStack {
                        VStack {
                            Toggle("showShare", isOn: $showShare)
                                .toggleStyle(.switch)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button { } label: { Label("Add", systemImage: "plus") }
                            }
                            if showShare {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                }
                            } else {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("More", systemImage: "ellipsis.circle") }
                                }
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "Optional via if-only \u{2014} buildIf(_:)") {
                DemoFrame(api: "if showShare { ToolbarItem(share) }") {
                    NavigationStack {
                        Text("Toggle above; share appears only when true")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                                if showShare {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "Custom @ToolbarContentBuilder property") {
                DemoFrame(api: "@ToolbarContentBuilder var customTools: some ToolbarContent { \u{2026} }") {
                    NavigationStack {
                        Text("Extracted builder property")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                customTools
                            }
                    }
                }
            }
        }
    }

    @ToolbarContentBuilder
    private var customTools: some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            Button { } label: { Image(systemName: "sidebar.left") }
        }
        ToolbarItemGroup(placement: .primaryAction) {
            Button { } label: { Label("Save", systemImage: "square.and.arrow.down") }
            Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Builder methods you may invoke directly") {
                VStack(alignment: .leading, spacing: 6) {
                    Label("buildBlock(_:_:\u{2026}) \u{2014} 1 to 10 arity overloads", systemImage: "rectangle.3.offgrid")
                    Label("buildExpression(_:) \u{2014} accepts a ToolbarContent expression", systemImage: "function")
                    Label("buildIf(_:) \u{2014} optional content", systemImage: "questionmark.diamond")
                    Label("buildEither(first:) / buildEither(second:) \u{2014} if/else branches", systemImage: "arrow.triangle.branch")
                    Label("buildLimitedAvailability(_:) \u{2014} availability fences", systemImage: "calendar.badge.clock")
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
        .init(title: "@resultBuilder, applied implicitly to .toolbar { } closures.",
              detail: "Mirrors @ViewBuilder. You rarely call its methods directly \u{2014} you write the closure body and the compiler wires up buildBlock / buildIf / buildEither for you.",
              symbol: "hammer"),
        .init(title: "Annotate your own properties with @ToolbarContentBuilder.",
              detail: "Useful for splitting a long .toolbar closure into named pieces. Same trick as breaking a body into computed View properties.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Each statement must be a ToolbarContent.",
              detail: "Plain Views are not ToolbarContent. Wrap them in ToolbarItem (one per item) or ToolbarItemGroup (one logical group). Loose Text or Button at the top level of .toolbar { } won't compile.",
              symbol: "exclamationmark.triangle"),
        .init(title: "ForEach over a fixed collection works inside the builder.",
              detail: "ForEach is one of the conforming pieces in .toolbar; use it for dynamic lists of items. Per the macuix rules, prefer Apple-provided composition primitives.",
              symbol: "arrow.triangle.2.circlepath")
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
    ToolbarContentBuilderPage()
        .frame(width: 1100, height: 900)
}
