import SwiftUI

// SwiftUI `EditMode` (enum) reference page.
// Source: Documentation/SwiftUI/lists/editmode.md
// Three documented cases:
//   .active      — editing is active
//   .inactive    — editing is not active
//   .transient   — editing is transient (e.g. mid-gesture)
// iOS-ONLY type. The compile-time availability is iOS / iPadOS / Catalyst /
// tvOS / visionOS — macOS is explicitly unavailable. SwiftKit documents this
// page for API-surface completeness; no live demo is possible on macOS.

struct EditModeTypePage: View {
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
            Text("EditMode")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A mode that indicates whether the user can edit a view's content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/editmode.md · iOS 13.0+ (macOS UNAVAILABLE)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        unavailableNotice
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Three documented cases")
                    .font(.headline)
                    .foregroundStyle(.primary)
                CaseCard(api: "EditMode.inactive",
                         summary: "Editing is not active. The view renders in its read-only state.")
                CaseCard(api: "EditMode.active",
                         summary: "Editing is active. Built-in views surface delete/move controls; custom views may swap to editable inputs (e.g. Text → TextField).")
                CaseCard(api: "EditMode.transient",
                         summary: "Editing is transient — for example, mid-gesture during a swipe. Rare to handle directly; treat as a short-lived flag.")
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Read-side usage (iOS)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                CodeBlock(text: """
@Environment(\\.editMode) private var editMode

if editMode?.wrappedValue.isEditing == true {
    TextField("Name", text: $name)
} else {
    Text(name)
}
""")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        unavailableNotice
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "iOS-only — not available on macOS.",
              detail: "EditMode is annotated @available(macOS, unavailable). The macOS path for selection / reordering / deletion is direct: List(selection:) for selection, ForEach.onMove / .onDelete for the row operations, with no global mode toggle.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Read via @Environment(\\.editMode).",
              detail: "On iOS, the value is Binding<EditMode>?. It's optional because no ancestor may have provided one. Set by EditButton or by external code mutating the binding.",
              symbol: "function"),
        .init(title: "EditButton flips it; you can also drive it manually.",
              detail: "iOS provides EditButton, which toggles editMode between .active and .inactive. Manual mutation (editMode?.wrappedValue = .active) is also legal — useful for deep links, restored state, or programmatic flows.",
              symbol: "switch.2"),
        .init(title: "Conforms to Hashable, Equatable, Sendable.",
              detail: "Safe to store in @State or pass across actor boundaries. The .isEditing computed property collapses .active and .transient into a single Bool for the common case.",
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

    private var unavailableNotice: some View {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text("EditMode is iOS-only.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("The type is unavailable on macOS, so a live SwiftKit demo isn't possible. See Variants for documentation of the three cases and the iOS read-side usage pattern.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Reusable demo helpers (page-local)

private struct CaseCard: View {
    let api: String
    let summary: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(api)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
            Text(summary)
                .font(.callout)
                .foregroundStyle(.primary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct CodeBlock: View {
    let text: String

    var body: some View {
        Text(text)
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

#Preview {
    EditModeTypePage()
        .frame(width: 1100, height: 800)
}
