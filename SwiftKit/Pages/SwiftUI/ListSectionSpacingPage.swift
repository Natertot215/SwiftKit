import SwiftUI

// SwiftUI `ListSectionSpacing` family — merged page covering:
//   1. View/listSectionSpacing(_:) modifier
//   2. ListSectionSpacing type (.default, .compact, .custom(_:))
// Source: Documentation/SwiftUI/lists/listsectionspacing(_:).md, listsectionspacing.md
//
// IMPORTANT: Both the modifier and the type are @available(macOS, unavailable).
// They exist on iOS / iPadOS / Mac Catalyst / visionOS / watchOS only.
// SwiftKit documents this family for API-surface completeness; no live demo on macOS.

struct ListSectionSpacingPage: View {
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
            Text("listSectionSpacing(_:) + ListSectionSpacing")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The modifier that controls section gaps in a List, and the type enumerating symbolic spacing values. Unavailable on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionspacing(_:).md, listsectionspacing.md · iOS 17.0+ (macOS UNAVAILABLE)")
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
        VStack(alignment: .leading, spacing: 40) {

            // Section 1: listSectionSpacing(_:) modifier
            Group {
                Text("View/listSectionSpacing(_:)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sets the spacing between adjacent sections in a List. Two overloads on iOS — one taking a CGFloat point value, one taking a ListSectionSpacing symbolic value.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("func listSectionSpacing(_ spacing: CGFloat) -> some View")
                    APICallout("func listSectionSpacing(_ spacing: ListSectionSpacing) -> some View")

                    Text("Documented examples (iOS only)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    SectionCodeBlock(text:
                        """
                        List {
                            Section("Colors") { Text("Blue"); Text("Red") }
                            Section("Shapes") { Text("Square"); Text("Circle") }
                        }
                        .listSectionSpacing(5.0)
                        """)
                    SectionCodeBlock(text:
                        """
                        // Per-Section override — wins over the List-level value
                        Section("Borders") {
                            Text("Dashed"); Text("Solid")
                        }
                        .listSectionSpacing(10.0)
                        """)
                    SectionCodeBlock(text:
                        """
                        // ListSectionSpacing enum overload
                        .listSectionSpacing(.compact)
                        .listSectionSpacing(.default)
                        .listSectionSpacing(.custom(30))
                        """)
                }
            }

            // Section 2: ListSectionSpacing type
            Group {
                Text("ListSectionSpacing")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("The spacing options between two adjacent sections in a list. Three documented values for the symbolic overload of listSectionSpacing(_:).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("struct ListSectionSpacing : Sendable  // iOS 17.0+, macOS UNAVAILABLE")

                    VStack(alignment: .leading, spacing: 8) {
                        caseRow(name: "ListSectionSpacing.default",
                                summary: "Inherits the active list style's default section gap.")
                        Divider()
                        caseRow(name: "ListSectionSpacing.compact",
                                summary: "Tighter gap between sections than the style's default.")
                        Divider()
                        caseRow(name: "ListSectionSpacing.custom(_ spacing: CGFloat)",
                                summary: "Explicit point value — escape-hatch for hand-tuned spacing.")
                    }
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        unavailableNotice
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Unavailable on macOS.",
              detail: "Per the macOS 26 SDK swiftinterface, both .listSectionSpacing(_:) overloads (CGFloat and ListSectionSpacing) and the ListSectionSpacing type itself are gated to iOS / iPadOS / Mac Catalyst / visionOS / watchOS. The closest macOS surface is .listSectionMargins(_:_:) — also iOS-flavored on macOS 26.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Two overloads on iOS — CGFloat or ListSectionSpacing.",
              detail: "The CGFloat form is direct: a custom point value. The ListSectionSpacing form is symbolic: .compact, .default, or .custom(CGFloat). Use the symbolic form to inherit platform-appropriate defaults.",
              symbol: "switch.2"),
        .init(title: ".default is not the same as omitting the modifier.",
              detail: "Applying .default explicitly is equivalent to not applying the modifier at all when the surrounding code hasn't already set a different value. Useful inside conditional code that needs to revert to defaults.",
              symbol: "arrow.uturn.backward"),
        .init(title: ".compact tightens; .custom(_:) takes any point value.",
              detail: ".compact is the platform-tight option, calibrated by the list style. .custom(_: CGFloat) is escape-hatch for hand-tuned spacing — use sparingly, prefer .compact / .default first to stay aligned with the system.",
              symbol: "arrow.up.and.down"),
        .init(title: "Per-Section overrides win over the List-level value (iOS).",
              detail: "Apply to the List for a uniform gap, or to a specific Section to override only that section's spacing. Adjacent sections with different values each apply half their spacing.",
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

    // MARK: Helpers

    private var unavailableNotice: some View {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text("listSectionSpacing(_:) and ListSectionSpacing are unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, both modifier overloads and the ListSectionSpacing type are gated to iOS / iPadOS / Mac Catalyst / visionOS / watchOS. SwiftKit can't show a live demo on macOS — see Variants for documented usage.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func caseRow(name: String, summary: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
            Text(summary)
                .font(.callout)
                .foregroundStyle(.primary)
        }
    }
}

// MARK: - Page-local helper

private struct SectionCodeBlock: View {
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
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    ListSectionSpacingPage()
        .frame(width: 1100, height: 900)
}
