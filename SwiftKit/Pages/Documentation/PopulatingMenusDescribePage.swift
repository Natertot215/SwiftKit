import SwiftUI

struct PopulatingMenusDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Populating SwiftUI Menus with Adaptive Controls",
            docPath: "Documentation/SwiftUI/menus-and-commands/populating-swiftui-menus-with-adaptive-controls.md",
            availability: "macOS 14.0+",
            blurb: """
            Improve your app by populating menus with controls and organizing your content intuitively.

            ## Overview

            Menus are versatile components you can populate adaptively and use to organize commands, actions, or items in your app. In tight layouts or smaller devices, menus optimize space by displaying options on demand. You have options for configuring your menus, with various controls like Button, Toggle, Slider, Divider, and more.

            A menu consists of three components:
            - Label: A view that describes the purpose of the menu.
            - Content: A closure that uses a ViewBuilder to define the items inside the menu.
            - Primary action: An optional closure that performs an action when someone clicks or taps the menu, instead of the default primary action of opening the menu.

            ## Populate Your Menus

            To render a menu item that performs an action, use Button:

            ```swift
            Menu("Actions") {
                Button("Duplicate") { /* action */ }
                Button("Rename") { /* action */ }
                Button("Delete...") { /* action */ }
            }
            ```

            To show a symbol next to the menu item title, use Button/init(_:systemImage:action:):

            ```swift
            Menu("Actions") {
                Button("Duplicate", systemImage: "doc.on.doc") { /* action */ }
                Button("Rename", systemImage: "pencil") { /* action */ }
                Button("Delete...", systemImage: "trash") { /* action */ }
            }
            ```

            Add a title and subtitle to a menu item by populating the label closure with two Text views — the first represents the title, the second the subtitle.

            Add a visual warning cue to destructive items using ButtonRole.destructive to tint the item red.

            On macOS, menu items constructed with a Label render without an icon by default. Use labelStyle(.titleAndIcon) to override this.

            ## Toggled Items

            A Toggle in a menu automatically appears with a checkmark indicating its on or off state:

            ```swift
            Menu("Actions") {
                Toggle("Favorite", systemImage: "suit.heart", isOn: $isFavorite)
            }
            ```

            ## Picker in Menus

            Use a Picker within a menu to let people choose from a list of options. The selected item is identified with a checkmark:

            ```swift
            Picker("Flavor", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized).tag(flavor)
                }
            }
            ```

            ## Apply Style to Menu Pickers

            By default, picker options in menus appear inline (PickerStyle.inline). Apply the menu style to transform a picker into a submenu. Apply palette style for compact symbol-based selection with a horizontal scroll when space is limited.

            ## Group Menu Items

            Submenus group items hierarchically using nested Menu views. The Section view groups items while keeping all elements visible, often with section headers for clarity. Divider provides a simple visual break between groups.

            ## Display Compact Menu Items

            Use a ControlGroup to display a few related actions in a single row within a menu — a compact, horizontally-grouped layout of up to four items.

            ## Modify Content Behavior

            Use menuOrder(.fixed) to keep items in the order you define rather than reordering by proximity (iOS/iPadOS default). Use menuActionDismissBehavior(.disabled) on specific items to prevent the menu from closing after each tap — useful for actions like incrementing a value repeatedly.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/menus-and-commands/populating-swiftui-menus-with-adaptive-controls.md",
                "Related APIs: Menu, menuStyle(_:), menuOrder(_:), menuActionDismissBehavior(_:)."
            ]
        )
    }
}

#Preview {
    PopulatingMenusDescribePage()
        .frame(width: 900, height: 900)
}
