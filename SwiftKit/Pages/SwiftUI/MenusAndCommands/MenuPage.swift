import SwiftUI

// Dense SwiftUI Menu gallery — consolidates 8 absorbed leaves:
//   Menu                                  (struct Menu)
//   MenuStyle                             (protocol MenuStyle)
//   MenuStyleConfiguration                (struct MenuStyleConfiguration)
//   View/menuStyle(_:)                    (modifier)
//   MenuOrder                             (enum MenuOrder)
//   View/menuOrder(_:)                    (modifier)
//   View/menuIndicator(_:)                (modifier)
//   ToolbarTitleMenu                      (struct ToolbarTitleMenu)
//   View/toolbarTitleMenu(content:)       (modifier)
//
// NOT absorbed: MenuBarExtra, MenuBarExtraStyle (Scene types — excluded by B4 spec).
//
// Source docs:
//   Documentation/SwiftUI/menus-and-commands/menu.md
//   Documentation/SwiftUI/view-styles/menustyle.md
//   Documentation/SwiftUI/view-styles/menustyleconfiguration.md
//   Documentation/SwiftUI/view-styles/menustyle(_:).md
//   Documentation/SwiftUI/menus-and-commands/menuorder.md
//   Documentation/SwiftUI/menus-and-commands/menuorder(_:).md
//   Documentation/SwiftUI/view-configuration/menuindicator(_:).md
//   Documentation/SwiftUI/toolbars/toolbartitlemenu.md
//   Documentation/SwiftUI/toolbars/toolbartitlemenu(content:).md
//
// Mirrors ShapesGalleryPage / TypographyPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. Type references appear above demos per describe-track rule.
// Per L-001 / L-012: semantic tokens only; no hand-mixed colors or literals.

struct MenuPage: View {
    // State for default demo
    @State private var lastAction = "None"
    // State for menuIndicator section
    @State private var indicatorVisibility: Visibility = .automatic

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                defaultMenuSection
                menuVariantsSection
                menuStyleGallerySection
                menuStyleCompositionSection
                menuStyleReferenceSection
                menuOrderSection
                menuIndicatorSection
                toolbarTitleMenuSection
                menuDisabledSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Menu")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control for presenting a menu of actions or selections. Renders as a pull-down button on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/menus-and-commands/  \u{00b7}  macOS 11.0+ (Menu, MenuStyle, menuStyle); macOS 12.0+ (menuIndicator); macOS 13.0+ (ToolbarTitleMenu, menuOrder)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Menu  \u{00b7}  MenuStyle  \u{00b7}  MenuStyleConfiguration  \u{00b7}  View/menuStyle(_:)  \u{00b7}  MenuOrder  \u{00b7}  View/menuOrder(_:)  \u{00b7}  View/menuIndicator(_:)  \u{00b7}  ToolbarTitleMenu  \u{00b7}  View/toolbarTitleMenu(content:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default Menu

    private var defaultMenuSection: some View {
        PageSection("Default Menu", subtitle: "struct Menu \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Menu renders as a pull-down button on macOS. Clicking opens the menu; items are Button views placed in the content closure.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Basic string-label form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 8) {
                        Menu("Actions") {
                            Button("New") { lastAction = "New" }
                            Button("Open") { lastAction = "Open" }
                            Button("Close") { lastAction = "Close" }
                        }
                        Text("Last: \(lastAction)")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                    .menuDemoFrame()
                    APICallout("Menu(\"Actions\") { Button(\"New\") { } }")
                }
            }
        }
    }

    // MARK: Menu variants — label forms

    private var menuVariantsSection: some View {
        PageSection("Menu Variants \u{2014} Label Forms", subtitle: "String label \u{00b7} View-builder label \u{00b7} Submenu \u{00b7} primaryAction \u{00b7} Destructive") {
            VStack(alignment: .leading, spacing: 24) {

                VStack(alignment: .leading, spacing: 8) {
                    Text("String label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu("Edit") {
                        Button("Cut") { lastAction = "Cut" }
                        Button("Copy") { lastAction = "Copy" }
                        Button("Paste") { lastAction = "Paste" }
                    }
                    .menuDemoFrame()
                    APICallout("Menu(\"Edit\") { Button(\u{2026}) }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("View-builder label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu {
                        Button("Bold") { lastAction = "Bold" }
                        Button("Italic") { lastAction = "Italic" }
                        Button("Underline") { lastAction = "Underline" }
                    } label: {
                        Label("Format", systemImage: "textformat")
                    }
                    .menuDemoFrame()
                    APICallout("Menu { \u{2026} } label: { Label(\"Format\", systemImage: \"textformat\") }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Submenu (nested Menu)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu("File") {
                        Button("New") { lastAction = "New" }
                        Button("Open") { lastAction = "Open" }
                        Divider()
                        Menu("Export As") {
                            Button("PDF") { lastAction = "PDF" }
                            Button("PNG") { lastAction = "PNG" }
                            Button("JPEG") { lastAction = "JPEG" }
                        }
                    }
                    .menuDemoFrame()
                    APICallout("Menu(\"File\") { Button(\u{2026}); Menu(\"Export As\") { Button(\u{2026}) } }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("primaryAction \u{2014} click triggers action, long-press opens menu")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu("New", systemImage: "plus") {
                        Button("New Folder") { lastAction = "New Folder" }
                        Button("New File") { lastAction = "New File" }
                    } primaryAction: {
                        lastAction = "Quick New"
                    }
                    .menuDemoFrame()
                    APICallout("Menu(\"New\", systemImage: \"plus\") { \u{2026} } primaryAction: { \u{2026} }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Destructive item + Divider")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu("Document") {
                        Button("Duplicate") { lastAction = "Duplicate" }
                        Button("Rename") { lastAction = "Rename" }
                        Divider()
                        Button("Delete", role: .destructive) { lastAction = "Delete" }
                    }
                    .menuDemoFrame()
                    APICallout("Button(\"Delete\", role: .destructive) { \u{2026} }")
                }
            }
        }
    }

    // MARK: MenuStyle gallery — built-in styles

    private var menuStyleGallerySection: some View {
        PageSection("MenuStyle Gallery \u{2014} Built-in Styles", subtitle: "View/menuStyle(_:)  \u{00b7}  macOS 11.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("func menuStyle<S>(_ style: S) -> some View where S : MenuStyle")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)

                Text("Three built-in MenuStyle values on macOS. The modifier cascades down the view hierarchy to all Menu controls within scope.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                HStack(alignment: .top, spacing: 24) {
                    menuStyleCard(title: ".automatic", api: ".menuStyle(.automatic)") {
                        sampleMenu.menuStyle(.automatic)
                    }
                    menuStyleCard(title: ".button", api: ".menuStyle(.button)") {
                        sampleMenu.menuStyle(.button)
                    }
                    menuStyleCard(title: ".borderlessButton", api: ".menuStyle(.borderlessButton)") {
                        sampleMenu.menuStyle(.borderlessButton)
                    }
                }
            }
        }
    }

    private var sampleMenu: some View {
        Menu("Actions") {
            Button("Open") {}
            Button("Open in New Window") {}
            Divider()
            Button("Close") {}
        }
    }

    // MARK: MenuStyle composition with ButtonStyle

    private var menuStyleCompositionSection: some View {
        PageSection("MenuStyle Composition with ButtonStyle", subtitle: ".menuStyle(.button) + .buttonStyle(_:)") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Once a Menu adopts .menuStyle(.button), it inherits any .buttonStyle(_:) further up the view tree \u{2014} same composition model as Toggle with .toggleStyle(.button).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                HStack(alignment: .top, spacing: 24) {
                    menuStyleCard(title: ".bordered", api: ".menuStyle(.button).buttonStyle(.bordered)") {
                        sampleMenu
                            .menuStyle(.button)
                            .buttonStyle(.bordered)
                    }
                    menuStyleCard(title: ".borderedProminent", api: ".menuStyle(.button).buttonStyle(.borderedProminent)") {
                        sampleMenu
                            .menuStyle(.button)
                            .buttonStyle(.borderedProminent)
                    }
                    menuStyleCard(title: ".glass", api: ".menuStyle(.button).buttonStyle(.glass)") {
                        sampleMenu
                            .menuStyle(.button)
                            .buttonStyle(.glass)
                    }
                }
            }
        }
    }

    // MARK: Reference — MenuStyle protocol + MenuStyleConfiguration

    private var menuStyleReferenceSection: some View {
        PageSection("Reference \u{2014} MenuStyle Protocol + MenuStyleConfiguration", subtitle: "protocol MenuStyle  \u{00b7}  struct MenuStyleConfiguration  \u{00b7}  macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading, spacing: 8) {
                    Text("MenuStyle protocol")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock("""
protocol MenuStyle : DynamicProperty, Sendable

// Required
func makeBody(configuration: Self.Configuration) -> Self.Body
typealias Configuration = MenuStyleConfiguration

// Built-in conformers
struct AutomaticMenuStyle    : MenuStyle  // .automatic
struct ButtonMenuStyle       : MenuStyle  // .button
struct BorderlessButtonMenuStyle : MenuStyle  // .borderlessButton
""")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("MenuStyleConfiguration structure")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    codeBlock("""
struct MenuStyleConfiguration {
    struct Title   : View { … }   // type-erased title view (the menu label)
    struct Content : View { … }   // type-erased items view (the menu content)

    var title:   MenuStyleConfiguration.Title   { get }
    var content: MenuStyleConfiguration.Content { get }
}
""")
                    Text("SwiftKit does NOT author custom MenuStyle conformers \u{2014} Apple-only per project hard constraint.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: MenuOrder variants

    private var menuOrderSection: some View {
        PageSection("MenuOrder Variants", subtitle: "enum MenuOrder  \u{00b7}  View/menuOrder(_:)  \u{00b7}  macOS 13.0+") {
            VStack(alignment: .leading, spacing: 16) {

                VStack(alignment: .leading, spacing: 4) {
                    Text("enum MenuOrder : Equatable, Hashable, Sendable")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                    Text("func menuOrder(_ order: MenuOrder) -> some View")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                }

                VStack(alignment: .leading, spacing: 12) {
                    menuOrderRow(".fixed", "Preserve the item declaration order exactly. Use this on macOS to guarantee the order you wrote.")
                    menuOrderRow(".priority", "On iOS, the system may reorder items by frequency/recency. On macOS, behaves identically to .fixed \u{2014} system reordering has no effect.")
                    menuOrderRow(".automatic", "The default. Platform chooses. On macOS, this is effectively .fixed.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".menuOrder(.fixed) \u{2014} guaranteed declaration order")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu("Fixed Order") {
                        Button("First") {}
                        Button("Second") {}
                        Button("Third") {}
                    }
                    .menuOrder(.fixed)
                    .menuDemoFrame()
                    APICallout(".menuOrder(.fixed)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".menuOrder(.priority) \u{2014} note on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(".priority is @available(iOS 16.0+, macOS 13.0+). On macOS the system does not reorder items \u{2014} .priority renders the same as .fixed in practice.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(".menuOrder(.priority)  // macOS 13.0+ available; reordering is iOS-only behavior")
                }

                noteRow(title: "Platform-specific behavior.",
                        detail: ".priority was designed for iOS where the system adapts to usage frequency. On macOS, the menu item order is determined by declaration order regardless of the MenuOrder value.",
                        symbol: "iphone")
            }
        }
    }

    // MARK: menuIndicator visibility control

    private var menuIndicatorSection: some View {
        PageSection("menuIndicator Visibility Control", subtitle: "View/menuIndicator(_:)  \u{00b7}  macOS 12.0+") {
            VStack(alignment: .leading, spacing: 16) {

                Text("func menuIndicator(_ visibility: Visibility) -> some View")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)

                Text("Controls the chevron indicator that signals a Menu will open. Takes a Visibility value: .automatic, .visible, or .hidden. Cascades down the view hierarchy.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("All three Visibility values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        ForEach([Visibility.automatic, .visible, .hidden], id: \.self) { vis in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(visibilityLabel(vis))
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                                Menu {
                                    Button("Item 1") {}
                                    Button("Item 2") {}
                                } label: {
                                    Text("Choose")
                                }
                                .menuIndicator(vis)
                                .frame(width: 160)
                            }
                        }
                    }
                    APICallout(".menuIndicator(.automatic / .visible / .hidden)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("primaryAction split-button \u{2014} .menuIndicator(.hidden)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Menu {
                        Button("Recent") {}
                        Button("Older") {}
                    } label: {
                        Label("Back", systemImage: "chevron.backward")
                            .labelStyle(.iconOnly)
                    } primaryAction: {}
                        .menuIndicator(.hidden)
                        .frame(width: 60)
                    APICallout(".menuIndicator(.hidden) on a primaryAction Menu \u{2014} pure icon button")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Drive visibility from a Picker")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 12) {
                        Picker("Indicator", selection: $indicatorVisibility) {
                            Text(".automatic").tag(Visibility.automatic)
                            Text(".visible").tag(Visibility.visible)
                            Text(".hidden").tag(Visibility.hidden)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 320)
                        Menu {
                            Button("Apple") {}
                            Button("Banana") {}
                            Button("Cherry") {}
                        } label: {
                            Text("Pick a fruit")
                        }
                        .menuIndicator(indicatorVisibility)
                        .frame(width: 200)
                        Text("indicator = \(visibilityLabel(indicatorVisibility))")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    noteRow(title: "Affects the chevron, not the menu content.",
                            detail: ".menuIndicator(.hidden) removes the chevron; the menu still opens on click. The content closure is not affected.",
                            symbol: "chevron.down")
                    noteRow(title: "Useful for primaryAction split buttons.",
                            detail: "When you want a compact icon-only button that also opens a menu via long-press / secondary tap, hiding the indicator keeps chrome minimal.",
                            symbol: "ellipsis.circle")
                    noteRow(title: ".automatic shows the indicator on macOS by default.",
                            detail: "Apple's default for Menu on macOS is to show the chevron. .visible is rarely needed unless an ancestor container has hidden it.",
                            symbol: "gear")
                    noteRow(title: "Cascades down the view tree.",
                            detail: "Setting .menuIndicator on a container affects every Menu inside until a child re-applies the modifier with a different value.",
                            symbol: "arrow.down.circle")
                    noteRow(title: "Custom ButtonStyle: read \\Environment{\\.menuIndicatorVisibility}.",
                            detail: "When implementing your own ButtonStyle, read \\.menuIndicatorVisibility from the environment to honor the user's preference.",
                            symbol: "leaf")
                }
            }
        }
    }

    // MARK: ToolbarTitleMenu integration

    private var toolbarTitleMenuSection: some View {
        PageSection("ToolbarTitleMenu Integration", subtitle: "struct ToolbarTitleMenu  \u{00b7}  View/toolbarTitleMenu(content:)  \u{00b7}  macOS 13.0+") {
            VStack(alignment: .leading, spacing: 16) {

                VStack(alignment: .leading, spacing: 4) {
                    Text("struct ToolbarTitleMenu : CustomizableToolbarContent, ToolbarContent")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                    Text("init()  // system populates from command groups")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                    Text("init<C>(content: () -> C) where C : View  // custom items override defaults")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                    Text("func toolbarTitleMenu<C>(content: () -> C) -> some View  // View-modifier form")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                }

                Text("The macOS document-window title menu: clicking the window title opens a menu with Save, Print, Duplicate, Move\u{2026} The modifier/type gives you both the default (system-populated) form and a custom-content override.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("ToolbarTitleMenu() \u{2014} system-populated form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    NavigationStack {
                        Text("System fills menu from the app\u{2019}s CommandGroupPlacement entries (.saveItem, .printItem, \u{2026})")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbar {
                                ToolbarTitleMenu()
                            }
                    }
                    .frame(width: 480, height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout(".toolbar { ToolbarTitleMenu() }  // no-argument form")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ToolbarTitleMenu(content:) \u{2014} custom items override defaults")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    NavigationStack {
                        Text("Custom items replace the system defaults entirely")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbar {
                                ToolbarTitleMenu {
                                    Button("Duplicate") {}
                                    Button("Print\u{2026}") {}
                                    Divider()
                                    Button("Move To\u{2026}") {}
                                }
                            }
                    }
                    .frame(width: 480, height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("ToolbarTitleMenu { Button(\"Duplicate\") { } }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".toolbarTitleMenu(content:) \u{2014} View modifier form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    NavigationStack {
                        Text("Equivalent to placing ToolbarTitleMenu inside .toolbar { }; just a different call site")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbarTitleMenu {
                                Button("Duplicate") {}
                                Button("Print\u{2026}") {}
                            }
                    }
                    .frame(width: 480, height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout(".toolbarTitleMenu { Button(\"Duplicate\") { } }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Two surfaces, one behavior")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Label("ToolbarTitleMenu \u{2014} the type, placed inside .toolbar { } closures", systemImage: "rectangle.connected.to.line.below")
                        Label(".toolbarTitleMenu(content:) \u{2014} the View modifier, sugar over the type", systemImage: "wand.and.stars")
                    }
                    .font(.callout)
                    .foregroundStyle(.primary)
                }

                VStack(alignment: .leading, spacing: 12) {
                    noteRow(title: "macOS document-window pattern.",
                            detail: "On macOS, the title menu is what you click on a document window\u{2019}s title to get Save, Print, Duplicate, Move\u{2026} SwiftUI populates the default menu from command groups; you override with a content closure.",
                            symbol: "doc.text")
                    noteRow(title: "iOS surface: tap the navigation title.",
                            detail: "From Apple\u{2019}s docs: \u{201c}In iOS and iPadOS, this will construct a menu that can be presented by tapping the navigation title in the app\u{2019}s navigation bar.\u{201d} Same model, different platform gesture.",
                            symbol: "iphone")
                    noteRow(title: "Default vs override.",
                            detail: "ToolbarTitleMenu() with no content: system populates from CommandGroupPlacement. ToolbarTitleMenu { \u{2026} } or .toolbarTitleMenu { \u{2026} }: your closure replaces the default.",
                            symbol: "arrow.triangle.swap")
                    noteRow(title: "As CustomizableToolbarContent.",
                            detail: "ToolbarTitleMenu conforms to CustomizableToolbarContent so it can live inside .toolbar(id:) and be referenced by the customization sheet.",
                            symbol: "list.number")
                }
            }
        }
    }

    // MARK: Menu disabled state

    private var menuDisabledSection: some View {
        PageSection("Menu Disabled State", subtitle: ".disabled(_:) propagates to all items") {
            VStack(alignment: .leading, spacing: 8) {
                Text(".disabled(true) applied to a Menu prevents it from opening and visually dims it. The modifier cascades to child Button items as well.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Menu("Disabled Menu") {
                    Button("Action A") {}
                    Button("Action B") {}
                }
                .disabled(true)
                .menuDemoFrame()
                APICallout("Menu(\u{2026}).disabled(true)")
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Menu \u{00b7} MenuStyle \u{00b7} MenuOrder \u{00b7} menuIndicator \u{00b7} ToolbarTitleMenu") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(title: "Menu renders as a pull-down button with chevron on macOS.",
                        detail: "The system draws a chevron to indicate more items. The appearance is equivalent to NSPopUpButton with pullsDown:true. Use .menuStyle to customize.",
                        symbol: "chevron.down")
                noteRow(title: "primaryAction separates click from long-press.",
                        detail: "With primaryAction:, a click triggers the primary action and a long-press (or click-hold) opens the menu. This is the split-button pattern from AppKit.",
                        symbol: "cursorarrow.click.2")
                noteRow(title: "Divider() inserts a separator in the menu.",
                        detail: "Use Divider() between logical groups. On macOS this renders as an NSMenuItem separator. It is ignored when used outside a Menu or contextMenu.",
                        symbol: "divide")
                noteRow(title: ".menuStyle(.button) bridges to .buttonStyle(_:).",
                        detail: "After .menuStyle(.button), a Menu inherits whatever .buttonStyle(_:) sits further up the tree. Pair with .buttonStyle(.glass) for a macOS 26 Liquid Glass trigger.",
                        symbol: "rectangle.connected.to.line.below")
                noteRow(title: "menuIndicator cascades and can be overridden per child.",
                        detail: "Setting .menuIndicator on a container hides indicators for every Menu inside. A child can re-apply the modifier to restore its own indicator.",
                        symbol: "arrow.down.circle")
                noteRow(title: "ToolbarTitleMenu is the canonical macOS document-window title menu.",
                        detail: "Use the no-argument form to let the system populate it from CommandGroupPlacement entries. Pass a content closure to override with your own items.",
                        symbol: "doc.text")
            }
        }
    }

    // MARK: Helpers

    private func menuStyleCard<Content: View>(title: String, api: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: 300, height: 80, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }

    private func menuOrderRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 100, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func visibilityLabel(_ vis: Visibility) -> String {
        switch vis {
        case .automatic: return ".automatic"
        case .visible:   return ".visible"
        case .hidden:    return ".hidden"
        @unknown default: return String(describing: vis)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }

    private func codeBlock(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

// MARK: - View extension helper

private extension View {
    func menuDemoFrame() -> some View {
        self
            .padding(12)
            .frame(minWidth: 280, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    MenuPage()
        .frame(width: 1100, height: 1800)
}
