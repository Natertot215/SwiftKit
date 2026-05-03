import SwiftUI

// SwiftUI `Visibility` enum reference page.
// Source: Documentation/SwiftUI/view-configuration/visibility.md
// macOS 12.0+. Three cases: .automatic, .visible, .hidden. Used by many modifiers
// (.labelsVisibility, .menuIndicator, .listRowSeparator, .toolbar, etc.).

struct VisibilityTypePage: View {
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
            Text("Visibility")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The visibility of a UI element, chosen automatically based on the platform, current context, and other factors.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/visibility.md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            VTRow(value: ".automatic", description: "System decides per platform / context")
            VTRow(value: ".visible", description: "Force the element to render")
            VTRow(value: ".hidden", description: "Force the element to be omitted visually")
            APICallout("@frozen enum Visibility { case automatic, visible, hidden }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VTSectionRow(title: "Modifiers that consume Visibility") {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".labelsVisibility(_:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".menuIndicator(_:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".persistentSystemOverlays(_:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".listRowSeparator(_:edges:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".listSectionSeparator(_:edges:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".scrollIndicators(_:axes:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".toolbar(_:for:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".toolbarBackground(_:for:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            }

            VTSectionRow(title: "Live demo \u{2014} list row separators") {
                HStack(alignment: .top, spacing: 16) {
                    ForEach([Visibility.automatic, .visible, .hidden], id: \.self) { v in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(label(for: v))
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                            List {
                                Text("Row 1")
                                Text("Row 2")
                                Text("Row 3")
                            }
                            .listStyle(.plain)
                            .listRowSeparator(v)
                            .frame(width: 200, height: 140)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VTSectionRow(title: "Conformances") {
                Text("BitwiseCopyable, CaseIterable, Copyable, Equatable, Hashable, Sendable, SendableMetatype")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
    }

    private struct VTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [VTNote] = [
        .init(title: ".automatic is not a third visual state.",
              detail: ".automatic asks the system to pick \u{2014} usually .visible on macOS, but the choice can depend on the surrounding modifier and platform conventions.",
              symbol: "gear"),
        .init(title: "@frozen \u{2014} cases are stable across SDK versions.",
              detail: "You can switch on Visibility exhaustively without an @unknown default. The three cases are guaranteed not to grow.",
              symbol: "lock.shield"),
        .init(title: "Used by every visibility-shaped modifier.",
              detail: "Whenever a modifier name ends in \"...Visibility\" it almost certainly takes a Visibility value. Same enum, different surface.",
              symbol: "puzzlepiece"),
        .init(title: "CaseIterable \u{2014} iterate via Visibility.allCases.",
              detail: "Useful for building Pickers or test fixtures that exercise every value. The order is .automatic, .visible, .hidden.",
              symbol: "list.bullet"),
        .init(title: "Hashable + Equatable \u{2014} works as a Picker tag.",
              detail: "You can bind a Picker selection to a Visibility-typed @State directly, no wrappers needed.",
              symbol: "checklist")
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

    private func label(for v: Visibility) -> String {
        switch v {
        case .automatic: return ".automatic"
        case .visible:   return ".visible"
        case .hidden:    return ".hidden"
        @unknown default: return String(describing: v)
        }
    }
}

private struct VTRow: View {
    let value: String
    let description: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(value)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 120, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

private struct VTSectionRow<Content: View>: View {
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
    VisibilityTypePage()
        .frame(width: 1100, height: 800)
}
