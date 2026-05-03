import SwiftUI

// SwiftUI `View/selectionDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/lists/selectiondisabled(_:).md
// Single API:
//   func selectionDisabled(_ isDisabled: Bool = true) -> some View
// Marks views in a selectable container (List, Table, Picker) as non-selectable.
// macOS 14.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 260

private struct Item: Identifiable, Hashable {
    let title: String
    let id = UUID()
}

private let items: [Item] = [
    Item(title: "First (disabled)"),
    Item(title: "Second"),
    Item(title: "Third"),
    Item(title: "Fourth"),
    Item(title: "Fifth (disabled)")
]

private enum Flavor: String, CaseIterable, Identifiable, Hashable {
    case vanilla, chocolate, strawberry, mint, pistachio
    var id: String { rawValue }
    var soldOut: Bool { self == .strawberry || self == .mint }
}

struct SelectionDisabledPage: View {
    @State private var listSelection: Item.ID?
    @State private var pickerSelection: Flavor = .vanilla

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
            Text("selectionDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a condition that controls whether users can select this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/selectiondisabled(_:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".selectionDisabled(item == items.first || item == items.last)") {
            List(items, selection: $listSelection) { item in
                Text(item.title)
                    .selectionDisabled(
                        item.id == items.first?.id || item.id == items.last?.id
                    )
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Bare-call form (true)") {
                DemoCard(api: ".selectionDisabled()") {
                    List(items, selection: $listSelection) { item in
                        Text(item.title)
                            .selectionDisabled()
                    }
                }
            }

            VariantBlock(title: "Inside a Picker — sold-out flavors") {
                DemoCard(api: ".selectionDisabled(flavor.soldOut) inside Picker") {
                    Picker("Flavor", selection: $pickerSelection) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                                .selectionDisabled(flavor.soldOut)
                                .tag(flavor)
                        }
                    }
                    .pickerStyle(.menu)
                    .padding()
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — all enabled vs first/last disabled") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default", api: "(no modifier)") {
                        List(items, selection: $listSelection) { item in
                            Text(item.title)
                        }
                    }
                    StateColumn(label: "First/last disabled", api: ".selectionDisabled(...)") {
                        List(items, selection: $listSelection) { item in
                            Text(item.title)
                                .selectionDisabled(
                                    item.id == items.first?.id || item.id == items.last?.id
                                )
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Targets selectable containers — List, Table, Picker.",
              detail: "Apply to the row/option view inside a selectable container. Outside such a container the modifier compiles but has no effect — it specifically suppresses selection chrome on the parent.",
              symbol: "rectangle.stack"),
        .init(title: "Bool default is true — the bare call disables.",
              detail: ".selectionDisabled() is shorthand for .selectionDisabled(true). Pass a Bool expression for conditional disabling: .selectionDisabled(item.isLocked).",
              symbol: "switch.2"),
        .init(title: "Doesn't dim the row.",
              detail: "Disabled selection ≠ disabled view. The row still renders normally (no .disabled() effect); only its selection target is suppressed. Use .disabled(_:) if you want both visual de-emphasis and selection blocking.",
              symbol: "eye"),
        .init(title: "Useful for placeholder rows or unavailable options.",
              detail: "Common patterns: 'Add new...' rows that shouldn't be selected like content; sold-out picker options; section header rows in a custom flat list. The selection state simply skips them.",
              symbol: "questionmark.square.dashed")
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
                .frame(width: demoFrameWidth, height: height)
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
                .frame(width: 280, height: demoFrameHeight)
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
    SelectionDisabledPage()
        .frame(width: 1100, height: 800)
}
