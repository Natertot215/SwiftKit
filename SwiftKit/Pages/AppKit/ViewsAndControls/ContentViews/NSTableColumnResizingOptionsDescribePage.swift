import SwiftUI

// Describe-track page for NSTableColumn.ResizingOptions.
// Source: Documentation/AppKit/views-and-controls/resizingoptions.md
// Nested struct (OptionSet) on NSTableColumn. The renderable surface is on
// the NSTableView page where each column's resizingMask is set in code.

struct NSTableColumnResizingOptionsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTableColumn.ResizingOptions",
            docPath: "Documentation/AppKit/views-and-controls/resizingoptions.md",
            availability: "macOS",
            blurb: """
            Option-set value type assigned to NSTableColumn.resizingMask. \
            It controls two independent behaviors a column can opt into:

              \u{2022} autoresizingMask — the column participates in \
            proportional autoresizing as the table view's overall width \
            changes. Combined across columns, this is how the table \
            distributes extra width when its scroll view widens.
              \u{2022} userResizingMask — the user can drag the column's \
            header divider to manually resize the column. Without this \
            flag, the column's width is fixed regardless of cursor input.

            The two flags are independent, so a column can be:

              \u{2022} [.userResizingMask, .autoresizingMask] — the most \
            common configuration. The user can drag the divider AND the \
            column reflows when the table widens.
              \u{2022} [.userResizingMask] — user-resizable, no \
            autoresizing. Useful for fixed-content columns the user might \
            want larger but that shouldn't grow on window resize.
              \u{2022} [.autoresizingMask] — proportional reflow only, no \
            user dragging. Useful when one column should always own the \
            extra space and the user shouldn't be able to disturb that.
              \u{2022} [] — fully fixed width.

            ResizingOptions is an OptionSet, so it composes with the usual \
            set-algebra operators (.union, .intersection, .subtracting, \
            .insert, .remove). \
            ExpressibleByArrayLiteral lets array-literal syntax work \
            directly.
            """,
            signatures: [
                "struct ResizingOptions : OptionSet",
                "init(rawValue: UInt)",
                "static let autoresizingMask: NSTableColumn.ResizingOptions",
                "static let userResizingMask: NSTableColumn.ResizingOptions",
                "// Usage:",
                "column.resizingMask = [.userResizingMask, .autoresizingMask]"
            ],
            notes: [
                "OptionSet conformance is the load-bearing fact — combine flags with array literal syntax, not with custom OR operators.",
                "Conforms to BitwiseCopyable, Equatable, ExpressibleByArrayLiteral, OptionSet, RawRepresentable, Sendable, SetAlgebra. Cheap to pass around and persist.",
                "Default for a freshly-init'd NSTableColumn includes both flags — unset deliberately if a column should be fixed in some dimension.",
                "Think of resizingMask as orthogonal: \"can the user drag this divider?\" + \"does this column reflow as the table widens?\". The two questions never collapse into one.",
                "Pairs with NSTableView.columnAutoresizingStyle (an enum on the table view) which decides how the autoresizingMask flags on individual columns are honored across the table as a whole."
            ]
        )
    }
}

#Preview {
    NSTableColumnResizingOptionsDescribePage()
        .frame(width: 900, height: 700)
}
