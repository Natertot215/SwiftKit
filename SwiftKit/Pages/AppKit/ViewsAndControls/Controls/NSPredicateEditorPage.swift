import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSPredicateEditor (class, inherits NSRuleEditor) — a
// concrete rule editor that builds NSPredicate values from a set of
// NSPredicateEditorRowTemplate descriptions, no delegate required.
// Source: Documentation/AppKit/views-and-controls/nspredicateeditor.md
//
// Renderable demo: an NSViewRepresentable hosts an NSPredicateEditor
// inside an NSScrollView. Row templates cover string, numeric, and
// date attributes against typical Mail-style operators. The current
// objectValue (NSPredicate) is rendered as a string below.

// MARK: - Bridge

private struct NSPredicateEditorDemo: NSViewRepresentable {
    @Binding var predicateDescription: String

    func makeNSView(context: Context) -> NSScrollView {
        let editor = NSPredicateEditor(frame: NSRect(x: 0, y: 0, width: 700, height: 80))
        editor.autoresizingMask = [.width]
        editor.canRemoveAllRows = false
        editor.nestingMode = .compound
        editor.rowHeight = 26
        editor.rowTemplates = Self.makeTemplates()
        editor.target = context.coordinator
        editor.action = #selector(Coordinator.predicateChanged(_:))

        // Seed an initial predicate so the editor renders one row.
        let seed = NSPredicate(format: "subject CONTAINS[cd] %@", "swift")
        editor.objectValue = seed

        let scroll = NSScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.hasVerticalScroller = true
        scroll.borderType = .lineBorder
        scroll.documentView = editor
        scroll.hasHorizontalScroller = false
        scroll.drawsBackground = true

        DispatchQueue.main.async {
            self.predicateDescription = (editor.objectValue as? NSPredicate)?.description ?? "(none)"
        }
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        context.coordinator.parent = self
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSPredicateEditorDemo
        init(_ parent: NSPredicateEditorDemo) { self.parent = parent }

        @objc func predicateChanged(_ sender: NSPredicateEditor) {
            let p = sender.objectValue as? NSPredicate
            parent.predicateDescription = p?.description ?? "(none)"
        }
    }

    private static func makeTemplates() -> [NSPredicateEditorRowTemplate] {
        let compound = NSPredicateEditorRowTemplate(
            compoundTypes: [
                NSNumber(value: NSCompoundPredicate.LogicalType.and.rawValue),
                NSNumber(value: NSCompoundPredicate.LogicalType.or.rawValue),
                NSNumber(value: NSCompoundPredicate.LogicalType.not.rawValue)
            ]
        )

        let stringFields = [
            NSExpression(forKeyPath: "subject"),
            NSExpression(forKeyPath: "from"),
            NSExpression(forKeyPath: "body")
        ]
        let stringOps: [NSComparisonPredicate.Operator] = [.contains, .beginsWith, .endsWith, .equalTo, .notEqualTo]
        let stringOptions: NSComparisonPredicate.Options = [.caseInsensitive, .diacriticInsensitive]
        let stringTemplate = NSPredicateEditorRowTemplate(
            leftExpressions: stringFields,
            rightExpressionAttributeType: .stringAttributeType,
            modifier: .direct,
            operators: stringOps.map { NSNumber(value: $0.rawValue) },
            options: Int(stringOptions.rawValue)
        )

        let numericFields = [
            NSExpression(forKeyPath: "size"),
            NSExpression(forKeyPath: "attachments")
        ]
        let numericOps: [NSComparisonPredicate.Operator] = [.lessThan, .lessThanOrEqualTo, .equalTo, .greaterThanOrEqualTo, .greaterThan]
        let numericTemplate = NSPredicateEditorRowTemplate(
            leftExpressions: numericFields,
            rightExpressionAttributeType: .integer64AttributeType,
            modifier: .direct,
            operators: numericOps.map { NSNumber(value: $0.rawValue) },
            options: 0
        )

        let dateOps: [NSComparisonPredicate.Operator] = [.lessThan, .equalTo, .greaterThan]
        let dateTemplate = NSPredicateEditorRowTemplate(
            leftExpressions: [NSExpression(forKeyPath: "dateReceived")],
            rightExpressionAttributeType: .dateAttributeType,
            modifier: .direct,
            operators: dateOps.map { NSNumber(value: $0.rawValue) },
            options: 0
        )

        return [compound, stringTemplate, numericTemplate, dateTemplate]
    }
}

// MARK: - Page

struct NSPredicateEditorPage: View {
    @State private var predicateDescription: String = "(none)"

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
            Text("NSPredicateEditor")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A defined set of rules that allows the editing of predicate objects.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSRuleEditor \u{00b7} macOS 10.5+ \u{00b7} Documentation/AppKit/views-and-controls/nspredicateeditor.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSPredicateEditor with Mail-style row templates") {
            VStack(alignment: .leading, spacing: 12) {
                NSPredicateEditorDemo(predicateDescription: $predicateDescription)
                    .frame(height: 220)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Text("objectValue (NSPredicate):")
                    .font(.caption).foregroundStyle(.secondary)
                Text(predicateDescription)
                    .font(.caption).fontDesign(.monospaced)
                    .textSelection(.enabled)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.tertiary, in: RoundedRectangle(cornerRadius: 6))

                APICallout("let editor = NSPredicateEditor(frame: rect)")
                APICallout("editor.rowTemplates = [compoundTemplate, stringTemplate, numericTemplate, dateTemplate]")
                APICallout("editor.objectValue = NSPredicate(format: \"subject CONTAINS[cd] %@\", \"swift\")")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Compound row template (AND/OR/NOT)") {
                snippet("""
                NSPredicateEditorRowTemplate(
                    compoundTypes: [
                        NSNumber(value: NSCompoundPredicate.LogicalType.and.rawValue),
                        NSNumber(value: NSCompoundPredicate.LogicalType.or.rawValue),
                        NSNumber(value: NSCompoundPredicate.LogicalType.not.rawValue)
                    ]
                )
                """)
            }

            Block(title: "String comparison template") {
                snippet("""
                let ops: [NSComparisonPredicate.Operator] = [.contains, .beginsWith, .equalTo]
                NSPredicateEditorRowTemplate(
                    leftExpressions: [NSExpression(forKeyPath: "subject"),
                                      NSExpression(forKeyPath: "from")],
                    rightExpressionAttributeType: .stringAttributeType,
                    modifier: .direct,
                    operators: ops.map { NSNumber(value: $0.rawValue) },
                    options: Int(NSComparisonPredicate.Options.caseInsensitive.rawValue)
                )
                """)
            }

            Block(title: "Numeric and date templates") {
                snippet("""
                let numericOps: [NSComparisonPredicate.Operator] = [.lessThan, .equalTo, .greaterThan]
                NSPredicateEditorRowTemplate(
                    leftExpressions: [NSExpression(forKeyPath: "size")],
                    rightExpressionAttributeType: .integer64AttributeType,
                    modifier: .direct,
                    operators: numericOps.map { NSNumber(value: $0.rawValue) },
                    options: 0
                )

                let dateOps: [NSComparisonPredicate.Operator] = [.lessThan, .equalTo, .greaterThan]
                NSPredicateEditorRowTemplate(
                    leftExpressions: [NSExpression(forKeyPath: "dateReceived")],
                    rightExpressionAttributeType: .dateAttributeType,
                    modifier: .direct,
                    operators: dateOps.map { NSNumber(value: $0.rawValue) },
                    options: 0
                )
                """)
            }

            Block(title: "Reading the current predicate") {
                snippet("""
                if let predicate = editor.objectValue as? NSPredicate {
                    let filtered = items.filter { predicate.evaluate(with: $0) }
                }

                // Or via NSRuleEditor.predicate (returns the same value)
                let p = editor.predicate
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Editable / canRemoveAllRows") {
                snippet("""
                editor.isEditable = true
                editor.canRemoveAllRows = false   // keep at least one row visible
                editor.nestingMode = .compound    // .single / .list / .compound / .simple
                editor.rowHeight = 24
                """)
            }

            Block(title: "Programmatic row management (inherited from NSRuleEditor)") {
                snippet("""
                editor.addRow(nil)
                editor.insertRow(at: 1, with: .compound, asSubrowOfRow: 0, animate: true)
                editor.removeRow(at: 0)
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSRuleEditor. Unlike NSRuleEditor, NSPredicateEditor does NOT call its delegate's populating methods — rows are populated from rowTemplates and objectValue.")
            noteRow("info.circle", "Each NSPredicateEditorRowTemplate maps a slice of the rule UI back to predicate clauses. Provide one template per attribute family.")
            noteRow("hand.point.up", "Wrap the editor in an NSScrollView so the row list scrolls when the user adds many rows.")
            noteRow("paperplane", "Used by Mail's smart-mailbox builder, Finder smart folders, and the Photos search panel.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSPredicateEditorPage().frame(width: 1100, height: 900)
}
