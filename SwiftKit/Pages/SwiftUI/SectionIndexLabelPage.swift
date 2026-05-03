import SwiftUI

// SwiftUI `View/sectionIndexLabel(_:)` reference page.
// Source: Documentation/SwiftUI/lists/sectionindexlabel(_:).md
// Two overloads exist (both available on macOS 26+):
//   func sectionIndexLabel(_ label: Text?) -> some View
//   func sectionIndexLabel<S: StringProtocol>(_ label: S?) -> some View
//
// macOS 26+ has the symbol but does not draw a section-index control. The
// section-index UI is iOS / watchOS-flavored. The companion modifier
// .listSectionIndexVisibility(_:) is itself unavailable on macOS — see that
// page for details. SwiftKit shows the label modifier compiling on macOS
// while explaining that no visible chrome appears.

struct SectionIndexLabelPage: View {
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
            Text("sectionIndexLabel(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the label that is used in a section index to point to this section.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/sectionindexlabel(_:).md · macOS 26.0+ (no macOS section-index chrome)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".sectionIndexLabel(\"A\")") {
            List {
                Section("Apples") {
                    Text("Fuji"); Text("Gala"); Text("Honeycrisp")
                }
                .sectionIndexLabel("A")

                Section("Bananas") {
                    Text("Cavendish"); Text("Plantain")
                }
                .sectionIndexLabel("B")

                Section("Cherries") {
                    Text("Bing"); Text("Rainier")
                }
                .sectionIndexLabel("C")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "String overload") {
                DemoCard(api: ".sectionIndexLabel(\"A\")") {
                    List {
                        Section("Apples") {
                            Text("Fuji"); Text("Gala"); Text("Honeycrisp")
                        }
                        .sectionIndexLabel("A")
                    }
                }
            }

            VariantBlock(title: "Text overload — formatted label") {
                DemoCard(api: ".sectionIndexLabel(Text(\"★\").foregroundStyle(.tint))") {
                    List {
                        Section("Favorites") {
                            Text("Pinned 1"); Text("Pinned 2")
                        }
                        .sectionIndexLabel(Text("★").foregroundStyle(.tint))
                    }
                }
            }

            VariantBlock(title: "Pass nil — exclude this section from the index") {
                DemoCard(api: ".sectionIndexLabel(nil as Text?)") {
                    List {
                        Section("Header — not indexed") {
                            Text("Item 1"); Text("Item 2")
                        }
                        .sectionIndexLabel(nil as Text?)

                        Section("Apples") {
                            Text("Fuji"); Text("Gala")
                        }
                        .sectionIndexLabel("A")
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("Section-index labels render in the iOS trailing-edge letter strip and the watchOS crown-scroll readout. macOS does not draw a section index, so the modifier compiles but produces no visible chrome on macOS Lists. The companion .listSectionIndexVisibility(_:) is itself unavailable on macOS.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Symbol available on macOS 26+; no visible chrome.",
              detail: "Per the macOS 26 SDK, .sectionIndexLabel(_:) compiles on macOS — but macOS Lists don't render a section-index control. The page exists for API-surface completeness and for cross-platform code that targets iOS or watchOS.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Two overloads: Text? and StringProtocol?.",
              detail: "Use the StringProtocol overload for plain literals (\"A\", \"B\"). Use the Text overload when you need formatted content (color, font, accessibility label).",
              symbol: "switch.2"),
        .init(title: "Pass nil to exclude a section from the index.",
              detail: "Sections without a label are skipped in the index. Passing nil explicitly is equivalent to not calling the modifier — useful in conditional code that may or may not want a given section indexed.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Companion .listSectionIndexVisibility(_:) is macOS-unavailable.",
              detail: "On supported platforms, the visibility modifier toggles the index strip. macOS doesn't expose it. SwiftKit's .listSectionIndexVisibility page documents the iOS/watchOS behavior with explicit unavailability notice for macOS.",
              symbol: "rectangle.righthalf.inset.filled")
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
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: 380, height: 280)
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
    SectionIndexLabelPage()
        .frame(width: 1100, height: 800)
}
