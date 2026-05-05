import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSComboBox (class, inherits NSTextField) — a view that combines
// an editable text field with a pop-up list of suggested values.
// Source: Documentation/AppKit/views-and-controls/nscombobox.md
//
// Renderable demo: an NSViewRepresentable hosts an NSComboBox seeded with a
// static list of fruit names. SwiftUI controls drive numberOfVisibleItems,
// hasVerticalScroller, isButtonBordered, and completes so the configurable
// surface area is visibly exercised.

// MARK: - Bridge

private struct NSComboBoxDemo: NSViewRepresentable {
    var items: [String]
    var numberOfVisibleItems: Int
    var hasVerticalScroller: Bool
    var isButtonBordered: Bool
    var completes: Bool

    func makeNSView(context: Context) -> NSComboBox {
        let combo = NSComboBox()
        combo.translatesAutoresizingMaskIntoConstraints = false
        combo.usesDataSource = false
        combo.placeholderString = "Pick or type a fruit"
        combo.removeAllItems()
        combo.addItems(withObjectValues: items)
        return combo
    }

    func updateNSView(_ nsView: NSComboBox, context: Context) {
        nsView.numberOfVisibleItems = numberOfVisibleItems
        nsView.hasVerticalScroller = hasVerticalScroller
        nsView.isButtonBordered = isButtonBordered
        nsView.completes = completes
    }
}

// MARK: - Page

struct NSComboBoxPage: View {
    @State private var numberOfVisibleItems: Double = 5
    @State private var hasVerticalScroller: Bool = true
    @State private var isButtonBordered: Bool = true
    @State private var completes: Bool = true

    private let items = ["Apple", "Apricot", "Banana", "Blueberry", "Cherry", "Grape", "Lemon", "Mango", "Orange", "Pear"]

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
            Text("NSComboBox")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that displays a list of values in a pop-up menu where the user selects a value or types in a custom value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSTextField \u{00b7} Documentation/AppKit/views-and-controls/nscombobox.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "init() + addItems(withObjectValues:) — fruit list") {
            VStack(alignment: .leading, spacing: 12) {
                NSComboBoxDemo(
                    items: items,
                    numberOfVisibleItems: Int(numberOfVisibleItems),
                    hasVerticalScroller: hasVerticalScroller,
                    isButtonBordered: isButtonBordered,
                    completes: completes
                )
                .frame(height: 28)
                .frame(maxWidth: 360)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("numberOfVisibleItems").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $numberOfVisibleItems, in: 2...10, step: 1)
                        .frame(width: 160)
                    Text("\(Int(numberOfVisibleItems))")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                Toggle("hasVerticalScroller", isOn: $hasVerticalScroller).controlSize(.small)
                Toggle("isButtonBordered", isOn: $isButtonBordered).controlSize(.small)
                Toggle("completes — autocomplete from items", isOn: $completes).controlSize(.small)

                APICallout("let combo = NSComboBox(); combo.addItems(withObjectValues: items)")
                APICallout("combo.numberOfVisibleItems = 5; combo.completes = true")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Display attributes") {
                snippet("""
                combo.hasVerticalScroller = true       // show scroller when items overflow
                combo.intercellSpacing = NSSize(width: 3, height: 2)
                combo.isButtonBordered = true          // draw the down-arrow's bezel
                combo.itemHeight = 22                  // pop-up row height in points
                combo.numberOfVisibleItems = 5
                """)
            }

            Block(title: "Two ways to supply items") {
                snippet("""
                // 1) Internal list (usesDataSource = false)
                combo.removeAllItems()
                combo.addItems(withObjectValues: ["Apple", "Banana", "Cherry"])
                combo.insertItem(withObjectValue: "Apricot", at: 1)
                combo.removeItem(at: 0)

                // 2) External data source (usesDataSource = true)
                combo.usesDataSource = true
                combo.dataSource = myDataSourceObject
                """)
                Text("With usesDataSource = true the internal list APIs throw — implement the four NSComboBoxDataSource methods instead.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Selection") {
                snippet("""
                combo.selectItem(at: 2)
                combo.selectItem(withObjectValue: "Mango")
                combo.deselectItem(at: 2)
                let i = combo.indexOfSelectedItem
                let v = combo.objectValueOfSelectedItem
                """)
            }

            Block(title: "Completion") {
                snippet("""
                combo.completes = true            // autocomplete typed prefix against items
                """)
                Text("Override comboBox(_:completedString:) on NSComboBoxDataSource to control matching when usesDataSource = true.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Notifications") {
                snippet("""
                NSComboBox.selectionDidChangeNotification
                NSComboBox.selectionIsChangingNotification
                NSComboBox.willPopUpNotification
                NSComboBox.willDismissNotification
                """)
                Text("Subscribe via NotificationCenter or implement NSComboBoxDelegate's comboBoxSelectionDidChange / comboBoxWillPopUp / comboBoxWillDismiss.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Reload + scroll") {
                snippet("""
                combo.noteNumberOfItemsChanged()
                combo.reloadData()
                combo.scrollItemAtIndex(toTop: 0)
                combo.scrollItemAtIndex(toVisible: 8)
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSTextField. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("rectangle.connected.to.line.below", "NSComboBox uses NSComboBoxCell internally; almost every property mirrors a cell-level equivalent.")
            noteRow("text.cursor", "completes = true gives type-ahead matching against the internal list. For data-source mode, implement comboBox(_:completedString:).")
            noteRow("link", "See Also: NSComboBoxDataSource, NSComboBoxDelegate, NSComboBoxCell.")
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
    NSComboBoxPage().frame(width: 1100, height: 900)
}
