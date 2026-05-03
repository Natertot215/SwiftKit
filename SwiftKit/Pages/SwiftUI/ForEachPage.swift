import SwiftUI

// SwiftUI `ForEach` reference page.
// Source: Documentation/SwiftUI/lists/foreach.md
// Five documented init forms covered here:
//   init(_:)                       — Identifiable data, default rendering (inside ForEachable contexts)
//   init(_:content:)               — Identifiable data, custom row builder
//   init(_:id:content:)            — KeyPath ID for non-Identifiable data
//   init(_:editActions:content:)   — editable collection (no-op outside iOS edit mode; noted)
//   ForEach(0..<n)                 — Range overload, common shorthand
//   init(subviews:content:)        — iterate subviews of a built view (macOS 15+)
// init(sections:content:) is intentionally skipped: it consumes TableSectionContent,
// which only renders inside a Table — out of scope for a ForEach gallery page.
// macOS 26 is the only target, so no @available shims (framework hard constraint).

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 180

private struct NamedFont: Identifiable, Hashable {
    let name: String
    let style: Font
    var id: String { name }
}

private let namedFonts: [NamedFont] = [
    NamedFont(name: "Headline", style: .headline),
    NamedFont(name: "Body",     style: .body),
    NamedFont(name: "Callout",  style: .callout),
    NamedFont(name: "Caption",  style: .caption)
]

private struct PlainItem: Hashable {
    let key: String
    let title: String
}

private let plainItems: [PlainItem] = [
    PlainItem(key: "alpha",   title: "Alpha"),
    PlainItem(key: "beta",    title: "Beta"),
    PlainItem(key: "gamma",   title: "Gamma"),
    PlainItem(key: "delta",   title: "Delta")
]

struct ForEachPage: View {
    @State private var editableNames: [NamedFont] = namedFonts

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
            Text("ForEach")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A structure that computes views on demand from an underlying collection of identified data.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/foreach.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "ForEach(namedFonts) { Text($0.name).font($0.style) }") {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(namedFonts) { item in
                    Text(item.name)
                        .font(item.style)
                        .foregroundStyle(.primary)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(_:content:) — Identifiable collection") {
                DemoCard(api: "ForEach(namedFonts) { item in Text(item.name).font(item.style) }") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(namedFonts) { item in
                            Text(item.name)
                                .font(item.style)
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }

            VariantBlock(title: "init(_:id:content:) — KeyPath ID for non-Identifiable") {
                DemoCard(api: "ForEach(plainItems, id: \\.key) { Text($0.title) }") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(plainItems, id: \.key) { item in
                            Text(item.title)
                                .font(.body)
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }

            VariantBlock(title: "ForEach(0..<n) — Range overload") {
                DemoCard(api: "ForEach(0..<5) { i in Text(\"Row \\(i)\") }") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(0..<5) { i in
                            Text("Row \(i)")
                                .font(.body)
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }

            VariantBlock(title: "init(_:) — Identifiable, default rendering inside Picker") {
                // The bare init(_:) form requires a context that supplies a default
                // row renderer for the element type. Picker is the standard one:
                // it renders each Identifiable element via its description.
                DemoCard(api: "Picker(\"Style\", selection: $sel) { ForEach(namedFonts) }") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Picker uses ForEach(_:) without a content closure when the elements provide their own rendering.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("On macOS, the same init(_:) is also legal inside List/Form for Identifiable rows that conform to View.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            VariantBlock(title: "init(subviews:content:) — iterate a view's subviews (macOS 15+)") {
                DemoCard(api: "ForEach(subviews: TupleView) { subview in subview }") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(subviews: Group {
                            Text("Subview A")
                            Text("Subview B")
                            Text("Subview C")
                        }) { subview in
                            HStack(spacing: 8) {
                                Image(systemName: "circle.fill")
                                    .imageScale(.small)
                                    .foregroundStyle(.tint)
                                subview
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "init(_:editActions:content:) — editable collection") {
                DemoCard(api: "ForEach($editableNames, editActions: .all) { $item in Text(item.name) }") {
                    List {
                        ForEach($editableNames, editActions: .all) { $item in
                            Text(item.name)
                                .font(.body)
                                .foregroundStyle(.primary)
                        }
                    }
                }
                Text("editActions enables move/delete inside an iOS-style List edit mode. macOS Lists don't expose a global edit mode, so the gestures may not appear — the binding overload still compiles and is correct on every platform.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Empty collection — ForEach renders nothing") {
                DemoCard(api: "ForEach([NamedFont]()) { Text($0.name) }") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach([NamedFont]()) { item in
                            Text(item.name)
                        }
                        Text("(no rows)")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                }
            }

            VariantBlock(title: "Single element") {
                DemoCard(api: "ForEach([namedFonts[0]]) { Text($0.name) }") {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach([namedFonts[0]]) { item in
                            Text(item.name)
                                .font(item.style)
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }

            VariantBlock(title: "Many elements (Range, 0..<24)") {
                DemoCard(api: "ForEach(0..<24) { i in Text(\"\\(i)\") }",
                         height: 220) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 2) {
                            ForEach(0..<24) { i in
                                Text("Row \(i)")
                                    .font(.body)
                                    .foregroundStyle(.primary)
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "Constant view count — bad pattern vs recommended workaround") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Bad — non-constant view count",
                                api: "ForEach { if … { Text } }") {
                        LazyVStack(alignment: .leading, spacing: 4) {
                            // Per the doc, this can produce 0 or 1 views per element,
                            // which the slow-path logger will flag inside List/LazyVStack.
                            ForEach(namedFonts) { item in
                                if item.name.count != 4 {
                                    Text(item.name)
                                        .font(.body)
                                        .foregroundStyle(.primary)
                                }
                            }
                        }
                    }
                    StateColumn(label: "Good — wrap in VStack/HStack/ZStack",
                                api: "ForEach { VStack { if … { Text } } }") {
                        LazyVStack(alignment: .leading, spacing: 4) {
                            ForEach(namedFonts) { item in
                                VStack(alignment: .leading) {
                                    if item.name.count != 4 {
                                        Text(item.name)
                                            .font(.body)
                                            .foregroundStyle(.primary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct FENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FENote] = [
        .init(title: "ForEach is not a View — it's a DynamicViewContent producer.",
              detail: "ForEach generates child views inside containers that know how to absorb a dynamic collection (List, LazyVStack, Picker, Form, Table, Group). Used at the top level of a body, it still works because SwiftUI flattens it; structural containers get the most benefit.",
              symbol: "function"),
        .init(title: "Identity must be stable across updates.",
              detail: "Either conform elements to Identifiable, or pass a KeyPath via id:. The chosen ID drives diffing — if it changes for the same logical row, SwiftUI tears down and rebuilds the view, breaking animation and selection. UUID() in a struct's stored property is fine; UUID() recomputed each render is not.",
              symbol: "person.badge.key"),
        .init(title: "Range vs collection iteration are semantically different.",
              detail: "ForEach(0..<n) is for FIXED ranges only — SwiftUI assumes the count never changes between renders. To iterate a mutable collection, use ForEach(collection) or ForEach(collection.indices, id: \\.self). Animating a Range whose endpoint changes triggers a runtime warning.",
              symbol: "ruler"),
        .init(title: "Lazy containers query ForEach lazily.",
              detail: "Inside List, LazyVStack, LazyHStack, LazyVGrid, LazyHGrid, and Table, the row builder is called per visible element. To preserve performance, ensure the closure produces a CONSTANT number of views per element (wrap conditionals in a VStack/HStack/ZStack — see the side-by-side above).",
              symbol: "tortoise"),
        .init(title: "-LogForEachSlowPath YES surfaces the non-constant-count warning.",
              detail: "Pass this launch argument in the scheme to log every ForEach whose closure produces a variable view count inside a lazy container. Use it once when investigating list scroll hitches.",
              symbol: "flag"),
        .init(title: "init(_:editActions:content:) is iOS-flavored on macOS.",
              detail: "Move and delete actions are surfaced through iOS edit mode (EditButton) and swipe gestures. macOS Lists don't expose an edit-mode toggle, so the gestures don't appear by default — the overload still compiles and behaves correctly when the underlying binding is mutated by other code.",
              symbol: "pencil.slash"),
        .init(title: "init(sections:) and init(subviews:) are specialized.",
              detail: "init(sections:content:) consumes TableSectionContent and only renders inside Table — see the Table page. init(subviews:content:) (macOS 15+) iterates the subviews of a hand-built view, useful when authoring layouts that need to compose each child individually.",
              symbol: "rectangle.split.3x1")
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

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height, alignment: .topLeading)
                .padding(12)
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

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 280, height: demoFrameHeight, alignment: .topLeading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    ForEachPage()
        .frame(width: 1100, height: 800)
}
