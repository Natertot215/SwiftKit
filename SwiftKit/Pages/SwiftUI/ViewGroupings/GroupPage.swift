import SwiftUI

// Dense Group reference page. Consolidates four previously-separate leaves:
//   • Group                      (transparent grouping container)
//   • GroupElementsOfContent     (element-variant of Group; macOS 15.0+)
//   • GroupSectionsOfContent     (section-variant of Group; macOS 15.0+)
//   • GroupBox                   (visual grouping container; macOS 10.15+)
//
// Source docs:
//   Documentation/SwiftUI/view-groupings/group.md
//   Documentation/SwiftUI/view-groupings/groupelementsofcontent.md
//   Documentation/SwiftUI/view-groupings/groupsectionsofcontent.md
//   Documentation/SwiftUI/view-groupings/groupbox.md
//
// Follows TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

struct GroupPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                groupContainerSection
                groupElementsOfContentSection
                groupSectionsOfContentSection
                groupBoxSection
                higNotesSection
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
            Text("Group")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Transparent container types for grouping views \u{2014} applying shared modifiers, working around the 10-child ViewBuilder limit, and adapting to surrounding container layout (List sections, ForEach iteration). GroupBox adds a visual rounded border for non-structural grouping.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-groupings/group.md \u{00b7} macOS 10.15+  \u{00b7}  GroupElementsOfContent / GroupSectionsOfContent: macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Group  \u{00b7}  GroupElementsOfContent  \u{00b7}  GroupSectionsOfContent  \u{00b7}  GroupBox")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Group container

    private var groupContainerSection: some View {
        PageSection("Group container", subtitle: "struct Group \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Group is a transparent container \u{2014} it adds no layout or visual chrome. Its two uses are: (1) applying a modifier to multiple siblings at once, and (2) working around SwiftUI’s 10-child ViewBuilder limit by nesting children inside a Group.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("init(@ViewBuilder content: () -> Content)")
                    APICallout("init(_ subviewsOf: some View, transform: (SubviewsCollection) -> Content)")
                    APICallout("init(sections subviewsOf: some View, transform: (SectionCollection) -> Content)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} shared modifier across children")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Group {
                        Text("First item in the group")
                        Text("Second item in the group")
                        Text("Third item in the group")
                    }
                    .foregroundStyle(.secondary)
                    .font(.callout)
                    APICallout(
"""
Group {
    Text("First item in the group")
    Text("Second item in the group")
    Text("Third item in the group")
}
.foregroundStyle(.secondary)
.font(.callout)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("10-child limit workaround")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("SwiftUI’s result builders cap direct children at 10. Wrap the overflow in a Group to reset the count.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
VStack {
    Text("1"); Text("2"); Text("3"); Text("4"); Text("5")
    Text("6"); Text("7"); Text("8"); Text("9"); Text("10")
    Group {
        Text("11"); Text("12")          // overflow nested in Group
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conditional content")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Group can wrap an if/else block so a shared modifier applies to both branches without duplicating it.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
Group {
    if isSignedIn {
        ProfileView()
    } else {
        SignInView()
    }
}
.navigationTitle("Account")     // applies to whichever branch is active
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Group is layout-neutral.",
                        detail: "Unlike VStack or HStack, Group does not impose any layout. Children stack in the parent’s coordinate space — typically vertically inside a List or Form.",
                        symbol: "square.dashed"
                    )
                    noteRow(
                        title: "Modifiers on Group apply to each child independently.",
                        detail: ".foregroundStyle(.secondary) on a Group sets each child’s foreground style separately — it doesn’t create a wrapper view. This is why Group is transparent.",
                        symbol: "arrow.down"
                    )
                }
            }
        }
    }

    // MARK: GroupElementsOfContent

    private var groupElementsOfContentSection: some View {
        PageSection("Reference \u{2014} GroupElementsOfContent", subtitle: "struct GroupElementsOfContent \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("An element-iteration variant of Group. When used as the transform target of Group.init(_ subviewsOf:transform:), it receives each subview as an individual element from the source view’s SubviewsCollection. Enables element-by-element processing of an arbitrary SwiftUI view’s children inside a custom container.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializer")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("init(_ subviewsOf: some View, transform: (SubviewsCollection) -> Content)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Usage pattern \u{2014} iterate children as elements")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct TagCloud: View {
    var body: some View {
        // Iterate each subview of the content closure as a separate element
        Group(subviewsOf: content) { subviews in
            FlowLayout {
                ForEach(subviews) { subview in
                    subview
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.tint.opacity(0.15), in: Capsule())
                }
            }
        }
    }

    @ViewBuilder var content: some View { … }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("View")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "GroupElementsOfContent is a macOS 15.0+ API.",
                        detail: "It ships alongside the Subview and SubviewsCollection machinery. Guard with #available(macOS 15, *) if the deployment target is earlier.",
                        symbol: "calendar"
                    )
                    noteRow(
                        title: "Use for custom container views that need element-level access.",
                        detail: "When building a custom container (flow layout, carousel, grid), GroupElementsOfContent lets you process each child individually rather than treating the closure as a monolithic block.",
                        symbol: "square.grid.2x2"
                    )
                }
            }
        }
    }

    // MARK: GroupSectionsOfContent

    private var groupSectionsOfContentSection: some View {
        PageSection("Reference \u{2014} GroupSectionsOfContent", subtitle: "struct GroupSectionsOfContent \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A section-iteration variant of Group. When used as the transform target of Group.init(sections:transform:), it receives each Section in the source view’s SectionCollection. Enables section-by-section processing inside a custom container that respects Section boundaries — rendering custom headers, footers, or dividers for each.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializer")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("init(sections subviewsOf: some View, transform: (SectionCollection) -> Content)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Usage pattern \u{2014} iterate children as sections")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct AccordionList: View {
    var body: some View {
        // Iterate each Section in the content closure
        Group(sectionsOf: content) { sections in
            VStack(spacing: 0) {
                ForEach(sections) { section in
                    VStack(alignment: .leading, spacing: 0) {
                        section.header           // Section header view
                        section.content          // Section body items
                    }
                }
            }
        }
    }

    @ViewBuilder var content: some View { … }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("View")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "GroupSectionsOfContent is a macOS 15.0+ API.",
                        detail: "It ships alongside SectionCollection and SectionConfiguration. Guard with #available(macOS 15, *) if needed.",
                        symbol: "calendar"
                    )
                    noteRow(
                        title: "Combine with ForEachSectionCollection for dynamic iteration.",
                        detail: "ForEachSectionCollection wraps SectionCollection to give ForEach a stable identity — use it when the sections are dynamic (data-driven). GroupSectionsOfContent works for static composition.",
                        symbol: "list.number"
                    )
                }
            }
        }
    }

    // MARK: GroupBox

    private var groupBoxSection: some View {
        PageSection("GroupBox \u{2014} visual grouping container", subtitle: "struct GroupBox \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("GroupBox renders a rounded, bordered container with system-appropriate padding. It is the correct primitive for visual grouping on macOS — use it when you want to visually demarcate a cluster of related controls without navigational semantics (which belong to Section in a List/Form).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("GroupBox(label:content:)")
                    APICallout("GroupBox(_ titleKey: LocalizedStringKey, content:)")
                    APICallout("GroupBox(content:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} with Label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    GroupBox(label: Label("Connection", systemImage: "wifi")) {
                        VStack(alignment: .leading, spacing: 6) {
                            LabeledContent("Status", value: "Connected")
                            LabeledContent("Network", value: "SwiftKit‑HQ")
                            LabeledContent("Signal", value: "Excellent")
                        }
                        .font(.callout)
                    }
                    APICallout(
"""
GroupBox(label: Label("Connection", systemImage: "wifi")) {
    LabeledContent("Status", value: "Connected")
    LabeledContent("Network", value: "SwiftKit-HQ")
    LabeledContent("Signal", value: "Excellent")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Without label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    GroupBox {
                        Text("GroupBox provides a rounded, bordered container with system padding. On macOS it uses the grouped appearance — appropriate for inspector panels, settings sections, and preference groups.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    APICallout("GroupBox { … }  // no label \u{2014} just the rounded bordered container")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With string title")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    GroupBox("Network Settings") {
                        VStack(alignment: .leading, spacing: 6) {
                            Toggle("Enable Wi-Fi", isOn: .constant(true))
                            Toggle("Enable Bluetooth", isOn: .constant(false))
                        }
                        .font(.callout)
                    }
                    APICallout(
"""
GroupBox("Network Settings") {
    Toggle("Enable Wi-Fi", isOn: $wifi)
    Toggle("Enable Bluetooth", isOn: $bluetooth)
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Nested GroupBoxes")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    GroupBox("Outer Group") {
                        GroupBox("Inner Group") {
                            Text("Nested group content.")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                    }
                    APICallout("GroupBox(\"Outer\") { GroupBox(\"Inner\") { … } }")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "GroupBox vs Section: use GroupBox for visual grouping, Section for list structure.",
                        detail: "Section in a List or Form creates navigational / layout structure. GroupBox is purely visual: it adds chrome (rounded border) but no structural meaning.",
                        symbol: "square.dashed"
                    )
                    noteRow(
                        title: "Style via .groupBoxStyle(_:).",
                        detail: "The built-in style family (GroupBoxStyle) lets you customize the container chrome. The default style on macOS renders the platform-appropriate rounded bordered box.",
                        symbol: "paintbrush"
                    )
                    noteRow(
                        title: "Use Label (not plain Text) as the GroupBox label for icon + text.",
                        detail: "GroupBox renders the label parameter as-is. Passing a Label gives you an icon + text pair at the correct optical weight matching the surrounding type.",
                        symbol: "tag"
                    )
                }
            }
        }
    }

    // MARK: Notes from the HIG

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple’s voice on grouping containers, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Group is purely structural — it has no visual footprint.",
                    detail: "Group doesn’t produce any layout or chrome. Its only contribution to the view tree is to collect children for modifier sharing or 10-child limit escape.",
                    symbol: "square.dashed"
                )
                noteRow(
                    title: "GroupBox is the macOS standard for visually demarcating control clusters.",
                    detail: "Use it in inspector panels, popover forms, and settings sheets to group related controls. The system border and padding match the macOS HIG spacing for grouped UI.",
                    symbol: "rectangle.rounded.topleft"
                )
                noteRow(
                    title: "Don’t use Group for layout — use HStack, VStack, or ZStack.",
                    detail: "Group doesn’t apply alignment or spacing. If you need the children to flow, wrap them in a layout container first.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "GroupElementsOfContent and GroupSectionsOfContent are custom-container APIs.",
                    detail: "These two types are the correct entry point for container views that need to process their children structurally (by element or section). Reach for them when building accordion lists, tag clouds, or adaptive grid layouts.",
                    symbol: "square.grid.2x2"
                )
                noteRow(
                    title: "Nesting limits: Group resets the 10-child count per level.",
                    detail: "Each Group inside a ViewBuilder closure resets the result-builder child counter. Nest as many Groups as needed — there’s no practical limit on nesting depth.",
                    symbol: "number"
                )
            }
        }
    }

    // MARK: Helpers

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

#Preview {
    GroupPage()
        .frame(width: 1100, height: 1200)
}
