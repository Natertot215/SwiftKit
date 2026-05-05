import SwiftUI

// Describe-track page for the "Organize Your User Interface with a Stack View"
// article (kind: article, not a class).
// Source: Documentation/AppKit/views-and-controls/organize-your-user-interface-with-a-stack-view.md
// This is Apple's narrative companion to NSStackView — it walks through a
// sample architecture (StackItemHeader, StackItemBody, StackItemContainer,
// StackItemHost) for embedding a stack view inside an NSScrollView with
// disclosable header/body sections. The article doesn't define API; the
// renderable surface lives on the NSStackView page.

struct OrganizeYourUserInterfaceWithAStackViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Organize Your User Interface with a Stack View",
            docPath: "Documentation/AppKit/views-and-controls/organize-your-user-interface-with-a-stack-view.md",
            availability: "macOS 10.13+",
            blurb: """
            An Apple sample-code article that demonstrates how to compose \
            NSStackView with NSScrollView and a small set of host protocols to \
            produce a scrollable column of disclosable sections (think the \
            multi-collapse panels in Xcode's Identity inspector or System \
            Settings' grouped panes). The article doesn't introduce its own \
            API — it documents a four-protocol pattern layered on top of \
            existing AppKit:

              \u{2022} StackItemHeader — the section's header view; owns the \
            disclosure control that toggles the body's visibility.
              \u{2022} StackItemBody — the section's primary content view.
              \u{2022} StackItemContainer — pairs one header with one body and \
            tracks an NSControl.StateValue for the disclosure state (.on, .off).
              \u{2022} StackItemHost — discloses each container, animating the \
            stack view's visibility / detachment when the user toggles a section.

            The sample also wires up NSWindowRestoration / NSRestorableState \
            so disclosure states and per-item content (text-field values, etc.) \
            survive relaunch. Disclosure controls can be either a standard \
            triangle (NSButton with the disclosure style) or a pair of up/down \
            arrows (the roundedDisclosure style).
            """,
            signatures: [
                "// Pattern protocols described by the article — not framework API:",
                "protocol StackItemHeader { /* disclosure control */ }",
                "protocol StackItemBody   { /* section content */ }",
                "protocol StackItemContainer { var header: StackItemHeader; var body: StackItemBody; var state: NSControl.StateValue }",
                "protocol StackItemHost    { /* discloses each container */ }"
            ],
            notes: [
                "Doc kind: article. The article itself defines no API — the renderable surface is NSStackView (with NSScrollView wrapping for scroll-on-overflow).",
                "Stack views detach hidden views when clipping resistance is below NSLayoutConstraint.Priority.required. Detached views remain in memory but leave the layout.",
                "Visibility priority on each arranged subview controls detach order — lower priority detaches first when space is tight.",
                "State restoration: encode disclosure state and per-section content via NSCoder in encodeRestorableState(with:); restore in restoreState(with:).",
                "Disclosure styles for the header button: NSButton.BezelStyle.disclosure (triangle) or .roundedDisclosure (up/down arrows).",
                "Pair with NSScrollView when sections may exceed the available height — the article wraps the stack view in a scroll view to keep all sections reachable.",
                "See Also (per Apple's doc): NSStackView, NSTabView, NSSplitView, Grid View, Scroll View, Localization-friendly layouts in macOS."
            ]
        )
    }
}

#Preview {
    OrganizeYourUserInterfaceWithAStackViewDescribePage()
        .frame(width: 900, height: 700)
}
