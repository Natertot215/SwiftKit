import SwiftUI

// SwiftUI `ViewBuilder` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/viewbuilder.md
// Live demo: a custom container that takes a @ViewBuilder closure.

private struct LabeledGroup<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .textCase(.uppercase)
            VStack(alignment: .leading, spacing: 6) {
                content()
            }
            .padding(10)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct ViewBuilderPage: View {
    @State private var showSecondLine = true

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
            Text("ViewBuilder")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A custom parameter attribute that constructs views from closures.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/viewbuilder.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Custom container with @ViewBuilder content") {
            LabeledGroup(title: "Account") {
                Text("Ada Lovelace")
                Text("ada@example.com").foregroundStyle(.secondary)
                Text("Member since 2024").font(.caption).foregroundStyle(.tertiary)
            }
            APICallout("@ViewBuilder var content: () -> Content")
            Text("LabeledGroup accepts an arbitrary number of child views via a @ViewBuilder closure.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Conditional children") {
                LabeledGroup(title: "Conditional") {
                    Text("Always visible")
                    if showSecondLine {
                        Text("Conditionally visible").foregroundStyle(.tint)
                    }
                }
                Toggle("Show second line", isOn: $showSecondLine)
                    .toggleStyle(.switch)
                APICallout("if/else inside a ViewBuilder closure compiles to _ConditionalContent")
            }

            Block(title: "Loops via ForEach") {
                LabeledGroup(title: "Days") {
                    ForEach(["Mon", "Tue", "Wed", "Thu", "Fri"], id: \.self) { day in
                        Text(day)
                    }
                }
                APICallout("ForEach(items, id:) { item in \u{2026} }")
                Text("ViewBuilder doesn't unroll plain for-loops. Use ForEach to iterate over collections.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Switch over an enum") {
                snippet("""
                enum Status { case ok, warning, error }
                @State var status: Status = .ok

                @ViewBuilder
                var statusBadge: some View {
                    switch status {
                    case .ok:      Label("OK", systemImage: "checkmark.circle")
                    case .warning: Label("Warning", systemImage: "exclamationmark.triangle")
                    case .error:   Label("Error", systemImage: "xmark.octagon")
                    }
                }
                """)
                Text("switch in a @ViewBuilder context produces _ConditionalContent variants per case.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "@ViewBuilder on a function") {
                snippet("""
                @ViewBuilder
                func badge(_ kind: String) -> some View {
                    switch kind {
                    case "new": Text("NEW").foregroundStyle(.tint)
                    case "hot": Text("HOT").foregroundStyle(.red)
                    default:    EmptyView()
                    }
                }
                """)
                Text("Annotate any function returning `some View` with @ViewBuilder to enable multi-statement, conditional, and loop-free composition.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Limits of ViewBuilder") {
                snippet("""
                // OK — ForEach handles iteration.
                ForEach(items) { Text($0.name) }

                // NOT OK — plain for-loops don't compile in ViewBuilder.
                // for item in items { Text(item.name) }
                """)
                Text("ViewBuilder accepts up to 10 sibling expressions, if/else, switch, available checks, and Group. Use ForEach for collections.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "@resultBuilder under the hood.",
              detail: "ViewBuilder is a Swift @resultBuilder. The compiler turns a closure body into one expression by calling buildBlock, buildIf, buildEither, buildArray, etc.",
              symbol: "hammer"),
        .init(title: "Used by every container.",
              detail: "VStack, HStack, ZStack, NavigationStack, ToolbarItemGroup, .sheet { \u{2026} }, .alert { \u{2026} } — all take @ViewBuilder closures so you can compose children declaratively.",
              symbol: "rectangle.3.group"),
        .init(title: "Up to 10 siblings without a Group.",
              detail: "buildBlock has overloads for 0\u{2013}10 children. If you exceed the limit, wrap groups in Group { \u{2026} } or split into smaller subviews.",
              symbol: "number"),
        .init(title: "for-loops aren't supported.",
              detail: "Use ForEach to iterate over collections inside a ViewBuilder. ForEach(items, id:) lets SwiftUI track identity for diffing.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Computed properties get an implicit @ViewBuilder.",
              detail: "Inside a `var body: some View`, the closure is implicitly @ViewBuilder. For computed helpers and methods you must add the attribute manually.",
              symbol: "wand.and.stars")
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

    private func snippet(_ code: String) -> some View {
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

private struct Block<Content: View>: View {
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
    ViewBuilderPage()
        .frame(width: 1100, height: 800)
}
