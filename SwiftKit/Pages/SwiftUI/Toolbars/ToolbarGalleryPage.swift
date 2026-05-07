import SwiftUI

// Dense SwiftUI Toolbars gallery — consolidates the entire family:
//   View/toolbar(content:)                — populates the bar
//   ToolbarItem                           — single item
//   ToolbarItemGroup                      — grouped items
//   ToolbarSpacer                         — spacers (macOS 26+)
//   ToolbarItemPlacement                  — semantic + positional slots
//   ToolbarPlacement                      — which BAR (window, nav, tab…)
//   ToolbarRole                           — role on the bar itself
//   ToolbarContent / ToolbarContentBuilder — protocol + result builder
//   View/toolbar(id:content:) + Customizable*  — Customize Toolbar… surface
//   View/toolbar(removing:) + ToolbarDefaultItemKind — drop default items
//   View/toolbarBackground(_:for:)        — chrome shape style
//   View/toolbarBackgroundVisibility(_:for:)  — show/hide chrome
//   View/toolbarVisibility(_:for:)        — modern visibility (macOS 15+)
//   View/toolbar(_:for:)                  — deprecated visibility (replaced by toolbarVisibility)
//   View/toolbarTitleDisplayMode(_:)      — title rendering (no-op on macOS)
//   View/toolbarForegroundStyle(_:for:)   — watchOS only — code reference
//   ToolbarLabelStyle / Env.toolbarLabelStyle — Scene-level label style
//   View/ornament(…) + OrnamentAttachmentAnchor — visionOS only — code reference
//
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

// MARK: — Page-local layout constants

private let toolbarFrameWidth: CGFloat = 480
private let toolbarFrameHeight: CGFloat = 220

// MARK: — Main page

struct ToolbarGalleryPage: View {
    // State for live demos that need bindings.
    @State private var bold = false
    @State private var italic = false
    @State private var underline = false
    @State private var query = ""
    @State private var showShare = true
    @State private var fontSize: Double = 12
    @State private var visibilityState: Visibility = .automatic
    @State private var visibilityForState: Visibility = .automatic
    @State private var backgroundVisibility: Visibility = .automatic
    @State private var searchQuery = ""

    @Environment(\.toolbarLabelStyle) private var environmentLabelStyle

    private var environmentLabelStyleDescription: String {
        guard let style = environmentLabelStyle else { return "nil (system default)" }
        return String(describing: style)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                toolbarContentSection
                toolbarItemSection
                toolbarItemGroupSection
                toolbarItemPlacementSection
                toolbarSpacerSection
                toolbarContentProtocolSection
                toolbarContentBuilderSection
                toolbarPlacementSection
                toolbarRoleSection
                toolbarRemovingSection
                customizableToolbarSection
                toolbarBackgroundSection
                toolbarBackgroundVisibilitySection
                toolbarVisibilitySection
                toolbarVisibilityForSection
                toolbarTitleDisplayModeSection
                toolbarLabelStyleSection
                toolbarForegroundStyleSection
                ornamentSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Toolbars")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Populates a window or scene's toolbar with items, groups, spacers, and placements, and exposes the customization, role, and visibility/style modifiers that tune toolbar behavior. Also covers Ornament — the visionOS analogue for scene-anchored auxiliary content — included here for API completeness.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/  \u{00b7}  macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("toolbar(content:) \u{00b7} ToolbarItem \u{00b7} ToolbarItemGroup \u{00b7} ToolbarSpacer \u{00b7} toolbar(id:content:) \u{00b7} CustomizableToolbarContent \u{00b7} toolbarRole(_:) \u{00b7} ornament(\u{2026})")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: View/toolbar(content:)

    private var toolbarContentSection: some View {
        PageSection("View/toolbar(content:)",
                    subtitle: "Populates the bar via a @ToolbarContentBuilder closure \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Populates the toolbar or navigation bar with the specified items via a ToolbarContentBuilder closure. The macOS demos below are framed inside a fixed-size NavigationStack so the chrome appears within the demo card rather than the host SwiftKit window.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default \u{2014} single primary action") {
                    toolbarDemo(api: ".toolbar { ToolbarItem(placement: .primaryAction) { Button(\u{2026}) } }") {
                        NavigationStack {
                            Text("Document body")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Multiple ToolbarItems") {
                    toolbarDemo(api: "ToolbarItem(placement: .primaryAction) { \u{2026} } \u{00d7} N") {
                        NavigationStack {
                            Text("Three primary actions")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("New", systemImage: "plus") }
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Info", systemImage: "info.circle") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Mixed semantic placements") {
                    toolbarDemo(api: ".navigation, .principal, .primaryAction") {
                        NavigationStack {
                            Text("Editor")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .navigationTitle("Untitled")
                                .toolbar {
                                    ToolbarItem(placement: .navigation) {
                                        Button { } label: { Image(systemName: "sidebar.left") }
                                    }
                                    ToolbarItem(placement: .principal) {
                                        Text("Principal").font(.headline)
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "TextField in the toolbar") {
                    toolbarDemo(api: "ToolbarItem { TextField(\u{2026}, text: $query) }") {
                        NavigationStack {
                            Text("query = \"\(query)\"")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        TextField("Search", text: $query)
                                            .textFieldStyle(.roundedBorder)
                                            .frame(minWidth: 160)
                                    }
                                }
                        }
                    }
                }
            }
        }
    }

    // MARK: ToolbarItem

    private var toolbarItemSection: some View {
        PageSection("ToolbarItem",
                    subtitle: "struct ToolbarItem \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("A model that represents an item which can be placed in the toolbar or navigation bar. Three initializers cover the surface: plain, identified, and identified-hidden-by-default.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "init(placement:content:) \u{2014} the most common form") {
                    toolbarDemo(api: "ToolbarItem(placement: .primaryAction) { Button(\u{2026}) }") {
                        NavigationStack {
                            Text("Single primary action")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "init(id:placement:content:) \u{2014} required for customizable toolbars") {
                    toolbarDemo(api: ".toolbar(id:) { ToolbarItem(id: \"add\", placement: .secondaryAction) { \u{2026} } }") {
                        NavigationStack {
                            Text("Customizable: id required")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "demo-toolbar-item-id") {
                                    ToolbarItem(id: "add", placement: .secondaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                    ToolbarItem(id: "share", placement: .secondaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "init(id:placement:showsByDefault:content:) \u{2014} hidden until added in Customize\u{2026}") {
                    toolbarDemo(api: "ToolbarItem(id: \"info\", placement: .secondaryAction, showsByDefault: false) { \u{2026} }") {
                        NavigationStack {
                            Text("Info hidden by default")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "demo-toolbar-item-shows-by-default") {
                                    ToolbarItem(id: "add", placement: .secondaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                    ToolbarItem(id: "info", placement: .secondaryAction, showsByDefault: false) {
                                        Button { } label: { Label("Info", systemImage: "info.circle") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Different content shapes \u{2014} icon, label, text") {
                    toolbarDemo(api: "ToolbarItem { Button(systemImage:) | Button(Label) | Button(\"Text\") }") {
                        NavigationStack {
                            Text("Three shapes of button")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Image(systemName: "plus") }
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button("Done") { }
                                    }
                                }
                        }
                    }
                }
            }
        }
    }

    // MARK: ToolbarItemGroup

    private var toolbarItemGroupSection: some View {
        PageSection("ToolbarItemGroup",
                    subtitle: "struct ToolbarItemGroup \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("A model that represents a group of ToolbarItems sharing a placement. From Apple's docs: \"wrapping a related group of toolbar items together in a ToolbarItemGroup provides a one-to-one mapping between controls and toolbar items which results in the correct layout and spacing on each platform.\"")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "init(placement:content:)") {
                    toolbarDemo(api: "ToolbarItemGroup(placement: .primaryAction) { Button, Button }") {
                        NavigationStack {
                            Text("Two grouped buttons")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItemGroup(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "init(placement:content:label:) \u{2014} group with a label (iOS-flavored on macOS)") {
                    toolbarDemo(api: "ToolbarItemGroup(placement: .primaryAction, content: { \u{2026} }, label: { Text(\"Format\") })") {
                        NavigationStack {
                            Text("Group with a Label")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItemGroup(placement: .primaryAction) {
                                        Toggle(isOn: $bold) { Image(systemName: "bold") }
                                        Toggle(isOn: $italic) { Image(systemName: "italic") }
                                    } label: {
                                        Label("Format", systemImage: "textformat")
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Bound state across the group") {
                    toolbarDemo(api: "Toggle($bold) / Toggle($italic) / Toggle($underline)") {
                        NavigationStack {
                            VStack {
                                Text("bold=\(bold ? "1" : "0") italic=\(italic ? "1" : "0") underline=\(underline ? "1" : "0")")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItemGroup(placement: .primaryAction) {
                                    Toggle(isOn: $bold) { Image(systemName: "bold") }
                                    Toggle(isOn: $italic) { Image(systemName: "italic") }
                                    Toggle(isOn: $underline) { Image(systemName: "underline") }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: ToolbarItemPlacement

    private var toolbarItemPlacementSection: some View {
        PageSection("ToolbarItemPlacement",
                    subtitle: "Where in the bar an item appears \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Defines where in the toolbar an item appears. Semantic placements (intent) flex per platform; positional placements pin to a specific edge. Positional cases (.topBarLeading, .topBarTrailing, .bottomBar, .bottomOrnament, .keyboard, .accessoryBar) are mostly iOS/iPadOS.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                placementBlock(title: ".automatic \u{2014} let the system pick",
                               api: ".automatic",
                               note: "Default if you don't supply a placement. Treated as .secondaryAction-ish on macOS.") {
                    NavigationStack {
                        Text("Automatic slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .automatic) {
                                    Button { } label: { Label("Action", systemImage: "ellipsis.circle") }
                                }
                            }
                    }
                }

                placementBlock(title: ".primaryAction \u{2014} the headline action",
                               api: ".primaryAction",
                               note: "Trailing on macOS; the action that drives the screen.") {
                    NavigationStack {
                        Text("Primary action")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }

                placementBlock(title: ".secondaryAction \u{2014} supporting actions",
                               api: ".secondaryAction",
                               note: "Lower-priority actions; on macOS often clustered near the primary action.") {
                    NavigationStack {
                        Text("Secondary action")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .secondaryAction) {
                                    Button { } label: { Label("Tag", systemImage: "tag") }
                                }
                            }
                    }
                }

                placementBlock(title: ".navigation \u{2014} navigation chrome",
                               api: ".navigation",
                               note: "Back/forward, sidebar toggle \u{2014} controls that operate on the current navigation stack.") {
                    NavigationStack {
                        Text("Navigation slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .navigation) {
                                    Button { } label: { Image(systemName: "sidebar.left") }
                                }
                            }
                    }
                }

                placementBlock(title: ".principal \u{2014} the centered, identity slot",
                               api: ".principal",
                               note: "Custom centered title content.") {
                    NavigationStack {
                        Text("Principal slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Text("Custom Principal").font(.headline)
                                }
                            }
                    }
                }

                placementBlock(title: ".confirmationAction \u{2014} commits work",
                               api: ".confirmationAction",
                               note: "Standard \"Done\" / \"Save\". On macOS, the system styles this as the default button.") {
                    NavigationStack {
                        Text("Confirm slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") { }
                                }
                            }
                    }
                }

                placementBlock(title: ".cancellationAction \u{2014} dismisses without committing",
                               api: ".cancellationAction",
                               note: "Standard \"Cancel\". Paired with .confirmationAction in dialogs/sheets.") {
                    NavigationStack {
                        Text("Cancel slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") { }
                                }
                            }
                    }
                }

                placementBlock(title: ".destructiveAction \u{2014} dangerous action",
                               api: ".destructiveAction",
                               note: "Delete / discard. Pair with role: .destructive on the Button.") {
                    NavigationStack {
                        Text("Destructive slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .destructiveAction) {
                                    Button(role: .destructive) { } label: { Label("Delete", systemImage: "trash") }
                                }
                            }
                    }
                }

                placementBlock(title: ".status \u{2014} ambient status info",
                               api: ".status",
                               note: "Non-actionable status (sync indicator, count, etc.). Centered on macOS.") {
                    NavigationStack {
                        Text("Status slot")
                            .font(.caption).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .status) {
                                    Text("Synced")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                    }
                }
            }
        }
    }

    // MARK: ToolbarSpacer

    private var toolbarSpacerSection: some View {
        PageSection("ToolbarSpacer",
                    subtitle: "Standard space between toolbar items \u{00b7} macOS 26.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Standard space item in toolbars. Use SpacerSizing to choose .fixed or .flexible behavior. Conforms to CustomizableToolbarContent (and ToolbarContent), so it works inside both .toolbar { } and .toolbar(id:) { } closures.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "ToolbarSpacer(.fixed) \u{2014} system-defined gap") {
                    toolbarDemo(api: "ToolbarSpacer(.fixed)") {
                        NavigationStack {
                            Text(".fixed inserts a small standard gap")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "spacer-fixed") {
                                    ToolbarItem(id: "a") {
                                        Button { } label: { Image(systemName: "bold") }
                                    }
                                    ToolbarSpacer(.fixed)
                                    ToolbarItem(id: "b") {
                                        Button { } label: { Image(systemName: "italic") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "ToolbarSpacer(.flexible) \u{2014} pushes items apart") {
                    toolbarDemo(api: "ToolbarSpacer(.flexible)") {
                        NavigationStack {
                            Text(".flexible expands to push items to opposite ends")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "spacer-flex") {
                                    ToolbarItem(id: "back") {
                                        Button { } label: { Image(systemName: "chevron.left") }
                                    }
                                    ToolbarSpacer(.flexible)
                                    ToolbarItem(id: "next") {
                                        Button { } label: { Image(systemName: "chevron.right") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Multiple spacers in a customizable toolbar") {
                    toolbarDemo(api: "ToolbarSpacer(.fixed) \u{00d7} 2 around grouped items") {
                        NavigationStack {
                            Text("Three clusters, two fixed spacers")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "spacer-multi") {
                                    ToolbarItem(id: "tag") {
                                        Button { } label: { Image(systemName: "tag") }
                                    }
                                    ToolbarSpacer(.fixed)
                                    ToolbarItem(id: "share") {
                                        Button { } label: { Image(systemName: "square.and.arrow.up") }
                                    }
                                    ToolbarSpacer(.fixed)
                                    ToolbarItem(id: "more") {
                                        Button { } label: { Image(systemName: "ellipsis.circle") }
                                    }
                                }
                        }
                    }
                }

                APICallout("ToolbarSpacer(SpacerSizing) \u{2014} .fixed is constant width, .flexible greedy")
                Text("Spacers in customizable toolbars are themselves customizable: users can add, remove, or rearrange them via the macOS Customize Toolbar\u{2026} sheet.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: ToolbarContent (protocol)

    private var toolbarContentProtocolSection: some View {
        PageSection("ToolbarContent (protocol)",
                    subtitle: "The conformance every .toolbar { } statement satisfies \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("The protocol every item in a .toolbar { } closure conforms to. Lets you write custom toolbar-content composites. Inherited by CustomizableToolbarContent.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Custom ToolbarContent type") {
                    toolbarDemo(api: "EditorTools: ToolbarContent { var body: some ToolbarContent { \u{2026} } }") {
                        NavigationStack {
                            Text("Custom ToolbarContent type wraps grouped items")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarEditorTools()
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Conforming types currently in the SwiftUI surface")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ForEach(["ToolbarItem", "ToolbarItemGroup", "ToolbarSpacer (macOS 26+)", "DefaultToolbarItem (macOS 26+)", "ToolbarTitleMenu", "Group (when its content is ToolbarContent)"], id: \.self) { name in
                        Label(name, systemImage: "checkmark")
                            .font(.callout)
                            .foregroundStyle(.primary)
                    }
                    APICallout("DefaultToolbarItem \u{00b7} Group \u{00b7} ToolbarItem \u{00b7} ToolbarItemGroup \u{00b7} ToolbarSpacer \u{00b7} ToolbarTitleMenu")
                }

                variantBlock(title: "Group<C: ToolbarContent> \u{2014} compose conditionally") {
                    toolbarDemo(api: "Group { ToolbarItem { \u{2026} }; ToolbarItem { \u{2026} } }") {
                        NavigationStack {
                            Text("Group lets if/else live inside a ToolbarContentBuilder")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    Group {
                                        ToolbarItem(placement: .primaryAction) {
                                            Button { } label: { Label("Add", systemImage: "plus") }
                                        }
                                        ToolbarItem(placement: .primaryAction) {
                                            Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                        }
                                    }
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Instance methods on ToolbarContent")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".hidden(_:) \u{2014} hide an item without removing it from the model", systemImage: "eye.slash")
                        .font(.callout).foregroundStyle(.primary)
                    Label(".matchedTransitionSource(id:in:) \u{2014} act as a zoom transition source", systemImage: "rectangle.connected.to.line.below")
                        .font(.callout).foregroundStyle(.primary)
                    Label(".sharedBackgroundVisibility(_:) \u{2014} share/hide the toolbar background", systemImage: "rectangle")
                        .font(.callout).foregroundStyle(.primary)
                }

                noteRow(
                    title: "@MainActor by default \u{2014} declare conformance in an extension to opt out.",
                    detail: "From the docs: \"Isolation to the main actor is the default, but it's not required. Declare the conformance in an extension to opt out of main actor isolation.\"",
                    symbol: "circle.dashed"
                )
            }
        }
    }

    // MARK: ToolbarContentBuilder

    private var toolbarContentBuilderSection: some View {
        PageSection("ToolbarContentBuilder",
                    subtitle: "@resultBuilder behind .toolbar { } closures \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Result builder that constructs a ToolbarContent collection from multi-expression closures. Same shape as @ViewBuilder: buildBlock(_:_:_:\u{2026}) up to 10 args, buildIf, buildEither(first:/second:), buildExpression, buildLimitedAvailability.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default \u{2014} two items via implicit builder") {
                    toolbarDemo(api: ".toolbar { ToolbarItem(\u{2026}); ToolbarItem(\u{2026}) }") {
                        NavigationStack {
                            Text("Implicit ToolbarContentBuilder accumulates two items")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Conditional via if/else \u{2014} buildEither(first:/second:)") {
                    toolbarDemo(api: "if showShare { ToolbarItem(share) } else { ToolbarItem(more) }") {
                        NavigationStack {
                            VStack {
                                Toggle("showShare", isOn: $showShare)
                                    .toggleStyle(.switch)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                                if showShare {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
                                    }
                                } else {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("More", systemImage: "ellipsis.circle") }
                                    }
                                }
                            }
                        }
                    }
                }

                variantBlock(title: "Custom @ToolbarContentBuilder property") {
                    toolbarDemo(api: "@ToolbarContentBuilder var customTools: some ToolbarContent { \u{2026} }") {
                        NavigationStack {
                            Text("Extracted builder property")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar {
                                    customTools
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Builder methods you may invoke directly")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label("buildBlock(_:_:\u{2026}) \u{2014} 1 to 10 arity overloads", systemImage: "rectangle.3.offgrid")
                    Label("buildExpression(_:) \u{2014} accepts a ToolbarContent expression", systemImage: "function")
                    Label("buildIf(_:) \u{2014} optional content", systemImage: "questionmark.diamond")
                    Label("buildEither(first:) / buildEither(second:) \u{2014} if/else branches", systemImage: "arrow.triangle.branch")
                    Label("buildLimitedAvailability(_:) \u{2014} availability fences", systemImage: "calendar.badge.clock")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    @ToolbarContentBuilder
    private var customTools: some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            Button { } label: { Image(systemName: "sidebar.left") }
        }
        ToolbarItemGroup(placement: .primaryAction) {
            Button { } label: { Label("Save", systemImage: "square.and.arrow.down") }
            Button { } label: { Label("Share", systemImage: "square.and.arrow.up") }
        }
    }

    // MARK: ToolbarPlacement

    private var toolbarPlacementSection: some View {
        PageSection("ToolbarPlacement",
                    subtitle: "Identifies the BAR (window, nav, tab, ornament) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Identifies a SwiftUI-managed bar (window toolbar, navigation bar, tab bar, etc.) for the visibility, background, color-scheme, and foreground-style modifiers. Distinct from ToolbarItemPlacement (which targets a region inside a single bar).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "macOS-relevant placement: .windowToolbar") {
                    toolbarDemo(api: ".toolbarBackground(_:for: .windowToolbar) | .toolbarVisibility(_:for: .windowToolbar)") {
                        NavigationStack {
                            Text("The macOS-relevant placement is .windowToolbar")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarBackground(.regularMaterial, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("iOS-flavored placements (compile but no-op on macOS)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".navigationBar \u{2014} the iOS NavigationView/NavigationStack chrome", systemImage: "rectangle.topthird.inset.filled")
                    Label(".tabBar \u{2014} TabView's bottom bar", systemImage: "rectangle.bottomthird.inset.filled")
                    Label(".bottomBar \u{2014} the iOS bottom bar attached to nav stacks", systemImage: "rectangle.bottomthird.inset.filled")
                    Label(".bottomOrnament \u{2014} visionOS bottom ornament", systemImage: "visionpro")
                    Label(".accessoryBar(id:) \u{2014} keyed accessory bar", systemImage: "rectangle.connected.to.line.below")
                }
                .font(.callout)
                .foregroundStyle(.primary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Modifiers that take ToolbarPlacement")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".toolbar(_:for:) \u{2014} visibility (deprecated)", systemImage: "eye")
                    Label(".toolbarVisibility(_:for:) \u{2014} visibility", systemImage: "eye")
                    Label(".toolbarBackground(_:for:) \u{2014} ShapeStyle background", systemImage: "rectangle")
                    Label(".toolbarBackgroundVisibility(_:for:) \u{2014} background visible/hidden", systemImage: "rectangle.dashed")
                    Label(".toolbarColorScheme(_:for:) \u{2014} preferred color scheme", systemImage: "circle.lefthalf.filled")
                    Label(".toolbarForegroundStyle(_:for:) \u{2014} item shape style", systemImage: "paintbrush")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    // MARK: ToolbarRole

    private var toolbarRoleSection: some View {
        PageSection("View/toolbarRole(_:) + ToolbarRole",
                    subtitle: "Semantic role for content populating the toolbar \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Configures the semantic role for content populating the toolbar. SwiftUI uses the role to influence how the toolbar renders (e.g. iPadOS browser apps lead-align their title). macOS exposes only .automatic and .editor — .browser and .navigationStack are iPadOS-only.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: ".automatic \u{2014} system picks") {
                    toolbarDemo(api: ".toolbarRole(.automatic)") {
                        NavigationStack {
                            Text("Default role")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .navigationTitle("Document")
                                .toolbarRole(.automatic)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: ".editor \u{2014} for document editors") {
                    toolbarDemo(api: ".toolbarRole(.editor)") {
                        NavigationStack {
                            Text("Editor role")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .navigationTitle("Untitled")
                                .toolbarRole(.editor)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Save", systemImage: "square.and.arrow.down") }
                                    }
                                }
                        }
                    }
                }

                APICallout(".toolbarRole(.browser) // iOS / iPadOS only — unavailable in macOS SDK")
                APICallout(".toolbarRole(.navigationStack) // iOS / iPadOS only — unavailable in macOS SDK")

                VStack(alignment: .leading, spacing: 6) {
                    Text("ToolbarRole \u{2014} four cases (macOS exposes only .automatic and .editor)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".automatic \u{2014} system picks based on context", systemImage: "wand.and.stars")
                    Label(".editor \u{2014} document editor layout", systemImage: "doc.text")
                    Label(".browser \u{2014} iPadOS-only", systemImage: "safari")
                    Label(".navigationStack \u{2014} iPadOS-only", systemImage: "rectangle.stack")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    // MARK: View/toolbar(removing:) + ToolbarDefaultItemKind

    private var toolbarRemovingSection: some View {
        PageSection("View/toolbar(removing:) + ToolbarDefaultItemKind",
                    subtitle: "Remove a default toolbar item provided by another View \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Removes a toolbar item another View adds by default. Pair the modifier with a ToolbarDefaultItemKind value (.sidebarToggle, .search, .title).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: ".sidebarToggle \u{2014} drop the NavigationSplitView toggle") {
                    toolbarDemo(api: ".toolbar(removing: .sidebarToggle)") {
                        NavigationSplitView {
                            Text("Sidebar")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(removing: .sidebarToggle)
                        } detail: {
                            Text("Detail (no sidebar toggle)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }

                variantBlock(title: ".search \u{2014} drop the system-provided search item") {
                    toolbarDemo(api: ".toolbar(removing: .search)") {
                        NavigationStack {
                            Text(".searchable provided, but the toolbar search item is removed")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .searchable(text: $searchQuery)
                                .toolbar(removing: .search)
                        }
                    }
                }

                variantBlock(title: ".title \u{2014} drop the navigation title item") {
                    toolbarDemo(api: ".toolbar(removing: .title)") {
                        NavigationStack {
                            Text("navigationTitle set, but the title item is removed from the toolbar")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .navigationTitle("Document")
                                .toolbar(removing: .title)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("ToolbarDefaultItemKind \u{2014} the kinds you can remove")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".sidebarToggle \u{2014} added by NavigationSplitView", systemImage: "sidebar.left")
                    Label(".search \u{2014} added by .searchable when hoisted to the toolbar", systemImage: "magnifyingglass")
                    Label(".title \u{2014} the navigation title item", systemImage: "textformat")
                }
                .font(.callout)
                .foregroundStyle(.primary)

                APICallout(".toolbar(removing: nil) \u{2014} no-op; useful for dynamic decisions")
                Text("The parameter is ToolbarDefaultItemKind?, so a nil value means \"don't remove anything\". Use this if a property determines whether to drop a default item.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Customizable toolbars (toolbar(id:) + behavior + options)

    private var customizableToolbarSection: some View {
        PageSection("Customizable toolbars",
                    subtitle: ".toolbar(id:) + CustomizableToolbarContent + ToolbarCustomizationBehavior + ToolbarCustomizationOptions") {
            VStack(alignment: .leading, spacing: 24) {
                Text(".toolbar(id:content:) + CustomizableToolbarContent + ToolbarCustomizationBehavior + ToolbarCustomizationOptions \u{2014} the four pieces that opt a toolbar into the macOS Customize Toolbar\u{2026} sheet. The modifier is macOS 11+; .customizationBehavior(_:) and .defaultCustomization(_:options:) require macOS 13+.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default \u{2014} three identified items") {
                    toolbarDemo(api: ".toolbar(id: \"main\") { ToolbarItem(id: \u{2026}) \u{00d7} N }") {
                        NavigationStack {
                            Text("Customizable toolbar with three identified items")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "default-customizable") {
                                    ToolbarItem(id: "size", placement: .secondaryAction) {
                                        Slider(value: $fontSize, in: 8...32) { Text("Font Size") }
                                            .frame(width: 120)
                                    }
                                    ToolbarItem(id: "bold", placement: .secondaryAction) {
                                        Toggle(isOn: $bold) { Image(systemName: "bold") }
                                    }
                                    ToolbarItem(id: "italic", placement: .secondaryAction) {
                                        Toggle(isOn: $italic) { Image(systemName: "italic") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "ToolbarItem(id:placement:showsByDefault:) \u{2014} hidden until added") {
                    toolbarDemo(api: "ToolbarItem(id: \"info\", \u{2026}, showsByDefault: false)") {
                        NavigationStack {
                            Text("Info absent unless user adds it via Customize\u{2026}")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "shows-by-default") {
                                    ToolbarItem(id: "add", placement: .secondaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                    ToolbarItem(id: "info", placement: .secondaryAction, showsByDefault: false) {
                                        Button { } label: { Label("Info", systemImage: "info.circle") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: ".customizationBehavior(_:) \u{2014} ToolbarCustomizationBehavior") {
                    toolbarDemo(api: ".customizationBehavior(.disabled) | .reorderable | .default") {
                        NavigationStack {
                            Text("Behavior controls reorderability + removability per item")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "behavior-demo") {
                                    ToolbarItem(id: "fixed", placement: .secondaryAction) {
                                        Button { } label: { Label("Fixed", systemImage: "lock") }
                                    }
                                    .customizationBehavior(.disabled)

                                    ToolbarItem(id: "reorder", placement: .secondaryAction) {
                                        Button { } label: { Label("Reorder", systemImage: "arrow.up.arrow.down") }
                                    }
                                    .customizationBehavior(.reorderable)

                                    ToolbarItem(id: "default", placement: .secondaryAction) {
                                        Button { } label: { Label("Default", systemImage: "checkmark") }
                                    }
                                    .customizationBehavior(.default)
                                }
                        }
                    }
                }

                variantBlock(title: ".defaultCustomization(_:options:) \u{2014} ToolbarCustomizationOptions") {
                    toolbarDemo(api: ".defaultCustomization(.visible, options: .alwaysAvailable)") {
                        NavigationStack {
                            Text("alwaysAvailable: item stays in Customize\u{2026} even if removed from default set")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(id: "default-customization") {
                                    ToolbarItem(id: "always", placement: .secondaryAction) {
                                        Button { } label: { Label("Always", systemImage: "pin") }
                                    }
                                    .defaultCustomization(.visible, options: .alwaysAvailable)
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("ToolbarCustomizationBehavior \u{2014} static cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".default \u{2014} item is fully customizable", systemImage: "checkmark")
                    Label(".disabled \u{2014} item cannot be removed or reordered", systemImage: "lock")
                    Label(".reorderable \u{2014} item can be reordered but not removed", systemImage: "arrow.up.arrow.down")
                }
                .font(.callout)
                .foregroundStyle(.primary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("ToolbarCustomizationOptions \u{2014} OptionSet")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".alwaysAvailable \u{2014} keep the item in the Customize\u{2026} panel even when not in the default set", systemImage: "pin")
                }
                .font(.callout)
                .foregroundStyle(.primary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Add ToolbarCommands to the App scene to expose the menu item")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".commands { ToolbarCommands() } \u{2014} adds View > Customize Toolbar\u{2026}")
                    Text("On macOS, the standard way for users to invoke the customization sheet is the View > Customize Toolbar\u{2026} menu item; ToolbarCommands installs it.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: View/toolbarBackground(_:for:)

    private var toolbarBackgroundSection: some View {
        PageSection("View/toolbarBackground(_:for:)",
                    subtitle: "ShapeStyle background for SwiftUI-managed bars \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Specifies the preferred ShapeStyle of the background of a SwiftUI-managed bar.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default \u{2014} regular material") {
                    toolbarDemo(api: ".toolbarBackground(.regularMaterial, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Regular material background on the window toolbar")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarBackground(.regularMaterial, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Material backgrounds") {
                    VStack(alignment: .leading, spacing: 12) {
                        toolbarDemo(api: ".toolbarBackground(.ultraThinMaterial, for: .windowToolbar)") {
                            NavigationStack {
                                bgSampleView
                                    .toolbarBackground(.ultraThinMaterial, for: .windowToolbar)
                            }
                        }
                        toolbarDemo(api: ".toolbarBackground(.thickMaterial, for: .windowToolbar)") {
                            NavigationStack {
                                bgSampleView
                                    .toolbarBackground(.thickMaterial, for: .windowToolbar)
                            }
                        }
                    }
                }

                variantBlock(title: "Tinted backgrounds (semantic colors only)") {
                    VStack(alignment: .leading, spacing: 12) {
                        toolbarDemo(api: ".toolbarBackground(Color.accentColor, for: .windowToolbar)") {
                            NavigationStack {
                                bgSampleView
                                    .toolbarBackground(Color.accentColor, for: .windowToolbar)
                            }
                        }
                        toolbarDemo(api: ".toolbarBackground(.tint, for: .windowToolbar)") {
                            NavigationStack {
                                bgSampleView
                                    .toolbarBackground(.tint, for: .windowToolbar)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Companion modifiers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".toolbarBackgroundVisibility(_:for:) \u{2014} pin or hide the chrome surface", systemImage: "eye")
                    Label(".toolbarColorScheme(_:for:) \u{2014} preferred color scheme inside the bar", systemImage: "circle.lefthalf.filled")
                    Label(".toolbarForegroundStyle(_:for:) \u{2014} item shape style", systemImage: "paintbrush")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    private var bgSampleView: some View {
        Text("Sample content")
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button { } label: { Label("Add", systemImage: "plus") }
                }
            }
    }

    // MARK: View/toolbarBackgroundVisibility(_:for:)

    private var toolbarBackgroundVisibilitySection: some View {
        PageSection("View/toolbarBackgroundVisibility(_:for:)",
                    subtitle: "Pin or hide the chrome surface \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Specifies the preferred visibility of backgrounds on a SwiftUI-managed bar. Pin the bar background visible regardless of scroll state. Different from .toolbarVisibility(_:for:): this controls the bar's BACKGROUND, not the bar itself.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: ".visible \u{2014} always show the background") {
                    toolbarDemo(api: ".toolbarBackgroundVisibility(.visible, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Background always visible \u{2014} useful when content scrolls behind the toolbar")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: ".hidden \u{2014} drop the background") {
                    toolbarDemo(api: ".toolbarBackgroundVisibility(.hidden, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Background hidden \u{2014} content shows through")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Bound to @State") {
                    toolbarDemo(api: ".toolbarBackgroundVisibility(visibility, for: .windowToolbar)") {
                        NavigationStack {
                            VStack(spacing: 8) {
                                Picker("Visibility", selection: $backgroundVisibility) {
                                    Text(".automatic").tag(Visibility.automatic)
                                    Text(".visible").tag(Visibility.visible)
                                    Text(".hidden").tag(Visibility.hidden)
                                }
                                .pickerStyle(.segmented)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackgroundVisibility(backgroundVisibility, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: View/toolbarVisibility(_:for:)

    private var toolbarVisibilitySection: some View {
        PageSection("View/toolbarVisibility(_:for:)",
                    subtitle: "Modern visibility modifier \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Specifies the visibility of a bar managed by SwiftUI. The non-deprecated form of .toolbar(_:for:).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default \u{2014} hide the window toolbar") {
                    toolbarDemo(api: ".toolbarVisibility(.hidden, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Window toolbar hidden via the modern modifier")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarVisibility(.hidden, for: .windowToolbar)
                        }
                    }
                }

                variantBlock(title: ".visible / .hidden / .automatic on .windowToolbar") {
                    toolbarDemo(api: ".toolbarVisibility(.visible, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Window toolbar forced visible")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarVisibility(.visible, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Bound to @State") {
                    toolbarDemo(api: ".toolbarVisibility(visibility, for: .windowToolbar)") {
                        NavigationStack {
                            VStack(spacing: 8) {
                                Picker("Visibility", selection: $visibilityState) {
                                    Text(".automatic").tag(Visibility.automatic)
                                    Text(".visible").tag(Visibility.visible)
                                    Text(".hidden").tag(Visibility.hidden)
                                }
                                .pickerStyle(.segmented)
                                Text(visibilityLabel(for: visibilityState))
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarVisibility(visibilityState, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: View/toolbar(_:for:)

    private var toolbarVisibilityForSection: some View {
        PageSection("View/toolbar(_:for:)",
                    subtitle: "Deprecated 26.5 \u{2014} use toolbarVisibility(_:for:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Specifies the visibility of a bar managed by SwiftUI. Pass a Visibility and one or more ToolbarPlacement values. Same signature, same behavior as the modern toolbarVisibility(_:for:) — included here for cross-version reference.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default \u{2014} hide the window toolbar") {
                    toolbarDemo(api: ".toolbar(.hidden, for: .windowToolbar)") {
                        NavigationStack {
                            Text(".windowToolbar hidden \u{2014} the entire titlebar disappears on macOS")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(.hidden, for: .windowToolbar)
                        }
                    }
                }

                variantBlock(title: ".visible \u{2014} force visible") {
                    toolbarDemo(api: ".toolbar(.visible, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Window toolbar forced visible")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbar(.visible, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                variantBlock(title: "Bound to @State") {
                    toolbarDemo(api: ".toolbar(visibility, for: .windowToolbar)") {
                        NavigationStack {
                            VStack(spacing: 8) {
                                Picker("Visibility", selection: $visibilityForState) {
                                    Text(".automatic").tag(Visibility.automatic)
                                    Text(".visible").tag(Visibility.visible)
                                    Text(".hidden").tag(Visibility.hidden)
                                }
                                .pickerStyle(.segmented)
                                Text(visibilityLabel(for: visibilityForState))
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(visibilityForState, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private func visibilityLabel(for visibility: Visibility) -> String {
        switch visibility {
        case .automatic: return ".automatic"
        case .visible:   return ".visible"
        case .hidden:    return ".hidden"
        @unknown default: return String(describing: visibility)
        }
    }

    // MARK: View/toolbarTitleDisplayMode(_:) + ToolbarTitleDisplayMode

    private var toolbarTitleDisplayModeSection: some View {
        PageSection("View/toolbarTitleDisplayMode(_:) + ToolbarTitleDisplayMode",
                    subtitle: "iOS-flavored title rendering \u{00b7} macOS 14.0+ (no-op on macOS)") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Configures how a NavigationStack title renders. iOS-flavored \u{2014} per Apple's docs, the modifier has NO EFFECT on macOS. Cases: .automatic, .inline, .inlineLarge, .large.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                variantBlock(title: "Default call (compiles, inert on macOS)") {
                    toolbarDemo(api: ".toolbarTitleDisplayMode(.inlineLarge)") {
                        NavigationStack {
                            Text("On macOS the title chrome is owned by the window \u{2014} this modifier compiles but does not change rendering.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .navigationTitle("Document")
                                .toolbarTitleDisplayMode(.inlineLarge)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("ToolbarTitleDisplayMode \u{2014} four cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".automatic \u{2014} system default per platform/context", systemImage: "wand.and.stars")
                    Label(".inline \u{2014} small inline title (iOS top bar)", systemImage: "text.alignleft")
                    Label(".inlineLarge \u{2014} large inline title", systemImage: "textformat.size.larger")
                    Label(".large \u{2014} dropdown large title that scrolls into inline", systemImage: "arrow.up.left.and.arrow.down.right")
                }
                .font(.callout)
                .foregroundStyle(.primary)

                APICallout("nonisolated func toolbarTitleDisplayMode(_ mode: ToolbarTitleDisplayMode) -> some View")
                Text("Same call site on every platform. The macOS title chrome ignores the value but the call is safe to leave in place. For macOS title-chrome control, use .navigationTitle, .navigationSubtitle, .windowToolbarStyle, and .windowStyle(.hiddenTitleBar).")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: ToolbarLabelStyle / Env.toolbarLabelStyle

    private var toolbarLabelStyleSection: some View {
        PageSection("EnvironmentValues/toolbarLabelStyle + ToolbarLabelStyle",
                    subtitle: "How toolbar items render their Label \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("How toolbar items render their Label \u{2014} icon only, title only, both, or system default. Configured at the Scene level via .windowToolbarLabelStyle(_:); read inside views via the @Environment(\\.toolbarLabelStyle) value.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Current environment value")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("toolbarLabelStyle = \(environmentLabelStyleDescription)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    APICallout(".windowToolbarLabelStyle(.automatic)")
                    APICallout(".windowToolbarLabelStyle(.iconOnly)")
                    APICallout(".windowToolbarLabelStyle(.titleOnly)")
                    APICallout(".windowToolbarLabelStyle(.titleAndIcon)")
                    APICallout("WindowGroup { \u{2026} }.windowToolbarLabelStyle(.titleAndIcon)")
                    Text("On macOS the default is icon-only for compact toolbars, title+icon for expanded chrome. .windowToolbarLabelStyle is a Scene modifier — apply at WindowGroup / Window level. SwiftKit's gallery shell can't reconfigure its own toolbar mid-page, so demos here are documentation rather than live previews.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Text("See the WindowToolbarLabelStyle Scene modifier (`.windowToolbarLabelStyle(_:)` and `(fixed:)`) for the writer side. macOS users can right-click the toolbar to choose Icon, Text, or Icon and Text. `.windowToolbarLabelStyle(_:)` sets the default; `.windowToolbarLabelStyle(fixed:)` prevents user override.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: View/toolbarForegroundStyle(_:for:) — watchOS only (code-only reference)

    private var toolbarForegroundStyleSection: some View {
        PageSection("View/toolbarForegroundStyle(_:for:)",
                    subtitle: "Tint of toolbar items \u{00b7} watchOS 9.0+ ONLY (unavailable on macOS)") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Specifies the preferred foreground ShapeStyle of bars managed by SwiftUI \u{2014} the tint of the items inside the toolbar. Apple's availability block lists watchOS 9.0 only; the symbol is unavailable in the macOS SDK at compile time. SwiftKit captures the API for cross-platform reference but does not call it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                ToolbarCodeSnippet(code: """
                NavigationStack {
                    ContentView()
                        .navigationTitle("Blue")
                        .toolbarForegroundStyle(.blue, for: .navigationBar)
                }
                """)

                ToolbarCodeSnippet(code: """
                func toolbarForegroundStyle<S: ShapeStyle>(
                    _ style: S,
                    for bars: ToolbarPlacement...
                ) -> some View
                """)
                Text("Same shape as .toolbarBackground(_:for:) and .toolbarColorScheme(_:for:) \u{2014} variadic placements, ShapeStyle for the value.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Semantic ShapeStyles you would pass")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".primary / .secondary \u{2014} system foreground tints", systemImage: "paintpalette")
                    Label(".tint \u{2014} the current tint", systemImage: "drop.fill")
                    Label("Color.accentColor \u{2014} the app accent", systemImage: "paintbrush")
                }
                .font(.callout)
                .foregroundStyle(.primary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("macOS-equivalent surfaces")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".toolbarColorScheme(_:for:) \u{2014} pin the bar's color scheme", systemImage: "circle.lefthalf.filled")
                    Label(".tint(_:) on the toolbar's enclosing view \u{2014} affects toolbar item tint", systemImage: "drop.fill")
                    Label(".foregroundStyle(_:) per-Button \u{2014} explicit override", systemImage: "rectangle.split.2x1")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    // MARK: View/ornament + OrnamentAttachmentAnchor — visionOS only (code-only reference)

    private var ornamentSection: some View {
        PageSection("View/ornament(\u{2026}) + OrnamentAttachmentAnchor",
                    subtitle: "Scene-anchored auxiliary panel \u{00b7} visionOS 1.0+ ONLY (unavailable on macOS)") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Presents an ornament \u{2014} a panel attached to a window or scene at a positioning anchor. Both .ornament(\u{2026}) and OrnamentAttachmentAnchor are documented as visionOS-only. SwiftKit targets macOS 26; the symbols don't exist in the macOS SDK. The page captures the API for reference but does not call it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                ToolbarCodeSnippet(code: """
                Text("A view with an ornament")
                    .ornament(attachmentAnchor: .scene(.bottom)) {
                        OrnamentContent()
                    }
                """)

                ToolbarCodeSnippet(code: """
                func ornament<Content: View>(
                    visibility: Visibility = .automatic,
                    attachmentAnchor: OrnamentAttachmentAnchor,
                    contentAlignment: Alignment3D = .back,
                    @ViewBuilder ornament: () -> Content
                ) -> some View
                """)

                VStack(alignment: .leading, spacing: 6) {
                    Text("OrnamentAttachmentAnchor \u{2014} positioning anchors")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".scene(_:) \u{2014} attach to a UnitPoint relative to the enclosing scene", systemImage: "scope")
                    Label(".parent(_:) \u{2014} attach relative to the parent view", systemImage: "rectangle.connected.to.line.below")
                }
                .font(.callout)
                .foregroundStyle(.primary)
                APICallout(".scene(.bottom) | .scene(.top) | .scene(.leading) | .parent(.center)")

                VStack(alignment: .leading, spacing: 6) {
                    Text("macOS-equivalent surfaces")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Label(".toolbar { } / ToolbarItem \u{2014} for chrome-attached controls", systemImage: "rectangle.connected.to.line.below")
                    Label("Inspector / .inspector(isPresented:content:) \u{2014} for trailing detail panels", systemImage: "rectangle.righthalf.filled")
                    Label("Window(\"\u{2026}\", id:) + .windowStyle(.hiddenTitleBar) \u{2014} for floating accessory windows", systemImage: "macwindow")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    // MARK: Notes (consolidated)

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints across the family.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: ".toolbar { \u{2026} } takes a @ToolbarContentBuilder closure.",
                    detail: "Inside the closure you compose ToolbarItem, ToolbarItemGroup, ToolbarSpacer (macOS 26), DefaultToolbarItem (macOS 26), and ToolbarTitleMenu \u{2014} the conforming ToolbarContent types.",
                    symbol: "hammer"
                )
                noteRow(
                    title: "Wrap related controls in ToolbarItemGroup for one-to-one layout mapping.",
                    detail: "Apple's docs recommend it: a group preserves grouping/spacing across platforms and gives the system a single hint for overflow behavior.",
                    symbol: "rectangle.3.offgrid"
                )
                noteRow(
                    title: "Overflow is automatic.",
                    detail: "If items don't fit the available width, the system creates an overflow menu \u{2014} you don't manage truncation manually. Use ToolbarSpacer or explicit placements to influence which items get pushed.",
                    symbol: "ellipsis.circle"
                )
                noteRow(
                    title: "For user-customizable order/visibility, use .toolbar(id:content:) with ToolbarItem(id:\u{2026}).",
                    detail: "Plain .toolbar(content:) is fixed; .toolbar(id:) opts the toolbar into the macOS Customize Toolbar\u{2026} panel. Every item inside .toolbar(id:) needs an id.",
                    symbol: "slider.horizontal.3"
                )
                noteRow(
                    title: "Two placement families: ToolbarPlacement vs ToolbarItemPlacement.",
                    detail: "ToolbarPlacement = which BAR (.windowToolbar, .navigationBar, .tabBar, etc.). ToolbarItemPlacement = which SLOT inside a bar (.primaryAction, .principal, .navigation, .status, etc.).",
                    symbol: "rectangle.split.3x1"
                )
                noteRow(
                    title: "macOS apps mostly use .windowToolbar.",
                    detail: "Other ToolbarPlacement cases (.navigationBar, .tabBar, .bottomBar) are iOS-flavored and have no rendering effect on macOS, but they compile and the modifiers are no-ops.",
                    symbol: "macwindow"
                )
                noteRow(
                    title: "ToolbarRole on macOS is .automatic or .editor.",
                    detail: ".browser and .navigationStack are unavailable in the macOS SDK. NavigationStack already drives those layouts on macOS without an explicit role.",
                    symbol: "doc.text"
                )
                noteRow(
                    title: ".toolbarBackground vs .toolbarBackgroundVisibility vs .toolbarColorScheme.",
                    detail: "Background visibility decides WHETHER the chrome is drawn; toolbarBackground decides WHAT shape style fills it; toolbarColorScheme decides HOW the items contrast against it. The trio works together.",
                    symbol: "paintpalette"
                )
                noteRow(
                    title: ".toolbar(_:for:) is deprecated in 26.5.",
                    detail: "Use .toolbarVisibility(_:for:) going forward. Same signature, same behavior — just the new name.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: ".toolbarTitleDisplayMode is iOS-flavored.",
                    detail: "Apple's docs are explicit: this modifier has no effect on macOS. Treat it as cross-platform plumbing that influences only iOS / iPadOS / Mac Catalyst rendering.",
                    symbol: "iphone"
                )
                noteRow(
                    title: ".toolbarForegroundStyle is watchOS only.",
                    detail: "Symbol unavailable in the macOS SDK. For macOS toolbars use .toolbarColorScheme + .toolbarBackground or per-item .foregroundStyle.",
                    symbol: "applewatch"
                )
                noteRow(
                    title: ".ornament(\u{2026}) is visionOS only.",
                    detail: "Both the modifier and OrnamentAttachmentAnchor are unavailable on macOS. The closest macOS equivalents are floating accessory Windows (Window(\u{2026}) in the App scene) or .inspector trailing panels.",
                    symbol: "visionpro"
                )
                noteRow(
                    title: "ToolbarLabelStyle is a Scene-level setting.",
                    detail: "EnvironmentValues/toolbarLabelStyle is read-only inside views; the writer is .windowToolbarLabelStyle(_:) on a WindowGroup or Window. (fixed:) variant prevents user override via the toolbar context menu.",
                    symbol: "tag"
                )
                noteRow(
                    title: "Use semantic ShapeStyles only.",
                    detail: "Per L-001/L-012: .primary, .secondary, .tint, Color.accentColor, system materials. Avoid hand-mixed Color(red:green:blue:) and hex literals.",
                    symbol: "paintbrush"
                )
            }
        }
    }

    // MARK: View helpers

    private func toolbarDemo<Content: View>(
        api: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: toolbarFrameWidth, height: toolbarFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private func variantBlock<Content: View>(
        title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }

    private func placementBlock<Content: View>(
        title: String,
        api: String,
        note: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(note)
                .font(.footnote)
                .foregroundStyle(.secondary)
            toolbarDemo(api: api, content: content)
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
}

// MARK: — Reusable custom ToolbarContent type
// Demonstrates the ToolbarContent protocol (consolidated from
// ToolbarContentTypePage). Renamed from EditorTools to avoid any future
// collision with a Tools-named type elsewhere in the catalog.

private struct ToolbarEditorTools: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .primaryAction) {
            Button { } label: { Label("Save", systemImage: "square.and.arrow.down") }
            Button { } label: { Label("Print", systemImage: "printer") }
            Button { } label: { Label("Export", systemImage: "square.and.arrow.up") }
        }
    }
}

// Page-private code snippet view. Renamed from "CodeSnippet" to
// "ToolbarCodeSnippet" so it never collides with a sibling page if both end
// up in the same module.

private struct ToolbarCodeSnippet: View {
    let code: String

    var body: some View {
        Text(code)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

extension ToolbarGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.toolbars.toolbar",
        title: "Toolbar",
        folder: "Toolbars",
        framework: .swiftUI,
        absorbedSymbols: [
            "ContentToolbarPlacement",
            "CustomizableToolbarContent",
            "DefaultToolbarItem",
            "EnvironmentValues/toolbarLabelStyle",
            "OrnamentAttachmentAnchor",
            "SearchToolbarBehavior",
            "SpacerSizing",
            "ToolbarContent",
            "ToolbarContentBuilder",
            "ToolbarCustomizationBehavior",
            "ToolbarCustomizationOptions",
            "ToolbarDefaultItemKind",
            "ToolbarItem",
            "ToolbarItemGroup",
            "ToolbarItemPlacement",
            "ToolbarLabelStyle",
            "ToolbarPlacement",
            "ToolbarRole",
            "ToolbarSpacer",
            "ToolbarTitleDisplayMode",
            "View/ornament(visibility:attachmentAnchor:contentAlignment:ornament:)",
            "View/toolbar(_:for:)",
            "View/toolbar(content:)",
            "View/toolbar(id:content:)",
            "View/toolbar(removing:)",
            "View/toolbarBackground(_:for:)",
            "View/toolbarBackgroundVisibility(_:for:)",
            "View/toolbarForegroundStyle(_:for:)",
            "View/toolbarRole(_:)",
            "View/toolbarTitleDisplayMode(_:)",
            "View/toolbarVisibility(_:for:)"
        ],
        blurb: "Populates a window or scene's toolbar with items, groups, spacers, and placements, and exposes the customization, role, and visibility/style modifiers that tune toolbar behavior. Also covers Ornament — the visionOS analogue for scene-anchored auxiliary content — included here for API completeness.",
        signature: "toolbar(content:) \u{00b7} ToolbarItem \u{00b7} ToolbarItemGroup \u{00b7} ToolbarSpacer \u{00b7} toolbar(id:content:) \u{00b7} CustomizableToolbarContent \u{00b7} toolbarRole(_:) \u{00b7} ornament(visibility:attachmentAnchor:contentAlignment:ornament:)",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/toolbars/toolbar(content:).md",
        page: { AnyView(ToolbarGalleryPage()) }
    )
}

#Preview {
    ToolbarGalleryPage()
        .frame(width: 1200, height: 1600)
}
