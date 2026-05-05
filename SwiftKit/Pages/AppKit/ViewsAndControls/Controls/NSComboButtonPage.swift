import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSComboButton (class, inherits NSControl, macOS 13+) — a
// button that pairs a default action with a pull-down menu of
// alternative actions. Two styles: .split (action + menu chevron in
// separate hit zones) and .unified (single button; long-press shows
// the menu).
// Source: Documentation/AppKit/views-and-controls/nscombobutton.md
//
// Renderable demo: an NSViewRepresentable hosts an NSComboButton with
// a small menu of alternative actions. SwiftUI controls drive the
// style picker and label.

// MARK: - Bridge

private struct NSComboButtonDemo: NSViewRepresentable {
    var title: String
    var style: NSComboButton.Style

    func makeNSView(context: Context) -> NSComboButton {
        let menu = NSMenu()
        menu.addItem(withTitle: "Save As\u{2026}", action: nil, keyEquivalent: "")
        menu.addItem(withTitle: "Export\u{2026}", action: nil, keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Send to\u{2026}", action: nil, keyEquivalent: "")

        let button = NSComboButton(title: title, menu: menu, target: nil, action: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    func updateNSView(_ nsView: NSComboButton, context: Context) {
        nsView.title = title
        nsView.style = style
    }
}

// MARK: - Page

struct NSComboButtonPage: View {
    @State private var title: String = "Save"
    @State private var style: NSComboButton.Style = .split

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
            Text("NSComboButton")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A button with a pull-down menu and a default action.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} macOS 13.0+ \u{00b7} Documentation/AppKit/views-and-controls/nscombobutton.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSComboButton with menu + style picker") {
            VStack(alignment: .leading, spacing: 12) {
                NSComboButtonDemo(title: title, style: style)
                    .frame(height: 32)
                    .frame(maxWidth: 220)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("title").font(.caption).foregroundStyle(.secondary)
                    TextField("", text: $title).frame(width: 200)
                }

                HStack(spacing: 12) {
                    Text("style").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("split (chevron is its own hit zone)").tag(NSComboButton.Style.split)
                        Text("unified (long-press shows menu)").tag(NSComboButton.Style.unified)
                    }
                    .labelsHidden()
                    .pickerStyle(.radioGroup)
                }

                APICallout("NSComboButton(title: \"Save\", menu: menu, target: nil, action: nil)")
                APICallout("button.style = .split   // .split / .unified")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Initializers") {
                snippet("""
                NSComboButton(title: "Save", menu: menu, target: nil, action: nil)
                NSComboButton(image: img, menu: menu, target: nil, action: nil)
                NSComboButton(title: "Save", image: img, menu: menu, target: nil, action: nil)
                """)
            }

            Block(title: "Style") {
                snippet("""
                button.style = .split        // separate hit zones for the title and the menu chevron
                button.style = .unified      // single button surface; long-press reveals the menu
                """)
            }

            Block(title: "Image and image scaling") {
                snippet("""
                button.image = NSImage(systemSymbolName: "square.and.arrow.up", accessibilityDescription: nil)
                button.imageScaling = .scaleProportionallyDown
                """)
            }

            Block(title: "Alternative actions menu") {
                snippet("""
                let menu = NSMenu()
                menu.addItem(withTitle: "Save As\u{2026}", action: #selector(saveAs(_:)), keyEquivalent: "")
                menu.addItem(withTitle: "Export\u{2026}",  action: #selector(export(_:)), keyEquivalent: "")
                button.menu = menu
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Default action") {
                snippet("""
                button.target = self
                button.action = #selector(save(_:))   // primary tap on title/image runs the default action
                """)
            }

            Block(title: "Disabled") {
                snippet("""
                button.isEnabled = false   // (NSControl) dims the whole control and disables both the action and the menu
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl directly — no NSCell. Available macOS 13.0+.")
            noteRow("hand.point.up", ".split exposes the menu via a discoverable chevron; .unified hides it behind a long-press gesture.")
            noteRow("xmark", "NSComboButton doesn't support a contextual menu — the pull-down menu is its only menu surface.")
            noteRow("info.circle", "For SwiftUI parity, ControlGroup or Menu(content:label:) provide closely-matching behavior on later platforms.")
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
    NSComboButtonPage().frame(width: 1100, height: 900)
}
