import SwiftUI

// Dense SwiftUI TabView gallery — consolidates the entire family:
//   TabView                          (struct TabView)
//   Tab / TabSection                 (TabContent leaves and grouping)
//   TabContent                       (protocol TabContent)
//   TabContentBuilder                (result builder)
//   TabViewCustomization             (struct, persisted reordering / visibility)
//   TabCustomizationBehavior         (enum, .automatic / .disabled / .reorderable)
//   View/tabViewCustomization(_:)    (modifier)
//   View/tabViewSidebarHeader(content:)
//   View/tabViewSidebarFooter(content:)
//   View/tabViewSidebarBottomBar(content:)
//
// Source docs:
//   Documentation/SwiftUI/navigation/tabview.md
//   Documentation/SwiftUI/navigation/tabcontent.md
//   Documentation/SwiftUI/navigation/tabcontentbuilder.md
//   Documentation/SwiftUI/navigation/tabviewcustomization.md
//   Documentation/SwiftUI/navigation/tabviewcustomization(_:).md
//   Documentation/SwiftUI/navigation/tabcustomizationbehavior.md
//   Documentation/SwiftUI/navigation/tabviewsidebarheader(content:).md
//   Documentation/SwiftUI/navigation/tabviewsidebarfooter(content:).md
//   Documentation/SwiftUI/navigation/tabviewsidebarbottombar(content:).md
//
// macOS 10.15+ (the container) but the modern Tab/TabSection content,
// .sidebarAdaptable style, and customization surface are macOS 15+.
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

// MARK: — Shared demo state types (file-private)

private enum TVPSection: Hashable {
    case received, sent, account
}

private enum TCPSection: Hashable {
    case home, browse, settings
}

private enum TCBPSection: Hashable {
    case home, browse, settings, search
}

private let tvDemoFrameWidth: CGFloat = 520
private let tvDemoFrameHeight: CGFloat = 320
private let tvSecondaryFrameWidth: CGFloat = 540
private let tvSecondaryFrameHeight: CGFloat = 360

// MARK: — Main page

struct TabViewGalleryPage: View {
    // Bound selection — primary TabView demos
    @State private var selection: TVPSection = .received
    // TabContent demo selection
    @State private var contentSelection: TCPSection = .home
    // TabContentBuilder demo selection
    @State private var builderSelection: TCBPSection = .home
    // Customization state — shared across customization sections
    @State private var customization = TabViewCustomization()
    @State private var modifierCustomization = TabViewCustomization()
    @State private var behaviorCustomization = TabViewCustomization()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                defaultSection
                variantsSection
                statesSection
                tabContentSection
                tabContentBuilderSection
                tabViewCustomizationSection
                tabViewCustomizationModifierSection
                tabCustomizationBehaviorSection
                sidebarHeaderSection
                sidebarFooterSection
                sidebarBottomBarSection
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
            Text("TabView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that switches between multiple child views using interactive user interface elements. The TabView family covers the container itself, its Tab / TabSection children, the TabContent and TabContentBuilder protocols, and the customization surface (TabViewCustomization, TabCustomizationBehavior) plus sidebar accessory modifiers (header, footer, bottom bar).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabview.md  \u{00b7}  macOS 10.15+ (Tab/TabSection: macOS 15+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("TabView  \u{00b7}  Tab  \u{00b7}  TabSection  \u{00b7}  TabContent  \u{00b7}  TabContentBuilder  \u{00b7}  TabViewCustomization  \u{00b7}  TabCustomizationBehavior  \u{00b7}  .tabViewSidebarHeader  \u{00b7}  .tabViewSidebarFooter  \u{00b7}  .tabViewSidebarBottomBar")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default",
                    subtitle: "TabView { Tab(_:systemImage:) { … } }  \u{00b7}  the canonical macOS 15+ form") {
            tvDemoCard(api: "TabView { Tab(_:systemImage:) { … } }") {
                TabView {
                    Tab("Received", systemImage: "tray.and.arrow.down") {
                        pane("Received messages")
                    }
                    Tab("Sent", systemImage: "tray.and.arrow.up") {
                        pane("Sent messages")
                    }
                    Tab("Account", systemImage: "person.crop.circle") {
                        pane("Account info")
                    }
                }
            }
        }
    }

    // MARK: Variants

    private var variantsSection: some View {
        PageSection("Variants",
                    subtitle: "Two initializers \u{00b7} TabSection grouping \u{00b7} .sidebarAdaptable") {
            VStack(alignment: .leading, spacing: 24) {
                tvVariantBlock(title: "init(content:) — uncontrolled selection") {
                    tvDemoCard(api: "TabView { Tab(\"…\", systemImage:) { … } … }") {
                        TabView {
                            Tab("Received", systemImage: "tray.and.arrow.down") { pane("Received") }
                            Tab("Sent",     systemImage: "tray.and.arrow.up")   { pane("Sent") }
                            Tab("Account",  systemImage: "person.crop.circle")  { pane("Account") }
                        }
                    }
                }

                tvVariantBlock(title: "init(selection:content:) — bound selection") {
                    tvDemoCard(api: "TabView(selection: $selection) { Tab(_, systemImage:, value:) { … } }") {
                        TabView(selection: $selection) {
                            Tab("Received", systemImage: "tray.and.arrow.down", value: TVPSection.received) {
                                pane("Received")
                            }
                            Tab("Sent", systemImage: "tray.and.arrow.up", value: TVPSection.sent) {
                                pane("Sent")
                            }
                            Tab("Account", systemImage: "person.crop.circle", value: TVPSection.account) {
                                pane("Account")
                            }
                        }
                    }
                }

                tvVariantBlock(title: "TabSection — group tabs (best with .sidebarAdaptable)") {
                    tvDemoCard(api: "TabView { Tab(...); TabSection(\"Messages\") { Tab(...); Tab(...) } } .tabViewStyle(.sidebarAdaptable)") {
                        TabView {
                            Tab("Account", systemImage: "person.crop.circle") { pane("Account") }
                            TabSection("Messages") {
                                Tab("Received", systemImage: "tray.and.arrow.down") { pane("Received") }
                                Tab("Sent",     systemImage: "tray.and.arrow.up")   { pane("Sent") }
                                Tab("Drafts",   systemImage: "doc.text")            { pane("Drafts") }
                            }
                        }
                        .tabViewStyle(.sidebarAdaptable)
                    }
                }
            }
        }
    }

    // MARK: States

    private var statesSection: some View {
        PageSection("States",
                    subtitle: "Programmatic selection — buttons drive the binding") {
            VStack(alignment: .leading, spacing: 16) {
                tvVariantBlock(title: "Programmatic selection — buttons drive the binding") {
                    tvDemoCard(api: "selection = .received   selection = .sent   selection = .account") {
                        TabView(selection: $selection) {
                            Tab("Received", systemImage: "tray.and.arrow.down", value: TVPSection.received) { pane("Received") }
                            Tab("Sent",     systemImage: "tray.and.arrow.up",   value: TVPSection.sent)     { pane("Sent") }
                            Tab("Account",  systemImage: "person.crop.circle",  value: TVPSection.account)  { pane("Account") }
                        }
                    }
                    HStack(spacing: 8) {
                        Button("Received") { selection = .received }
                        Button("Sent")     { selection = .sent }
                        Button("Account")  { selection = .account }
                        Spacer()
                        Text("selection = \(String(describing: selection))")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    // MARK: TabContent

    private var tabContentSection: some View {
        PageSection("TabContent",
                    subtitle: "protocol TabContent \u{00b7} macOS 15.0+ \u{00b7} tab-content modifier surface") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that provides content for programmatically selectable tabs in a tab view. Conforming types: Tab, TabSection, AnyTabContent, ForEach, Group. Modifiers chain like View modifiers but are scoped to tab content.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — Tab is the canonical TabContent leaf") {
                    tvDemoCard(api: "Tab(...).badge(3).customizationID(\"home\")  // Tab is the canonical TabContent") {
                        TabView(selection: $contentSelection) {
                            Tab("Home", systemImage: "house", value: TCPSection.home) { pane("Home") }
                                .badge(3)
                                .customizationID("swiftkit.tcp.home")
                            Tab("Browse", systemImage: "list.bullet", value: TCPSection.browse) { pane("Browse") }
                                .customizationID("swiftkit.tcp.browse")
                            Tab("Settings", systemImage: "gear", value: TCPSection.settings) { pane("Settings") }
                                .customizationID("swiftkit.tcp.settings")
                        }
                        .tabViewStyle(.sidebarAdaptable)
                    }
                }

                tvVariantBlock(title: "Conforming types") {
                    APICallout("Tab, TabSection, AnyTabContent, ForEach, Group  — all conform to TabContent")
                }

                tvVariantBlock(title: "Common modifiers") {
                    VStack(alignment: .leading, spacing: 6) {
                        APICallout(".badge(_:)                         // numeric or string badge on the tab item")
                        APICallout(".customizationID(_:)               // stable identity for TabViewCustomization")
                        APICallout(".customizationBehavior(_:for:)     // .automatic / .disabled / .reorderable")
                        APICallout(".defaultVisibility(_:for:)         // initial sidebar visibility")
                        APICallout(".tabPlacement(_:)                  // .automatic / .pinned / .sidebarOnly")
                        APICallout(".sectionActions { Button(...) }    // hover-revealed section actions")
                        APICallout(".accessibilityLabel(_:)            // VoiceOver label override")
                    }
                }

                tvVariantBlock(title: "Composition — modifiers chain like View modifiers") {
                    APICallout("Tab(\"Home\", systemImage: \"house\", value: .home) { … }\n    .badge(2)\n    .customizationID(\"home\")\n    .defaultVisibility(.hidden, for: .sidebar)")
                }

                HStack(spacing: 8) {
                    Button("Home")     { contentSelection = .home }
                    Button("Browse")   { contentSelection = .browse }
                    Button("Settings") { contentSelection = .settings }
                    Spacer()
                    Text("selection = \(String(describing: contentSelection))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
                APICallout("@MainActor @preconcurrency protocol TabContent<TabValue> — main-actor-isolated by default.")
            }
        }
    }

    // MARK: TabContentBuilder

    private var tabContentBuilderSection: some View {
        PageSection("TabContentBuilder",
                    subtitle: "@resultBuilder TabContentBuilder \u{00b7} macOS 15.0+ \u{00b7} implicit on TabView's content closure") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A result builder that constructs tabs for a tab view that supports programmatic selection. Generic over `TabValue: Hashable` — every Tab in a builder must share the same selection type. The builder is implicit; you write Tab / TabSection / ForEach / Group inside TabView(selection:content:) and the compiler routes the closure through it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — builder is implicit") {
                    tvDemoCard(api: "TabView(selection: $selection) { Tab(_, systemImage:, value:) { … } }  // builder is implicit") {
                        TabView(selection: $builderSelection) {
                            Tab("Home",     systemImage: "house",        value: TCBPSection.home)     { pane("Home") }
                            Tab("Browse",   systemImage: "list.bullet",  value: TCBPSection.browse)   { pane("Browse") }
                            Tab("Settings", systemImage: "gear",         value: TCBPSection.settings) { pane("Settings") }
                        }
                    }
                }

                tvVariantBlock(title: "Sequential Tabs — buildBlock(_:_:_:…)") {
                    APICallout("TabView(selection:) { Tab(...); Tab(...); Tab(...) }  // up to 10 children supported")
                }

                tvVariantBlock(title: "Conditional content — buildEither / buildIf") {
                    APICallout("TabView(selection:) { Tab(...); if userIsAdmin { Tab(...) } }")
                    Text("if / else branches in the builder route through buildIf / buildEither(first:) / buildEither(second:). Limited-availability checks route through buildLimitedAvailability.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                tvVariantBlock(title: "ForEach inside the builder — repeated tabs") {
                    tvDemoCard(api: "ForEach(items) { Tab(_, systemImage:, value:) { … } }") {
                        TabView(selection: $builderSelection) {
                            Tab("Home", systemImage: "house", value: TCBPSection.home) { pane("Home") }
                            // ForEach over a heterogeneous range would normally produce one Tab type;
                            // shown here in code form for documentation only.
                            Tab("Browse",   systemImage: "list.bullet", value: TCBPSection.browse)   { pane("Browse") }
                            Tab("Settings", systemImage: "gear",        value: TCBPSection.settings) { pane("Settings") }
                        }
                    }
                }

                APICallout("All Tabs in a single builder must share the same TabValue (Hashable selection type).")
            }
        }
    }

    // MARK: TabViewCustomization

    private var tabViewCustomizationSection: some View {
        PageSection("TabViewCustomization",
                    subtitle: "struct TabViewCustomization \u{00b7} macOS 15.0+ \u{00b7} Codable / Sendable") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The customizations a person makes to an adaptable sidebar tab view. Stores per-user reordering and visibility. Pass a binding via .tabViewCustomization(_:) and the framework writes per-user customizations as the user drags or hides tabs.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — drag tabs / sections to reorder") {
                    VStack(alignment: .leading, spacing: 12) {
                        tvDemoCard(api: ".tabViewCustomization($customization) — drag tabs / sections to reorder") {
                            TabView {
                                Tab("Home", systemImage: "house") { pane("Home") }
                                    .customizationID("swiftkit.demo.home")
                                Tab("Reports", systemImage: "chart.bar") { pane("Reports") }
                                    .customizationID("swiftkit.demo.reports")
                                TabSection("Categories") {
                                    Tab("Climate", systemImage: "fan") { pane("Climate") }
                                        .customizationID("swiftkit.demo.climate")
                                    Tab("Lights", systemImage: "lightbulb") { pane("Lights") }
                                        .customizationID("swiftkit.demo.lights")
                                }
                                .customizationID("swiftkit.demo.browse")
                            }
                            .tabViewStyle(.sidebarAdaptable)
                            .tabViewCustomization($customization)
                        }
                        HStack(spacing: 8) {
                            Button("Reset section order") { customization.resetSectionOrder() }
                            Button("Reset visibility")    { customization.resetVisibility() }
                            Button("Replace") { customization = TabViewCustomization() }
                            Spacer()
                        }
                    }
                }

                tvVariantBlock(title: "init() — fresh customization") {
                    APICallout("var customization = TabViewCustomization()  // empty — no overrides yet")
                }

                tvVariantBlock(title: "@AppStorage persistence") {
                    APICallout("@AppStorage(\"tabCustomization\") private var customization: TabViewCustomization")
                    Text("Codable conformance lets the customization round-trip through @AppStorage. The first launch starts empty; subsequent launches honor any reordering or visibility changes the user made.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                tvVariantBlock(title: "Reset methods") {
                    VStack(alignment: .leading, spacing: 6) {
                        APICallout("customization.resetSectionOrder()         // restore declared section order")
                        APICallout("customization.resetSectionOrder(for: id)  // restore one section's order")
                        APICallout("customization.resetVisibility()           // restore default tab visibility")
                    }
                }

                tvVariantBlock(title: "Subscripts — read or write per-tab / per-section records directly") {
                    VStack(alignment: .leading, spacing: 6) {
                        APICallout("customization[sectionID: \"swiftkit.demo.browse\"] // SectionCustomization?")
                        APICallout("customization[tab: tab]                            // TabCustomization")
                        APICallout("customization[sidebarVisibility: tab]              // Visibility")
                    }
                }
            }
        }
    }

    // MARK: View/tabViewCustomization(_:)

    private var tabViewCustomizationModifierSection: some View {
        PageSection("View/tabViewCustomization(_:)",
                    subtitle: "Modifier \u{00b7} macOS 15.0+ \u{00b7} only .sidebarAdaptable enables customization") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Specifies the customizations to apply to the sidebar representation of a TabView. The signature accepts Binding<TabViewCustomization>?. Pass nil for a read-only sidebar.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — drag tabs / sections to reorder") {
                    VStack(alignment: .leading, spacing: 12) {
                        tvDemoCard(api: ".tabViewCustomization($customization) — drag tabs / sections to reorder") {
                            TabView {
                                Tab("Home", systemImage: "house") { pane("Home") }
                                    .customizationID("swiftkit.demo.modifier.home")
                                Tab("Reports", systemImage: "chart.bar") { pane("Reports") }
                                    .customizationID("swiftkit.demo.modifier.reports")
                                TabSection("Categories") {
                                    Tab("Climate", systemImage: "fan") { pane("Climate") }
                                        .customizationID("swiftkit.demo.modifier.climate")
                                    Tab("Lights",  systemImage: "lightbulb") { pane("Lights") }
                                        .customizationID("swiftkit.demo.modifier.lights")
                                }
                                .customizationID("swiftkit.demo.modifier.browse")
                            }
                            .tabViewStyle(.sidebarAdaptable)
                            .tabViewCustomization($modifierCustomization)
                        }
                        HStack(spacing: 8) {
                            Button("Reset section order") { modifierCustomization.resetSectionOrder() }
                            Button("Reset visibility")    { modifierCustomization.resetVisibility() }
                            Spacer()
                        }
                    }
                }

                tvVariantBlock(title: "Pass nil — no customization (read-only TabView)") {
                    APICallout(".tabViewCustomization(nil)  // disables drag-reorder, no persistence")
                }

                tvVariantBlock(title: "Bind directly to @AppStorage") {
                    APICallout("@AppStorage(\"tabCustomization\") private var customization: TabViewCustomization")
                    APICallout(".tabViewCustomization($customization)")
                }

                tvVariantBlock(title: "Without .sidebarAdaptable — modifier is a no-op") {
                    tvDemoCard(api: ".tabViewCustomization($customization) on .automatic — no reordering UI") {
                        TabView {
                            Tab("Home",   systemImage: "house")        { pane("Home") }
                            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
                        }
                        .tabViewStyle(.automatic)
                        .tabViewCustomization($modifierCustomization)
                    }
                }

                APICallout("modifierCustomization.resetSectionOrder() / resetVisibility()")
            }
        }
    }

    // MARK: TabCustomizationBehavior

    private var tabCustomizationBehaviorSection: some View {
        PageSection("TabCustomizationBehavior",
                    subtitle: "enum TabCustomizationBehavior \u{00b7} macOS 15.0+ \u{00b7} .automatic / .disabled / .reorderable") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The customization behavior of customizable tab view content. Three documented type properties: .automatic (system default — currently equivalent to .reorderable), .disabled (opt out of customization), .reorderable (explicit opt in). Apply via TabContent/customizationBehavior(_:for:) on a Tab or TabSection.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — sidebarAdaptable + customization binding") {
                    tvDemoCard(api: "TabView { Tab(...).customizationID(\"…\") } .tabViewCustomization($customization)") {
                        TabView {
                            Tab("Home", systemImage: "house") { pane("Home") }
                                .customizationID("swiftkit.tcb.home")
                            Tab("Reports", systemImage: "chart.bar") { pane("Reports") }
                                .customizationID("swiftkit.tcb.reports")
                            Tab("Settings", systemImage: "gear") { pane("Settings") }
                                .customizationID("swiftkit.tcb.settings")
                        }
                        .tabViewStyle(.sidebarAdaptable)
                        .tabViewCustomization($behaviorCustomization)
                    }
                }

                Text("TabCustomizationBehavior is documented as macOS 15+, but its companion modifier `customizationBehavior(_:for:)` and the `AdaptableTabBarPlacement.sidebar` argument are surfaced as iOS / iPadOS / visionOS APIs only. On macOS the type itself is reachable; the modifier shape isn't. The cases below describe how the value is consumed on the platforms that expose the modifier.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: ".automatic") {
                    APICallout("Tab(...).customizationBehavior(.automatic, for: .sidebar)  // iOS / iPadOS / visionOS")
                    Text("System default. Currently behaves like .reorderable; future SDKs may treat it differently per platform.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                tvVariantBlock(title: ".disabled — pin a tab/section") {
                    APICallout("Tab(...).customizationBehavior(.disabled, for: .sidebar)  // iOS / iPadOS / visionOS")
                    Text("The tab or section is excluded from drag-reorder. Use for primary destinations that should always sit in their declared position (Mail's Inbox, for example).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                tvVariantBlock(title: ".reorderable") {
                    APICallout("Tab(...).customizationBehavior(.reorderable, for: .sidebar)  // iOS / iPadOS / visionOS")
                    Text("Explicitly opts the tab/section in to user-driven reordering. Equivalent to .automatic in current SDKs.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                Text("On macOS, drag-to-reorder of TabSections in the demo above is enabled by default. Per-tab customization opt-out via .disabled requires the customizationBehavior modifier, which Apple ships only on iOS / iPadOS / visionOS in the macOS 26 SDK.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                APICallout("// macOS workaround: omit .customizationID on tabs you want pinned.")
            }
        }
    }

    // MARK: View/tabViewSidebarHeader(content:)

    private var sidebarHeaderSection: some View {
        PageSection("View/tabViewSidebarHeader(content:)",
                    subtitle: "Modifier \u{00b7} macOS 15.0+ \u{00b7} scrolls with sidebar content") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Adds a custom header to the top of the sidebar in a tab view. The header scrolls with the sidebar content. Requires .tabViewStyle(.sidebarAdaptable).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — Label header") {
                    tvDemoCard(api: ".tabViewSidebarHeader { Label(\"Welcome\", systemImage: \"hand.wave\") }") {
                        sidebarTabView
                            .tabViewSidebarHeader {
                                Label("Welcome", systemImage: "hand.wave")
                                    .font(.headline)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                            }
                    }
                }

                tvVariantBlock(title: "Plain text header") {
                    tvDemoCard(api: ".tabViewSidebarHeader { Text(\"My App\").font(.headline) }") {
                        sidebarTabView
                            .tabViewSidebarHeader {
                                Text("My App")
                                    .font(.headline)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                            }
                    }
                }

                tvVariantBlock(title: "Avatar + name — common Mail-style header") {
                    tvDemoCard(api: ".tabViewSidebarHeader { HStack { Image(systemName:); Text(_) } }") {
                        sidebarTabView
                            .tabViewSidebarHeader {
                                HStack(spacing: 8) {
                                    Image(systemName: "person.crop.circle.fill")
                                        .font(.title)
                                        .foregroundStyle(.tint)
                                    VStack(alignment: .leading) {
                                        Text("Nathan Taichman")
                                            .font(.headline)
                                        Text("nathan@example.com")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                            }
                    }
                }

                Text("Header is visible only in .sidebarAdaptable. Switching to .automatic hides it without removing the modifier.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: View/tabViewSidebarFooter(content:)

    private var sidebarFooterSection: some View {
        PageSection("View/tabViewSidebarFooter(content:)",
                    subtitle: "Modifier \u{00b7} macOS 15.0+ \u{00b7} scrolls with sidebar content") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Adds a custom footer to the bottom of the sidebar in a tab view. The footer scrolls with the sidebar content (use .tabViewSidebarBottomBar for a pinned bar). Requires .tabViewStyle(.sidebarAdaptable).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — support link") {
                    tvDemoCard(api: ".tabViewSidebarFooter { Link(\"Contact support\", destination:) }") {
                        sidebarTabView
                            .tabViewSidebarFooter {
                                Link("Contact support", destination: URL(string: "https://example.com/support")!)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                                    .font(.caption)
                            }
                    }
                }

                tvVariantBlock(title: "Inline link") {
                    tvDemoCard(api: ".tabViewSidebarFooter { Link(_, destination:) }") {
                        sidebarTabView
                            .tabViewSidebarFooter {
                                Link("Help & feedback", destination: URL(string: "https://example.com/help")!)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                                    .font(.caption)
                            }
                    }
                }

                tvVariantBlock(title: "Storage indicator — text + ProgressView") {
                    tvDemoCard(api: ".tabViewSidebarFooter { VStack { Text(\"Storage\"); ProgressView(value:) } }") {
                        sidebarTabView
                            .tabViewSidebarFooter {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("iCloud Storage")
                                        .font(.caption)
                                    ProgressView(value: 0.72)
                                    Text("36 GB of 50 GB used")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                            }
                    }
                }

                Text("Footer is visible only in .sidebarAdaptable. Other styles drop it silently.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: View/tabViewSidebarBottomBar(content:)

    private var sidebarBottomBarSection: some View {
        PageSection("View/tabViewSidebarBottomBar(content:)",
                    subtitle: "Modifier \u{00b7} macOS 15.0+ \u{00b7} pinned to floor of sidebar (does not scroll)") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Pins a custom bottom bar to the floor of the sidebar in a tab view. Unlike .tabViewSidebarFooter (which scrolls), the bottom bar stays anchored regardless of scroll position. Requires .tabViewStyle(.sidebarAdaptable).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                tvVariantBlock(title: "Default — single account button") {
                    tvDemoCard(api: ".tabViewSidebarBottomBar { Button(\"Account\", systemImage: \"person.crop.circle\") { … } }") {
                        sidebarTabView
                            .tabViewSidebarBottomBar {
                                Button("Account", systemImage: "person.crop.circle") { }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 8)
                            }
                    }
                }

                tvVariantBlock(title: "Toolbar of multiple controls") {
                    tvDemoCard(api: ".tabViewSidebarBottomBar { HStack { Button(...); Button(...); Button(...) } }") {
                        sidebarTabView
                            .tabViewSidebarBottomBar {
                                HStack(spacing: 4) {
                                    Button("", systemImage: "plus") { }
                                    Button("", systemImage: "gear") { }
                                    Spacer()
                                    Button("", systemImage: "person.crop.circle") { }
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 8)
                            }
                    }
                }

                Text("Bottom bar is visible only in .sidebarAdaptable. Other styles drop it silently.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Helpers — sidebar TabView shared across header/footer/bottom-bar demos

    private var sidebarTabView: some View {
        TabView {
            Tab("Home",   systemImage: "house")        { pane("Home") }
            Tab("Alerts", systemImage: "bell")         { pane("Alerts") }
            Tab("Browse", systemImage: "list.bullet")  { pane("Browse") }
        }
        .tabViewStyle(.sidebarAdaptable)
    }

    private func pane(_ title: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "rectangle.stack")
                .font(.system(size: 32))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes (consolidated)

    private struct TVNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TVNote] = [
        // TabView core
        .init(title: "Tab is the modern child type; .tabItem(_:) is the legacy iOS path.",
              detail: "On macOS 15+, populate TabView with Tab views (init forms cover string + symbol/image, view-builder labels, optional value, optional role). The pre-iOS-18 pattern of attaching .tabItem(_:) to arbitrary views is iOS-only and not surfaced here.",
              symbol: "rectangle.stack"),
        .init(title: "Two initializers — uncontrolled and bound.",
              detail: "init(content:) lets the framework own the selection. init(selection:content:) takes a Binding<SelectionValue: Hashable>; pair each Tab's `value:` with a case from your enum (or any Hashable).",
              symbol: "switch.2"),
        .init(title: "macOS styles — .automatic and .sidebarAdaptable are the documented options.",
              detail: ".tabViewStyle(.automatic) renders the system default. .tabViewStyle(.sidebarAdaptable) collapses the tabs into a sidebar (the macOS Mail / Photos look). .page is iOS-only on macOS — it doesn't render the swipe-paged carousel here.",
              symbol: "paintbrush"),
        .init(title: "TabSection groups tabs in the sidebar form.",
              detail: "Wrap Tabs in a TabSection to give them a header in the sidebar style. Sections do nothing in the default style — they're a sidebar-only grouping construct.",
              symbol: "folder"),
        .init(title: "Don't compose a TabView at the app's root if you have a sidebar app.",
              detail: "SwiftKit itself uses NavigationSplitView at the WindowGroup root; TabView is best for self-contained sub-navigation. If your top-level UI is sidebar + detail, prefer NavigationSplitView and reserve TabView for nested switching.",
              symbol: "exclamationmark.triangle"),
        // TabContent
        .init(title: "Five conforming types — Tab, TabSection, ForEach, Group, AnyTabContent.",
              detail: "Tab is the canonical leaf. TabSection is the grouping container. ForEach and Group come from SwiftUI's standard builders. AnyTabContent is the type-erased wrapper for heterogeneous storage.",
              symbol: "rectangle.stack.fill"),
        .init(title: "TabContent modifier surface mirrors View — but specific to tab content.",
              detail: ".badge, .customizationID, .customizationBehavior, .defaultVisibility, .tabPlacement, .sectionActions, .draggable, .dropDestination, .accessibility*, .popover, .swipeActions, .springLoadingBehavior, .hidden, .disabled, .contextMenu — see Apple's Topics → Instance Methods for the full list.",
              symbol: "wand.and.stars"),
        .init(title: "TabContent is main-actor-isolated by default.",
              detail: "Declaring TabContent conformance in a type's base declaration (rather than in an extension) inherits @preconcurrency @MainActor isolation. Declare in an extension to opt out.",
              symbol: "circle.dashed"),
        .init(title: "TabContent vs View — they are not interchangeable.",
              detail: "TabContent isn't a View; you can't drop a Tab into a VStack or apply View modifiers to it directly. Likewise, plain Views inside a TabView's content closure won't be treated as tabs — wrap them in Tab.",
              symbol: "exclamationmark.triangle.fill"),
        .init(title: "TabContent is generic over a TabValue (Hashable).",
              detail: "A TabContent's TabValue associated type pins the selection type. Inside one builder all tab content must share the same TabValue. Type erasure (AnyTabContent) is the escape hatch for runtime composition.",
              symbol: "shuffle"),
        // TabContentBuilder
        .init(title: "TabContentBuilder is implicit — no @TabContentBuilder annotations needed.",
              detail: "TabView(selection:content:) declares @TabContentBuilder<SelectionValue> on its content closure. You just write Tab / TabSection / ForEach / Group inside the closure and the compiler does the rest.",
              symbol: "wand.and.rays"),
        .init(title: "Builder supports up to ten direct children.",
              detail: "buildBlock has overloads for 1…10 Tabs. For more, wrap subgroups in TabSection or Group — the builder treats them as composite TabContent values.",
              symbol: "list.number"),
        .init(title: "Conditional + ForEach via the standard buildIf / buildEither helpers.",
              detail: "Same idioms as ViewBuilder: if / else branches, switch over an enum, ForEach over Identifiable / RandomAccessCollection. Each branch must produce TabContent of the same TabValue.",
              symbol: "arrow.triangle.branch"),
        // TabViewCustomization
        .init(title: "TabViewCustomization stores user reordering / visibility for sidebar tabs.",
              detail: "Pass a binding to .tabViewCustomization(_:); the framework writes per-user customizations into the value as the user drags or hides tabs in the sidebar.",
              symbol: "rectangle.3.group"),
        .init(title: "TabViewCustomization is Codable — pair with @AppStorage to persist across launches.",
              detail: "Encodable + Decodable conformance means @AppStorage(\"…\") private var customization: TabViewCustomization works directly. Round-tripping via JSONEncoder also works for custom storage.",
              symbol: "externaldrive"),
        .init(title: "All reorderable nodes need a .customizationID.",
              detail: "Apply .customizationID(\"…\") on every Tab and TabSection that should be reorderable. Without an ID the framework can't track that node across reorderings — its customization is silently dropped.",
              symbol: "number"),
        .init(title: "macOS surfaces section reordering only by default.",
              detail: "Apple's docs note that on macOS, the default interaction lets users reorder sections but not toggle individual tab visibility. To expose visibility toggles on macOS, you build a custom UI and write the visibility through the customization's subscripts.",
              symbol: "macwindow"),
        .init(title: "Reset methods restore the declared defaults.",
              detail: "resetSectionOrder() (or per-section resetSectionOrder(for:)) clears the user's reordering and reverts to the order in the TabView builder. resetVisibility() restores the default tab visibility set by .defaultVisibility(_:for:).",
              symbol: "arrow.uturn.backward"),
        // tabViewCustomization modifier
        .init(title: ".tabViewCustomization is a no-op outside .sidebarAdaptable.",
              detail: "Apple's docs are explicit: customization is wired up only when the TabView's style is .sidebarAdaptable. The modifier compiles in any style but does nothing without the sidebar layout.",
              symbol: "sidebar.left"),
        .init(title: "Pass nil to .tabViewCustomization to disable customization entirely.",
              detail: "The signature accepts Binding<TabViewCustomization>?. Pass nil (or omit the modifier) for a read-only sidebar TabView with no drag-to-reorder affordance.",
              symbol: "lock"),
        .init(title: "Pair .tabViewCustomization with .defaultVisibility(_:for:) for initial state.",
              detail: "Use TabContent's .defaultVisibility(_:for:) to declare a tab's starting visibility (typically for the .sidebar placement). The TabViewCustomization records subsequent user overrides.",
              symbol: "eye"),
        // TabCustomizationBehavior
        .init(title: "TabCustomizationBehavior — three cases, .automatic / .disabled / .reorderable.",
              detail: ".automatic delegates to system defaults. .disabled excludes a tab/section from customization. .reorderable explicitly opts in. The cases are reachable on macOS even though the consuming modifier currently isn't.",
              symbol: "switch.2"),
        .init(title: "macOS 26 SDK does not expose .customizationBehavior(_:for:) or AdaptableTabBarPlacement.sidebar.",
              detail: "TabCustomizationBehavior the type ships on macOS 15+, but the companion modifier and the sidebar placement constant Apple's docs reference are marked unavailable on macOS in the 26 SDK. To pin a tab on macOS, omit .customizationID on it — section reordering is still allowed for the others.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Apply customizationBehavior per AdaptableTabBarPlacement (where supported).",
              detail: "On platforms that surface the modifier (iOS, iPadOS, visionOS), the second argument is an AdaptableTabBarPlacement (almost always .sidebar). The behavior is scoped to that placement; other placements get the system default.",
              symbol: "rectangle.split.3x1"),
        .init(title: "customizationBehavior requires .tabViewCustomization to take effect.",
              detail: "Without a TabViewCustomization binding on the parent TabView, there's no customization to apply behavior to. The modifier becomes a silent no-op even on platforms where it's available.",
              symbol: "link"),
        // Sidebar header / footer / bottom bar
        .init(title: "Sidebar accessories render only in .sidebarAdaptable.",
              detail: "The .tabViewSidebarHeader, .tabViewSidebarFooter, and .tabViewSidebarBottomBar modifiers compile in any TabView context but their content surfaces only when the tab view adopts the sidebar layout.",
              symbol: "sidebar.left"),
        .init(title: "Header and footer scroll; bottom bar is pinned.",
              detail: ".tabViewSidebarHeader scrolls at the top with the sidebar content. .tabViewSidebarFooter scrolls at the bottom. .tabViewSidebarBottomBar pins to the floor of the sidebar regardless of scroll position. The three modifiers compose freely on the same TabView.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Common bottom-bar contents — account button, settings shortcut, status indicator.",
              detail: "Apple's example is an account button. Mail-style apps put account switchers there; sketch tools sometimes pin a tool palette.",
              symbol: "person.crop.circle"),
        .init(title: "Header is a free-form view builder.",
              detail: "Pass anything — Label, HStack, custom logos, settings shortcuts. Apple's example uses a welcome message; Mail uses an avatar + account name; Notes uses an iCloud account picker.",
              symbol: "rectangle.dashed"),
        .init(title: "Footer is for support links, account info, storage usage, etc.",
              detail: "Apple's example is a contact-support link. Mail uses footers for storage indicators, Notes for account pickers — quiet auxiliary content that augments the navigation tree.",
              symbol: "info.circle")
    ]

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints across the TabView family.") {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(notes, id: \.title) { note in
                    VStack(alignment: .leading, spacing: 4) {
                        Label(note.title, systemImage: note.symbol)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(note.detail)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .padding(.leading, 24)
                    }
                }
            }
        }
    }

    // MARK: View helpers (file-private style)

    private func tvDemoCard<Content: View>(
        api: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: tvDemoFrameWidth, height: tvDemoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private func tvVariantBlock<Content: View>(
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
}

extension TabViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.tabView",
        title: "TabView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "AdaptableTabBarPlacement",
            "AnyTabContent",
            "Enhancing your app content with tab navigation",
            "EnvironmentValues/isTabBarShowingSections",
            "EnvironmentValues/tabBarPlacement",
            "Tab",
            "TabBarMinimizeBehavior",
            "TabBarPlacement",
            "TabContent",
            "TabContentBuilder",
            "TabCustomizationBehavior",
            "TabPlacement",
            "TabRole",
            "TabSection",
            "TabView",
            "TabViewBottomAccessoryPlacement",
            "TabViewCustomization",
            "View/defaultAdaptableTabBarPlacement(_:)",
            "View/sectionActions(content:)",
            "View/tabItem(_:)",
            "View/tabViewCustomization(_:)",
            "View/tabViewSidebarBottomBar(content:)",
            "View/tabViewSidebarFooter(content:)",
            "View/tabViewSidebarHeader(content:)",
            "View/tabViewStyle(_:)"
        ],
        blurb: "The TabView family: the container plus its Tab / TabSection / TabContent builders, TabViewCustomization for persisted user reordering, and the placement / behavior enums (TabRole, TabPlacement, AdaptableTabBarPlacement, TabBarMinimizeBehavior, TabViewBottomAccessoryPlacement) that drive sidebar-tab and tab-bar surfaces across macOS and iPadOS.",
        signature: "TabView \u{00b7} Tab \u{00b7} TabSection \u{00b7} TabContent \u{00b7} TabViewCustomization \u{00b7} TabRole \u{00b7} TabPlacement \u{00b7} AdaptableTabBarPlacement \u{00b7} TabBarMinimizeBehavior \u{00b7} TabViewBottomAccessoryPlacement",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/tabview.md",
        page: { AnyView(TabViewGalleryPage()) }
    )
}

#Preview {
    TabViewGalleryPage()
        .frame(width: 1200, height: 1600)
}
