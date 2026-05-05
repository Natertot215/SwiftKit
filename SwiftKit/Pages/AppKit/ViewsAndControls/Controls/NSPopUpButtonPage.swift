import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSPopUpButton (class, inherits NSButton) — a button that
// shows a menu of items and remembers a single selection. Two flavors:
// pop-up (selected item shows in the button) and pull-down (button
// shows a fixed title; menu items perform actions).
// Source: Documentation/AppKit/views-and-controls/nspopupbutton.md
//
// Renderable demo: an NSViewRepresentable hosts an NSPopUpButton
// driven by SwiftUI controls — pullsDown toggle, items array,
// selected index binding.

// MARK: - Bridge

private struct NSPopUpButtonDemo: NSViewRepresentable {
    var titles: [String]
    var pullsDown: Bool
    var pullDownTitle: String
    @Binding var selectedIndex: Int

    func makeNSView(context: Context) -> NSPopUpButton {
        let button = NSPopUpButton(frame: .zero, pullsDown: pullsDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.target = context.coordinator
        button.action = #selector(Coordinator.selectionChanged(_:))
        return button
    }

    func updateNSView(_ nsView: NSPopUpButton, context: Context) {
        context.coordinator.parent = self
        if nsView.pullsDown != pullsDown {
            nsView.pullsDown = pullsDown
        }
        nsView.removeAllItems()
        if pullsDown {
            nsView.addItems(withTitles: [pullDownTitle] + titles)
        } else {
            nsView.addItems(withTitles: titles)
            if (0..<titles.count).contains(selectedIndex) {
                nsView.selectItem(at: selectedIndex)
            }
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSPopUpButtonDemo
        init(_ parent: NSPopUpButtonDemo) { self.parent = parent }

        @objc func selectionChanged(_ sender: NSPopUpButton) {
            guard !sender.pullsDown else { return }
            parent.selectedIndex = sender.indexOfSelectedItem
        }
    }
}

// MARK: - Page

struct NSPopUpButtonPage: View {
    @State private var selectedIndex: Int = 1
    @State private var pullsDown: Bool = false

    private let items = ["Small", "Medium", "Large", "Extra Large"]

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
            Text("NSPopUpButton")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control for selecting an item from a list.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSButton \u{00b7} Documentation/AppKit/views-and-controls/nspopupbutton.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSPopUpButton with pullsDown picker + bound selection") {
            VStack(alignment: .leading, spacing: 12) {
                NSPopUpButtonDemo(
                    titles: items,
                    pullsDown: pullsDown,
                    pullDownTitle: "Actions",
                    selectedIndex: $selectedIndex
                )
                .frame(height: 28)
                .frame(maxWidth: 220)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("pullsDown").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $pullsDown) {
                        Text("false (pop-up — shows selection)").tag(false)
                        Text("true (pull-down — fixed title)").tag(true)
                    }
                    .labelsHidden()
                    .pickerStyle(.radioGroup)
                }

                if !pullsDown {
                    HStack(spacing: 12) {
                        Text("selectedIndex").font(.caption).foregroundStyle(.secondary)
                        Stepper(value: $selectedIndex, in: 0...(items.count - 1)) {
                            Text("\(selectedIndex) — \(items[selectedIndex])").font(.caption).fontDesign(.monospaced)
                        }
                        .frame(width: 280)
                    }
                }

                APICallout("let button = NSPopUpButton(frame: .zero, pullsDown: false)")
                APICallout("button.addItems(withTitles: [\"Small\", \"Medium\", \"Large\", \"Extra Large\"])")
                APICallout("button.selectItem(at: 1)")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Initializers") {
                snippet("""
                NSPopUpButton(frame: rect, pullsDown: false)               // pop-up
                NSPopUpButton(frame: rect, pullsDown: true)                // pull-down
                NSPopUpButton(image: img, pullDownMenu: menu)              // image-only pull-down
                NSPopUpButton(popUpMenu: menu, target: self, action: ...)
                NSPopUpButton(title: "Actions", image: img, pullDownMenu: menu)
                """)
            }

            Block(title: "Adding and removing items") {
                snippet("""
                button.addItem(withTitle: "Small")
                button.addItems(withTitles: ["Medium", "Large"])
                button.insertItem(withTitle: "Tiny", at: 0)
                button.removeItem(withTitle: "Tiny")
                button.removeItem(at: 0)
                button.removeAllItems()
                """)
            }

            Block(title: "Selecting items") {
                snippet("""
                button.selectItem(at: 1)
                button.selectItem(withTitle: "Medium")
                button.selectItem(withTag: 42)
                button.select(menuItem)            // select(_:) — pass an NSMenuItem
                """)
            }

            Block(title: "Reading the selection") {
                snippet("""
                let item = button.selectedItem            // NSMenuItem? (pop-up only)
                let title = button.titleOfSelectedItem    // String?
                let i = button.indexOfSelectedItem
                """)
            }

            Block(title: "Pull-down vs pop-up") {
                snippet("""
                button.pullsDown = true               // act as a fixed-title menu
                button.altersStateOfSelectedItem      // toggle the .on/.off state of the chosen item
                button.usesItemFromMenu               // use a clone of the menu item as the title content
                button.preferredEdge = .maxY          // pop-up direction in restricted situations
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Auto-enable items") {
                snippet("""
                button.autoenablesItems = true        // items respond to NSMenuValidation by default
                """)
            }

            Block(title: "Disabled") {
                snippet("""
                button.isEnabled = false              // (NSControl) prevents opening the menu
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSButton. The image of the button is taken from the selected menu item (pop-up) or first item (pull-down) — setting the cell's image directly has no effect.")
            noteRow("info.circle", "Pull-down mode shows a fixed first item that doesn't act as a selection — typically a verb like \u{201C}Actions.\u{201D} The remaining items perform actions.")
            noteRow("hand.point.up", "Programmatic mutations during menu tracking are not reflected — wait until willPopUpNotification fires.")
            noteRow("rectangle.split.3x1", "For a SwiftUI parity surface, see Picker(selection:label:content:).")
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
    NSPopUpButtonPage().frame(width: 1100, height: 900)
}
