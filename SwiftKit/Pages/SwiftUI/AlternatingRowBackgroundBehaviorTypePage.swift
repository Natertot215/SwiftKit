import SwiftUI

// SwiftUI `AlternatingRowBackgroundBehavior` (struct) reference page.
// Source: Documentation/SwiftUI/lists/alternatingrowbackgroundbehavior.md
// Three documented values:
//   .automatic  — defer to the list style's default
//   .enabled    — force alternating backgrounds on
//   .disabled   — force alternating backgrounds off
// Used as the argument to .alternatingRowBackgrounds(_:). macOS 14.0+.

private let demoFrameWidth: CGFloat = 220
private let demoFrameHeight: CGFloat = 240

private struct Ingredient: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private let ingredients: [Ingredient] = [
    Ingredient(name: "Flour"),
    Ingredient(name: "Sugar"),
    Ingredient(name: "Butter"),
    Ingredient(name: "Eggs"),
    Ingredient(name: "Vanilla")
]

struct AlternatingRowBackgroundBehaviorTypePage: View {
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
            Text("AlternatingRowBackgroundBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The styling of views with respect to alternating row backgrounds.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/alternatingrowbackgroundbehavior.md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".alternatingRowBackgrounds(.enabled)") {
            List(ingredients) { Text($0.name) }
                .listStyle(.bordered)
                .alternatingRowBackgrounds(.enabled)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three documented values — side by side") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".automatic", api: ".alternatingRowBackgrounds(.automatic)") {
                        list(behavior: .automatic)
                    }
                    StateColumn(label: ".enabled", api: ".alternatingRowBackgrounds(.enabled)") {
                        list(behavior: .enabled)
                    }
                    StateColumn(label: ".disabled", api: ".alternatingRowBackgrounds(.disabled)") {
                        list(behavior: .disabled)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("AlternatingRowBackgroundBehavior is a value type with three named cases. There are no per-instance states — see the variants above.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "Used as the argument to .alternatingRowBackgrounds(_:).",
              detail: "The modifier accepts an AlternatingRowBackgroundBehavior value. The bare-call form .alternatingRowBackgrounds() defaults to .enabled.",
              symbol: "function"),
        .init(title: ".automatic vs .enabled — subtle difference.",
              detail: ".automatic lets the list style decide. .enabled forces the alternating fill regardless of style — except .sidebar, which still ignores the modifier.",
              symbol: "switch.2"),
        .init(title: ".disabled forces the fill off across all alternating-aware styles.",
              detail: "Use when you want a list style that normally alternates (.bordered, .inset, automatic) to render with a flat background — typically because rows have their own .listRowBackground.",
              symbol: "xmark.rectangle"),
        .init(title: "Conforms to Equatable, Hashable, Sendable.",
              detail: "Safe to store in @State / pass across actor boundaries. Three values mean an enum or struct fits — Apple ships this as an opaque struct with static members.",
              symbol: "checkmark.shield")
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

    // MARK: Helpers

    private func list(behavior: AlternatingRowBackgroundBehavior) -> some View {
        List(ingredients) { Text($0.name) }
            .listStyle(.bordered)
            .alternatingRowBackgrounds(behavior)
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
                .frame(width: 360, height: height)
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

#Preview {
    AlternatingRowBackgroundBehaviorTypePage()
        .frame(width: 1100, height: 800)
}
