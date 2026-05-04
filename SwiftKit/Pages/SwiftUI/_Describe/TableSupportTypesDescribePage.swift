import SwiftUI

// Describe-track page for SwiftUI Table Supporting Types.
// Source: Documentation/SwiftUI/tables/
// macOS 12.0+. These are protocols, result builders, and internal container types
// used inside Table declarations — none render as standalone Views.

struct TableSupportTypesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Table Supporting Types",
            docPath: "Documentation/SwiftUI/tables/",
            availability: "macOS 12.0+",
            blurb: """
            SwiftUI's Table is built on a rich set of supporting protocols, result builders, and internal \
            container types that rarely appear at the call site. TableColumnContent and TableRowContent are \
            the protocols that Table accepts in its column and row builders — you don't conform to them \
            directly; TableColumn, TableRow, and ForEach already do. DynamicTableRowContent extends \
            TableRowContent for dynamic collections. TableColumnBuilder and TableRowBuilder are the result \
            builders that make the two-closure Table { columns } rows: { rows } DSL work.

            The concrete container types — TableRow, TableForEachContent, TupleTableRowContent, \
            EmptyTableRowContent, TableHeaderRowContent, and TableOutlineGroupContent — are constructed \
            internally by SwiftUI; you see them only in generic constraints or error messages. \
            TableColumnCustomizationBehavior (.automatic, .disabled, .reorderable) controls per-column \
            drag-reorder behavior, applied via .customizationBehavior(_:for:). TableColumnAlignment controls \
            text alignment within a column. tableColumnHeaders(.hidden) is a View modifier that hides the \
            header row from the table. None of these types have standalone rendering — they are meaningful \
            only inside a Table { } declaration.
            """,
            signatures: [
                "protocol TableRowContent",
                "protocol TableColumnContent",
                "protocol DynamicTableRowContent: TableRowContent",
                "@resultBuilder struct TableColumnBuilder",
                "@resultBuilder struct TableRowBuilder",
                "TableRow<Value>",
                "TableForEachContent<Data>",
                "TupleTableRowContent<T, U>",
                "EmptyTableRowContent",
                "TableHeaderRowContent",
                "TableOutlineGroupContent",
                "TableColumnCustomizationBehavior — .automatic, .disabled, .reorderable",
                "TableColumnAlignment — .leading, .center, .trailing",
                "tableColumnHeaders(.hidden)"
            ],
            notes: [
                "TableColumnBuilder and TableRowBuilder are compiler-synthesized — you never instantiate them.",
                "TableColumnCustomizationBehavior requires Table(of:columnCustomization:) with a TableColumnCustomization binding.",
                "DynamicTableRowContent is the protocol ForEach conforms to when used inside a Table."
            ]
        )
    }
}

#Preview {
    TableSupportTypesDescribePage()
        .frame(width: 900, height: 700)
}
