import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSSearchField (class, inherits NSTextField) — a text field with
// a magnifying-glass affordance, a cancel button, and a recent-searches
// pop-up menu.
// Source: Documentation/AppKit/views-and-controls/nssearchfield.md
//
// Renderable demo: an NSViewRepresentable hosts an NSSearchField with a
// placeholder and a recents menu template. SwiftUI controls drive
// sendsSearchStringImmediately, sendsWholeSearchString, and
// recentsAutosaveName so the configurable surface area is visibly
// exercised.

// MARK: - Bridge

private struct NSSearchFieldDemo: NSViewRepresentable {
    var placeholder: String
    var sendsImmediately: Bool
    var sendsWhole: Bool
    var enableRecents: Bool

    func makeNSView(context: Context) -> NSSearchField {
        let field = NSSearchField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.maximumRecents = 10
        return field
    }

    func updateNSView(_ nsView: NSSearchField, context: Context) {
        nsView.placeholderString = placeholder
        nsView.sendsSearchStringImmediately = sendsImmediately
        nsView.sendsWholeSearchString = sendsWhole
        if enableRecents {
            nsView.recentsAutosaveName = "SwiftKit.NSSearchFieldGallery.Demo"
            nsView.searchMenuTemplate = Self.makeMenu()
        } else {
            nsView.recentsAutosaveName = nil
            nsView.searchMenuTemplate = nil
        }
    }

    private static func makeMenu() -> NSMenu {
        let menu = NSMenu(title: "Recents")
        let title = NSMenuItem(title: "Recent Searches", action: nil, keyEquivalent: "")
        title.tag = NSSearchField.recentsTitleMenuItemTag
        menu.addItem(title)
        let recents = NSMenuItem(title: "Recents", action: nil, keyEquivalent: "")
        recents.tag = NSSearchField.recentsMenuItemTag
        menu.addItem(recents)
        let separator = NSMenuItem.separator()
        menu.addItem(separator)
        let clear = NSMenuItem(title: "Clear Recents", action: nil, keyEquivalent: "")
        clear.tag = NSSearchField.clearRecentsMenuItemTag
        menu.addItem(clear)
        let none = NSMenuItem(title: "No Recent Searches", action: nil, keyEquivalent: "")
        none.tag = NSSearchField.noRecentsMenuItemTag
        menu.addItem(none)
        return menu
    }
}

// MARK: - Page

struct NSSearchFieldPage: View {
    @State private var sendsImmediately: Bool = true
    @State private var sendsWhole: Bool = false
    @State private var enableRecents: Bool = true

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
            Text("NSSearchField")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A text field optimized for performing text-based searches.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSTextField \u{00b7} Documentation/AppKit/views-and-controls/nssearchfield.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSSearchField with placeholder + recents menu") {
            VStack(alignment: .leading, spacing: 12) {
                NSSearchFieldDemo(
                    placeholder: "Search files, folders, and tags",
                    sendsImmediately: sendsImmediately,
                    sendsWhole: sendsWhole,
                    enableRecents: enableRecents
                )
                .frame(height: 26)
                .frame(maxWidth: 360)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Toggle("sendsSearchStringImmediately", isOn: $sendsImmediately).controlSize(.small)
                Toggle("sendsWholeSearchString (commit-only)", isOn: $sendsWhole).controlSize(.small)
                Toggle("recentsAutosaveName + searchMenuTemplate", isOn: $enableRecents).controlSize(.small)

                APICallout("let f = NSSearchField(); f.placeholderString = \"Search…\"")
                APICallout("f.recentsAutosaveName = \"MyApp.SearchHistory\"")
                APICallout("f.searchMenuTemplate = recentsMenu")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Search modes") {
                snippet("""
                f.sendsSearchStringImmediately = true   // action fires per keystroke
                f.sendsWholeSearchString = false        // false = also fire on pause
                                                        // true  = only fire on commit
                """)
                Text("Combinations: sendsImmediately=true sendsWhole=false → live as-you-type. sendsImmediately=false sendsWhole=false → fire after typing pause. sendsImmediately=*, sendsWhole=true → only Return / focus-loss.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Recent searches menu") {
                snippet("""
                f.maximumRecents = 10
                f.recentsAutosaveName = "MyApp.MainWindow.Search"
                f.searchMenuTemplate = makeMenu()        // tags below identify slots

                // Tags AppKit recognizes:
                NSSearchField.recentsTitleMenuItemTag    // header for the recents block
                NSSearchField.recentsMenuItemTag         // placeholder where AppKit injects items
                NSSearchField.clearRecentsMenuItemTag    // "Clear" command
                NSSearchField.noRecentsMenuItemTag       // shown when history is empty
                """)
            }

            Block(title: "Geometry") {
                snippet("""
                let cancelRect = f.cancelButtonBounds
                let glassRect  = f.searchButtonBounds
                let textRect   = f.searchTextBounds
                """)
                Text("Use these only to align overlays — they're read-only and reflect the current control size.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Receiving search events") {
                snippet("""
                final class Search: NSObject, NSSearchFieldDelegate {
                    func controlTextDidChange(_ obj: Notification) {
                        guard let field = obj.object as? NSSearchField else { return }
                        runQuery(field.stringValue)
                    }
                }
                f.delegate = Search()
                """)
                Text("NSSearchFieldDelegate inherits NSTextFieldDelegate / NSControlTextEditingDelegate; you usually want controlTextDidChange or the action selector on a target rather than a search-specific method.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSTextField. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("magnifyingglass", "The magnifying-glass and cancel buttons are drawn by NSSearchFieldCell automatically — don't try to recreate them.")
            noteRow("clock.arrow.circlepath", "Recent searches persist via NSUserDefaults using recentsAutosaveName as the key. Setting the property to nil disables persistence.")
            noteRow("link", "See Also: NSSearchFieldCell, NSSearchToolbarItem (toolbar-friendly variant), NSTextFinder (find bar inside text views).")
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
    NSSearchFieldPage().frame(width: 1100, height: 900)
}
