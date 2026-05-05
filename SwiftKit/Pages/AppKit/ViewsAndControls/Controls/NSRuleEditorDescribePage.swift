import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSRuleEditor — a delegate-driven control for visually
// composing predicates from a tree of choices. The doc surface
// requires you to implement NSRuleEditorDelegate to supply the
// criterion tree; without that, the control renders empty. The
// concrete renderable subclass is NSPredicateEditor (which has its
// own page with a live demo).
// Source: Documentation/AppKit/views-and-controls/nsruleeditor.md

struct NSRuleEditorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSRuleEditor",
            docPath: "Documentation/AppKit/views-and-controls/nsruleeditor.md",
            availability: "macOS",
            blurb: """
            An interface for configuring a rule-based list of options. Each \
            row is a path down a tree of choices; the tree itself is \
            supplied by the rule editor's delegate via NSRuleEditorDelegate. \
            Rows render as a sequence of pop-up buttons, static text \
            fields, and custom views, terminating in a "+/\u{2212}" cluster \
            for adding/removing rows.

            Pick the right entry point:

              \u{2022} NSRuleEditor — the base class. Implement \
            NSRuleEditorDelegate's ruleEditor(_:numberOfChildrenForCriterion:) \
            and ruleEditor(_:child:forCriterion:) to publish the choice \
            tree. Bind rows to a mutable array containing rowType / \
            subrows / displayValues / criteria properties.
              \u{2022} NSPredicateEditor — concrete subclass that doesn't \
            need a delegate. Configure NSPredicateEditorRowTemplate objects \
            up front and let the control build rows from an NSPredicate. \
            That's the surface to instantiate when you don't need a fully \
            custom criterion tree — see NSPredicateEditor for a live \
            example.

            A free-standing NSRuleEditor with no delegate renders empty \
            (it has no criteria to publish), so this page describes the \
            API instead of demonstrating it.
            """,
            signatures: [
                "class NSRuleEditor : NSControl",
                "var delegate: (any NSRuleEditorDelegate)?",
                "var nestingMode: NSRuleEditor.NestingMode  // .single / .list / .compound / .simple",
                "var canRemoveAllRows: Bool",
                "var rowHeight: CGFloat",
                "var predicate: NSPredicate?",
                "func reloadCriteria()",
                "func addRow(_ sender: Any?)",
                "func insertRow(at: Int, with: NSRuleEditor.RowType, asSubrowOfRow: Int, animate: Bool)"
            ],
            notes: [
                "Delegate-driven. Without an NSRuleEditorDelegate the control has nothing to render.",
                "For a renderable rule UI without writing a delegate, use NSPredicateEditor (the concrete subclass) and supply NSPredicateEditorRowTemplates.",
                "If you subclass and override viewDidMoveToWindow(), you must call super."
            ]
        )
    }
}

#Preview {
    NSRuleEditorDescribePage()
        .frame(width: 900, height: 700)
}
