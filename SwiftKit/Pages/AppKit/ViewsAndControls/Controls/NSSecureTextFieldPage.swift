import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSSecureTextField (class, inherits NSTextField) — same shape as
// NSTextField but renders bullets in place of typed characters and disables
// cut/copy on the field editor.
// Source: Documentation/AppKit/views-and-controls/nssecuretextfield.md
//
// Renderable demo: an NSViewRepresentable hosts an NSSecureTextField
// bound to SwiftUI @State. echosBullets on the underlying NSSecureTextFieldCell
// drives whether bullets appear as the user types or the field stays empty.

// MARK: - Bridge

private struct NSSecureTextFieldDemo: NSViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var echosBullets: Bool

    func makeNSView(context: Context) -> NSSecureTextField {
        let field = NSSecureTextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.target = context.coordinator
        field.action = #selector(Coordinator.commit(_:))
        field.delegate = context.coordinator
        return field
    }

    func updateNSView(_ nsView: NSSecureTextField, context: Context) {
        context.coordinator.parent = self
        nsView.placeholderString = placeholder
        if let cell = nsView.cell as? NSSecureTextFieldCell {
            cell.echosBullets = echosBullets
        }
        if nsView.stringValue != text { nsView.stringValue = text }
    }

    func makeCoordinator() -> Coordinator { Coordinator(parent: self) }

    final class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: NSSecureTextFieldDemo
        init(parent: NSSecureTextFieldDemo) { self.parent = parent }
        @objc func commit(_ sender: NSSecureTextField) { parent.text = sender.stringValue }
        func controlTextDidChange(_ obj: Notification) {
            guard let f = obj.object as? NSSecureTextField else { return }
            parent.text = f.stringValue
        }
    }
}

// MARK: - Page

struct NSSecureTextFieldPage: View {
    @State private var password: String = ""
    @State private var echosBullets: Bool = true

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
            Text("NSSecureTextField")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A text field that hides the typed text.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSTextField \u{00b7} Documentation/AppKit/views-and-controls/nssecuretextfield.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSSecureTextField with echosBullets toggle") {
            VStack(alignment: .leading, spacing: 12) {
                NSSecureTextFieldDemo(
                    text: $password,
                    placeholder: "Password",
                    echosBullets: echosBullets
                )
                .frame(height: 24)
                .frame(maxWidth: 320)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Toggle("echosBullets — render \u{2022} per character", isOn: $echosBullets).controlSize(.small)
                Text("Bound length: \(password.count)").font(.caption).foregroundStyle(.secondary)

                APICallout("let f = NSSecureTextField(); f.placeholderString = \"Password\"")
                APICallout("(f.cell as? NSSecureTextFieldCell)?.echosBullets = true")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Same surface as NSTextField") {
                snippet("""
                let f = NSSecureTextField(string: "")
                f.placeholderString = "Password"
                f.bezelStyle = .roundedBezel
                f.isBezeled = true
                f.isBordered = false
                f.target = self
                f.action = #selector(submit(_:))
                """)
                Text("NSSecureTextField inherits NSTextField, so every appearance / editing / delegation API documented on NSTextField applies — bezelStyle, isBezeled, target/action, NSTextFieldDelegate, etc.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Bullet echo (NSSecureTextFieldCell)") {
                snippet("""
                if let cell = f.cell as? NSSecureTextFieldCell {
                    cell.echosBullets = true   // false = leave field visually empty
                }
                """)
                Text("echosBullets = false leaves the rendered field blank as the user types — only the cursor advances. Some institutional UI prefers this for shoulder-surf protection.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Receiving the value") {
                snippet("""
                @objc func submit(_ sender: NSSecureTextField) {
                    let secret = sender.stringValue
                    // hand off to Keychain or auth API; never log
                }
                """)
                Text("The cell overrides the field editor to disable cut and copy — the user can't extract the secret via the menu. paste still works.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSTextField. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("lock.shield", "Cell uses its own field editor that won't display text or allow cut / copy. paste still works.")
            noteRow("circle.fill", "echosBullets controls visual feedback. Default is true; set to false for stricter shoulder-surf protection.")
            noteRow("link", "See Also: NSSecureTextFieldCell (cell), NSTextField (parent), Keychain Services for actually storing secrets.")
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
    NSSecureTextFieldPage().frame(width: 1100, height: 900)
}
