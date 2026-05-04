import SwiftUI

// Describe-track page for TextSelectability.
// Source: Documentation/SwiftUI/text-input-and-output/textselectability.md
// macOS 12.0+. A protocol — not a renderable view.

struct TextSelectabilityDescribePage: View {
    var body: some View {
        DescribePage(
            title: "TextSelectability",
            docPath: "Documentation/SwiftUI/text-input-and-output/textselectability.md",
            availability: "macOS 12.0+",
            blurb: """
            TextSelectability is the protocol that backs the .textSelection(_:) modifier. SwiftUI ships \
            two conforming types: EnabledTextSelectability (accessible as .enabled) and \
            DisabledTextSelectability (accessible as .disabled). When you apply .textSelection(.enabled) \
            to a Text or container, the system allows the user to select and copy the text content. When \
            .disabled, selection is blocked even if a parent view enables it. The protocol itself is a \
            conformance target — you don't implement it directly. On macOS, text selection is typically \
            enabled by default for TextEditor but disabled for Text; the modifier overrides that default.
            """,
            signatures: [
                "protocol TextSelectability",
                ".textSelection(.enabled) — allow text selection on Text",
                ".textSelection(.disabled) — disable text selection"
            ],
            notes: [
                ".textSelection(.enabled) on a container propagates to all Text descendants.",
                "TextSelectability is a protocol, not an enum — the cases are static properties on concrete types.",
                "macOS 12.0+; iOS 15.0+; watchOS 8.0+"
            ]
        )
    }
}

#Preview {
    TextSelectabilityDescribePage()
        .frame(width: 900, height: 700)
}
