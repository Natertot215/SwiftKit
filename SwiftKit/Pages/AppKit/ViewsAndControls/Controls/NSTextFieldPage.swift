import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSTextField (class, inherits NSControl) — the canonical text /
// label / single-line input surface in AppKit.
// Source: Documentation/AppKit/views-and-controls/nstextfield.md
//
// Renderable demo: an NSViewRepresentable hosts an NSTextField bound to
// SwiftUI @State. Pickers drive bezelStyle, isBezeled, isBordered, and
// isEditable so the rendering responses are visibly exercised.

// MARK: - Bridge

private struct NSTextFieldDemo: NSViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var isBezeled: Bool
    var isBordered: Bool
    var isEditable: Bool
    var bezelStyle: NSTextField.BezelStyle
    var drawsBackground: Bool

    func makeNSView(context: Context) -> NSTextField {
        let field = NSTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.target = context.coordinator
        field.action = #selector(Coordinator.changed(_:))
        field.delegate = context.coordinator
        return field
    }

    func updateNSView(_ nsView: NSTextField, context: Context) {
        context.coordinator.parent = self
        nsView.placeholderString = placeholder
        nsView.isBezeled = isBezeled
        nsView.isBordered = isBordered
        nsView.isEditable = isEditable
        nsView.bezelStyle = bezelStyle
        nsView.drawsBackground = drawsBackground
        if nsView.stringValue != text { nsView.stringValue = text }
    }

    func makeCoordinator() -> Coordinator { Coordinator(parent: self) }

    final class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: NSTextFieldDemo
        init(parent: NSTextFieldDemo) { self.parent = parent }
        @objc func changed(_ sender: NSTextField) { parent.text = sender.stringValue }
        func controlTextDidChange(_ obj: Notification) {
            guard let f = obj.object as? NSTextField else { return }
            parent.text = f.stringValue
        }
    }
}

// MARK: - Page

struct NSTextFieldPage: View {
    @State private var text = "Hello, AppKit"
    @State private var isBezeled = true
    @State private var isBordered = false
    @State private var isEditable = true
    @State private var bezelStyle: NSTextField.BezelStyle = .roundedBezel
    @State private var drawsBackground = true

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
            Text("NSTextField")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Text the user can select or edit to send an action message to a target when the user presses the Return key.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nstextfield.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSTextField bound to SwiftUI @State") {
            VStack(alignment: .leading, spacing: 12) {
                NSTextFieldDemo(
                    text: $text,
                    placeholder: "Type here…",
                    isBezeled: isBezeled,
                    isBordered: isBordered,
                    isEditable: isEditable,
                    bezelStyle: bezelStyle,
                    drawsBackground: drawsBackground
                )
                .frame(height: 24)
                .frame(maxWidth: 360)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("bezelStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $bezelStyle) {
                        Text("roundedBezel").tag(NSTextField.BezelStyle.roundedBezel)
                        Text("squareBezel").tag(NSTextField.BezelStyle.squareBezel)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 280)
                }
                Toggle("isBezeled", isOn: $isBezeled).controlSize(.small)
                Toggle("isBordered", isOn: $isBordered).controlSize(.small)
                Toggle("isEditable", isOn: $isEditable).controlSize(.small)
                Toggle("drawsBackground", isOn: $drawsBackground).controlSize(.small)

                Text("Bound value: \"\(text)\"").font(.caption).foregroundStyle(.secondary)

                APICallout("let f = NSTextField(string: \"Hello\")")
                APICallout("f.bezelStyle = .roundedBezel; f.isBezeled = true")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Convenience initializers") {
                snippet("""
                NSTextField(string: "Editable")                       // editable text field
                NSTextField(labelWithString: "Static")                // non-editable label
                NSTextField(wrappingLabelWithString: "Long…")         // wrapping label
                NSTextField(labelWithAttributedString: attributed)    // rich-text label
                """)
                Text("Label initializers configure isBezeled = false, isEditable = false, drawsBackground = false. The plain init(string:) leaves the field editable with a bezel.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Bezel + border") {
                snippet("""
                f.isBezeled = true
                f.bezelStyle = .roundedBezel       // .squareBezel, .roundedBezel
                f.isBordered = false               // line border (no bezel)
                f.drawsBackground = true
                f.backgroundColor = .controlBackgroundColor
                f.textColor = .labelColor
                """)
            }

            Block(title: "Editing") {
                snippet("""
                f.isSelectable = true
                f.isEditable = true
                f.allowsEditingTextAttributes = false
                f.importsGraphics = false
                """)
            }

            Block(title: "Placeholder") {
                snippet("""
                f.placeholderString = "Enter your name"
                f.placeholderAttributedString = NSAttributedString(string: "Enter…",
                    attributes: [.foregroundColor: NSColor.secondaryLabelColor])
                """)
            }

            Block(title: "Line wrapping + truncation") {
                snippet("""
                f.lineBreakStrategy = .standard
                f.allowsDefaultTighteningForTruncation = true
                f.maximumNumberOfLines = 3
                f.preferredMaxLayoutWidth = 320     // for Auto Layout intrinsic sizing
                """)
            }

            Block(title: "Text completion (suggestions)") {
                snippet("""
                f.isAutomaticTextCompletionEnabled = true
                f.suggestionsDelegate = mySuggestionsDelegate   // NSTextSuggestionsDelegate
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Field-editor delegate methods") {
                snippet("""
                class Delegate: NSObject, NSTextFieldDelegate {
                    func controlTextDidChange(_ obj: Notification) { /* live */ }
                    func controlTextDidEndEditing(_ obj: Notification) { /* commit */ }
                    func control(_ control: NSControl,
                                 isValidObject obj: Any?) -> Bool { /* validate */ true }
                }
                f.delegate = Delegate()
                """)
                Text("NSTextFieldDelegate inherits NSControlTextEditingDelegate — most live-edit hooks come from the parent protocol.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Action / target") {
                snippet("""
                f.target = self
                f.action = #selector(commit(_:))   // fires on Return / focus loss

                @objc func commit(_ sender: NSTextField) {
                    print("commit:", sender.stringValue)
                }
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("character.book.closed", "Inherited by NSComboBox, NSSearchField, NSSecureTextField, NSTokenField. Same delegation surface.")
            noteRow("text.cursor", "stringValue / objectValue / attributedStringValue all live on NSControl. Use whichever matches the bound model type.")
            noteRow("link", "See Also: NSTextFieldDelegate, NSTextFieldCell, NSTextView (multi-line rich text), NSText (abstract base).")
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
    NSTextFieldPage().frame(width: 1100, height: 900)
}
