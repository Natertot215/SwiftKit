import SwiftUI

// SwiftUI `View.tag(_:includeOptional:)` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/tag(_:includeoptional:).md
// Live demo: tag values inside a Picker selection.

private enum Flavor: String, Hashable, CaseIterable {
    case vanilla, chocolate, strawberry
}

struct TagGalleryPage: View {
    @State private var flavor: Flavor = .vanilla
    @State private var optionalFlavor: Flavor? = nil
    @State private var color: String = "blue"

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
            Text("View.tag(_:includeOptional:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the tag value of a view, used inside a control to identify the selected item.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/tag(_:includeoptional:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Tag inside a Picker") {
            VStack(alignment: .leading, spacing: 8) {
                Picker("Flavor", selection: $flavor) {
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 360)

                Text("selection: .\(flavor.rawValue)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            APICallout("Text(\u{2026}).tag(Flavor.vanilla)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Optional selection") {
                Picker("Optional flavor", selection: $optionalFlavor) {
                    Text("None").tag(Flavor?.none)
                    Text("Vanilla").tag(Flavor?.some(.vanilla))
                    Text("Chocolate").tag(Flavor?.some(.chocolate))
                }
                .frame(maxWidth: 360)
                Text("selection: \(optionalFlavor.map { ".some(.\($0.rawValue))" } ?? ".none")")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                APICallout(".tag(Flavor?.some(.vanilla))  \u{2014}  .tag(Flavor?.none)")
                Text("When the selection binding is Optional, tag values must match its full Optional-wrapped type. Use .tag(T?.some(value)) and .tag(T?.none).")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "String tags") {
                Picker("Color", selection: $color) {
                    Text("Blue").tag("blue")
                    Text("Green").tag("green")
                    Text("Red").tag("red")
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 240)
                APICallout("Text(\u{2026}).tag(\"blue\")")
                Text("Tag values are arbitrary Hashable types \u{2014} strings, ints, enums, identifiable IDs.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "ForEach over tagged options") {
                Picker("Flavor", selection: $flavor) {
                    ForEach(Flavor.allCases, id: \.self) { f in
                        Text(f.rawValue.capitalized).tag(f)
                    }
                }
                .frame(maxWidth: 360)
                APICallout("ForEach(Flavor.allCases, id: \\.self) { Text($0.\u{2026}).tag($0) }")
            }

            Block(title: "Selection type must match tag type") {
                snippet("""
                @State var pick: Int = 0

                Picker("N", selection: $pick) {
                    Text("Zero").tag(0)   // Int — OK
                    Text("One").tag(1)    // Int — OK
                    // Text("Two").tag(\"2\") // String — runtime mismatch!
                }
                """)
                Text("All tags inside a Picker must match the selection binding's type exactly. Mismatches silently break selection.")
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
        .init(title: "Tag is the selection key.",
              detail: "Picker / List / TabView with a selection binding pick the row whose tag matches the binding's value. Without .tag(_:), the control falls back to other identity sources (Identifiable, ForEach id).",
              symbol: "tag"),
        .init(title: "Tag values must be Hashable.",
              detail: "Signature: `func tag<V>(_ tag: V, includeOptional: Bool = true) -> some View where V: Hashable`. Use enums or model IDs.",
              symbol: "checkmark.seal"),
        .init(title: "includeOptional defaults to true.",
              detail: "When true, tagging a value V automatically also matches a V? selection by wrapping in .some(\u{2026}). Pass false to opt out and require explicit Optional-wrapped tags.",
              symbol: "questionmark.circle"),
        .init(title: "All tags within a control must share a type.",
              detail: "If the selection binding is `Flavor`, every .tag(\u{2026}) inside must produce a Flavor. Mismatches don't error \u{2014} they silently fail to select.",
              symbol: "exclamationmark.triangle"),
        .init(title: "TabView and List use it too.",
              detail: ".tag(_:) is the universal selection key, not just a Picker thing. Useful in TabView { \u{2026} } selection bindings and List(selection:).",
              symbol: "list.bullet")
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

extension TagGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.tag",
        title: "Tag",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["View/tag(_:includeOptional:)"],
        blurb: "Sets the unique tag value of this view. Used to differentiate selectable views — for example, the values of a Picker or the tabs of a TabView.",
        signature: "nonisolated func tag<V>(_ tag: V, includeOptional: Bool = true) -> some View where V : Hashable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/tag(_:includeoptional:).md",
        page: { AnyView(TagGalleryPage()) }
    )
}

#Preview {
    TagGalleryPage()
        .frame(width: 1100, height: 800)
}
