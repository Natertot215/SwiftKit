import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSTokenField (class, inherits NSTextField) — a text field that
// converts text into visually distinct rounded "token" pills.
// Source: Documentation/AppKit/views-and-controls/nstokenfield.md
//
// Renderable demo: an NSViewRepresentable hosts an NSTokenField seeded
// with three string tokens. SwiftUI controls drive tokenStyle and the
// tokenizing character set so the rendering responses are visibly
// exercised.

// MARK: - Bridge

private struct NSTokenFieldDemo: NSViewRepresentable {
    @Binding var tokens: [String]
    var style: NSTokenField.TokenStyle
    var splitOnSpace: Bool

    func makeNSView(context: Context) -> NSTokenField {
        let field = NSTokenField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.target = context.coordinator
        field.action = #selector(Coordinator.commit(_:))
        field.delegate = context.coordinator
        return field
    }

    func updateNSView(_ nsView: NSTokenField, context: Context) {
        context.coordinator.parent = self
        nsView.tokenStyle = style
        var separators = NSTokenField.defaultTokenizingCharacterSet
        if splitOnSpace {
            separators.insert(charactersIn: " ")
        }
        nsView.tokenizingCharacterSet = separators
        nsView.objectValue = tokens
    }

    func makeCoordinator() -> Coordinator { Coordinator(parent: self) }

    final class Coordinator: NSObject, NSTokenFieldDelegate {
        var parent: NSTokenFieldDemo
        init(parent: NSTokenFieldDemo) { self.parent = parent }

        @objc func commit(_ sender: NSTokenField) {
            parent.tokens = (sender.objectValue as? [String]) ?? []
        }

        func controlTextDidEndEditing(_ obj: Notification) {
            guard let f = obj.object as? NSTokenField else { return }
            parent.tokens = (f.objectValue as? [String]) ?? []
        }
    }
}

// MARK: - Page

struct NSTokenFieldPage: View {
    @State private var tokens: [String] = ["alice@swift.org", "bob@swift.org", "carol@swift.org"]
    @State private var style: NSTokenField.TokenStyle = .rounded
    @State private var splitOnSpace: Bool = false

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
            Text("NSTokenField")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A text field that converts text into visually distinct tokens.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSTextField \u{00b7} Documentation/AppKit/views-and-controls/nstokenfield.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSTokenField seeded with three string tokens") {
            VStack(alignment: .leading, spacing: 12) {
                NSTokenFieldDemo(
                    tokens: $tokens,
                    style: style,
                    splitOnSpace: splitOnSpace
                )
                .frame(minHeight: 26)
                .frame(maxWidth: 460)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("tokenStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("rounded").tag(NSTokenField.TokenStyle.rounded)
                        Text("plainSquared").tag(NSTokenField.TokenStyle.plainSquared)
                        Text("default").tag(NSTokenField.TokenStyle.default)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 360)
                }

                Toggle("Tokenize on space (in addition to comma + newline)", isOn: $splitOnSpace).controlSize(.small)
                Text("Bound tokens: \(tokens.joined(separator: " \u{2022} "))").font(.caption).foregroundStyle(.secondary)

                APICallout("let f = NSTokenField(); f.objectValue = [\"a\", \"b\", \"c\"]")
                APICallout("f.tokenStyle = .rounded")
                APICallout("f.tokenizingCharacterSet = NSTokenField.defaultTokenizingCharacterSet")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "NSTokenField.TokenStyle") {
                snippet("""
                .default          // platform default; usually .rounded
                .rounded          // Mail.app pill style
                .plainSquared     // no rounding, label-only
                """)
            }

            Block(title: "Tokenizing character set") {
                snippet("""
                f.tokenizingCharacterSet = NSTokenField.defaultTokenizingCharacterSet
                // Default: comma + newline. Add space to split on whitespace:
                var s = NSTokenField.defaultTokenizingCharacterSet
                s.insert(charactersIn: " ")
                f.tokenizingCharacterSet = s
                """)
            }

            Block(title: "Completion delay") {
                snippet("""
                f.completionDelay = 0.25
                NSTokenField.defaultCompletionDelay   // platform default
                """)
                Text("Pair with tokenField(_:completionsForSubstring:indexOfToken:indexOfSelectedItem:) on the delegate to drive autocomplete suggestions for the current token.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Display + edit translation (delegate)") {
                snippet("""
                func tokenField(_ tokenField: NSTokenField,
                                displayStringForRepresentedObject obj: Any) -> String? {
                    (obj as? Person)?.fullName
                }
                func tokenField(_ tokenField: NSTokenField,
                                editingStringForRepresentedObject obj: Any) -> String? {
                    (obj as? Person)?.email
                }
                func tokenField(_ tokenField: NSTokenField,
                                representedObjectForEditing editingString: String) -> Any? {
                    Person(email: editingString)
                }
                """)
                Text("Display string is what the token shows in the pill. Editing string is what the user sees when they double-click to re-edit the token. Represented object is what your model stores.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Pasteboard + drag-and-drop") {
                snippet("""
                func tokenField(_ tokenField: NSTokenField,
                                writeRepresentedObjects objects: [Any],
                                to pboard: NSPasteboard) -> Bool {
                    pboard.declareTypes([.string], owner: nil)
                    pboard.setString(objects.compactMap { ($0 as? Person)?.email }
                                              .joined(separator: ", "), forType: .string)
                    return true
                }
                func tokenField(_ tokenField: NSTokenField,
                                readFrom pboard: NSPasteboard) -> [Any]? {
                    pboard.string(forType: .string)?
                          .components(separatedBy: CharacterSet(charactersIn: ", "))
                          .filter { !$0.isEmpty }
                }
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Per-token style") {
                snippet("""
                func tokenField(_ tokenField: NSTokenField,
                                styleForRepresentedObject obj: Any) -> NSTokenField.TokenStyle {
                    (obj as? Person)?.isInvalid == true ? .plainSquared : .rounded
                }
                """)
                Text("Returning a per-token style overrides the field-level tokenStyle for that one represented object.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Token menus") {
                snippet("""
                func tokenField(_ tokenField: NSTokenField,
                                hasMenuForRepresentedObject obj: Any) -> Bool { true }
                func tokenField(_ tokenField: NSTokenField,
                                menuForRepresentedObject obj: Any) -> NSMenu? {
                    let menu = NSMenu()
                    menu.addItem(withTitle: "Edit Contact…", action: #selector(edit(_:)), keyEquivalent: "")
                    return menu
                }
                """)
                Text("Returning a menu lets the token expose its own context menu — typically used for \"Edit\", \"Remove\", \"Show in Contacts\", etc.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSTextField. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("circle.grid.3x3", "objectValue is an array. With no delegate, AppKit treats each entry as a string. With a delegate, entries can be any model object — the delegate translates to/from display + editing strings.")
            noteRow("text.cursor", "Tokenizing characters split a typed string into tokens. Default set is comma + newline; add space when each whitespace-separated word should be its own token.")
            noteRow("link", "See Also: NSTokenFieldCell, NSTokenFieldDelegate, NSTokenFieldCellDelegate, NSTextField (parent).")
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

extension NSTokenFieldPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsTokenField",
        title: "NSTokenField",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSTokenField",
            "NSTokenFieldCell",
            "NSTokenFieldDelegate",
            "NSTokenFieldCellDelegate"
        ],
        blurb: "A text field that converts text into visually distinct tokens. Inherits NSTextField and uses a tokenizing character set plus an optional delegate to translate represented objects into display and editing strings.",
        signature: "class NSTokenField : NSTextField",
        availability: "macOS 10.4+",
        docPath: "Documentation/AppKit/views-and-controls/nstokenfield.md",
        page: { AnyView(NSTokenFieldPage()) }
    )
}

#Preview {
    NSTokenFieldPage().frame(width: 1100, height: 900)
}
