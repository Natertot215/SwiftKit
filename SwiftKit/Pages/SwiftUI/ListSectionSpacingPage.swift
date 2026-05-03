import SwiftUI

// SwiftUI `View/listSectionSpacing(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listsectionspacing(_:).md
// Two overloads exist on supported platforms:
//   func listSectionSpacing(_ spacing: CGFloat) -> some View
//   func listSectionSpacing(_ spacing: ListSectionSpacing) -> some View
//
// IMPORTANT: Both overloads (and the ListSectionSpacing type) are
// @available(macOS, unavailable). The modifier and type are gated to
// iOS / iPadOS / Mac Catalyst / visionOS / watchOS. SwiftKit documents
// this page for API-surface completeness; no live demo is possible on macOS.

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
            Text("listSectionSpacing(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the spacing between adjacent sections in a List to a custom value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionspacing(_:).md · iOS 17.0+ (macOS UNAVAILABLE)")
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
            Text("Documented examples (iOS only)")
                .font(.headline)
                .foregroundStyle(.primary)
            CodeBlock(text: """
List {
    Section("Colors") { Text("Blue"); Text("Red") }
    Section("Shapes") { Text("Square"); Text("Circle") }
}
.listSectionSpacing(5.0)
""")
            CodeBlock(text: """
// Per-Section override — wins over the List-level value
Section("Borders") {
    Text("Dashed"); Text("Solid")
}
.listSectionSpacing(10.0)
""")
            CodeBlock(text: """
// ListSectionSpacing enum overload
.listSectionSpacing(.compact)
.listSectionSpacing(.default)
.listSectionSpacing(.custom(30))
""")
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
              detail: "Per the macOS 26 SDK swiftinterface, both .listSectionSpacing(_:) overloads (CGFloat and ListSectionSpacing) are @available(macOS, unavailable). The closest macOS surface is .listSectionMargins(_:_:) — also iOS-flavored on macOS 26.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Two overloads on iOS — CGFloat or ListSectionSpacing.",
              detail: "The CGFloat form is direct: a custom point value. The ListSectionSpacing form is symbolic: .compact, .default, or .custom(CGFloat). Use the symbolic form to inherit platform-appropriate defaults.",
              symbol: "switch.2"),
        .init(title: "Per-Section overrides win over the List-level value (iOS).",
              detail: "Apply to the List for a uniform gap, or to a specific Section to override only that section's spacing. Adjacent sections with different values each apply half their spacing.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Different list styles use different default section gaps.",
              detail: ".plain has no visible section gap; .inset / .bordered / .sidebar each pick a calibrated value. Override with this modifier (on iOS) when the style's default doesn't match your hierarchy density.",
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

    // MARK: Helpers

    private var unavailableNotice: some View {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text(".listSectionSpacing(_:) is unavailable on macOS.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Per the macOS 26 SDK, both modifier overloads (CGFloat and ListSectionSpacing) and the ListSectionSpacing type itself are gated to iOS / iPadOS / Mac Catalyst / visionOS / watchOS. SwiftKit can't show a live demo on macOS — see Variants for documented usage on supported platforms.")
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
    ListSectionSpacingPage()
        .frame(width: 1100, height: 800)
}
