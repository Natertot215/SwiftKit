import SwiftUI

// Dense Section reference page. Consolidates four previously-separate leaves:
//   • Section                   (primary section container; macOS 10.15+)
//   • SectionCollection         (collection type for sections; macOS 15.0+)
//   • SectionConfiguration      (configuration type for sections; macOS 15.0+)
//   • ForEachSectionCollection  (ForEach-driven section iteration; macOS 15.0+)
//
// Source docs:
//   Documentation/SwiftUI/view-groupings/section.md
//   Documentation/SwiftUI/view-groupings/sectioncollection.md
//   Documentation/SwiftUI/view-groupings/sectionconfiguration.md
//   Documentation/SwiftUI/view-groupings/foreachsectioncollection.md
//
// Follows TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

struct SectionPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                sectionContainerSection
                sectionCollectionSection
                sectionConfigurationSection
                forEachSectionCollectionSection
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
            Text("Section")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Container type that groups items within a list, form, or outline into named sections with optional headers and footers. The collection types (SectionCollection, SectionConfiguration, ForEachSectionCollection) support dynamic section hierarchies inside custom containers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-groupings/section.md \u{00b7} macOS 10.15+  \u{00b7}  SectionCollection / SectionConfiguration / ForEachSectionCollection: macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Section  \u{00b7}  SectionCollection  \u{00b7}  SectionConfiguration  \u{00b7}  ForEachSectionCollection")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Section container

    private var sectionContainerSection: some View {
        PageSection("Section container", subtitle: "struct Section \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Section is a container for grouping items within a parent that supports sections \u{2014} primarily List, Form, and Picker. A section may carry a header, a footer, or both. On macOS, List section headers render as sticky row separators; Form section headers appear above the grouped rows.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("Section(_ titleKey: LocalizedStringKey, @ViewBuilder content:)")
                    APICallout("Section(content:header:)")
                    APICallout("Section(content:header:footer:)")
                    APICallout("Section(@ViewBuilder content:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} Section in a List with string header")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    List {
                        Section("Favorites") {
                            Label("Swift", systemImage: "swift")
                            Label("SwiftUI", systemImage: "square.3.layers.3d")
                            Label("Xcode", systemImage: "hammer")
                        }
                        Section("Recents") {
                            Label("AppKit", systemImage: "macwindow")
                            Label("Combine", systemImage: "circle.hexagongrid")
                        }
                    }
                    .listStyle(.inset)
                    .frame(height: 200)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout(
"""
List {
    Section("Favorites") {
        Label("Swift", systemImage: "swift")
        Label("SwiftUI", systemImage: "square.3.layers.3d")
    }
    Section("Recents") {
        Label("AppKit", systemImage: "macwindow")
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Section in Form")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Form {
                        Section("Account") {
                            LabeledContent("Name", value: "Ada Lovelace")
                            LabeledContent("Email", value: "ada@apple.com")
                        }
                        Section("Preferences") {
                            Toggle("Enable notifications", isOn: .constant(true))
                            Toggle("Dark mode", isOn: .constant(false))
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 220)
                    APICallout(
"""
Form {
    Section("Account") {
        LabeledContent("Name", value: "Ada Lovelace")
    }
    Section("Preferences") {
        Toggle("Enable notifications", isOn: $enabled)
    }
}
.formStyle(.grouped)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Section with header and footer view builders")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    List {
                        Section {
                            Label("Folder 1", systemImage: "folder")
                            Label("Folder 2", systemImage: "folder.fill")
                        } header: {
                            Label("Projects", systemImage: "tray.2")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        } footer: {
                            Text("2 items")
                                .font(.caption2)
                                .foregroundStyle(.tertiary)
                        }
                    }
                    .listStyle(.inset)
                    .frame(height: 120)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout(
"""
Section {
    Label("Folder 1", systemImage: "folder")
} header: {
    Label("Projects", systemImage: "tray.2")
} footer: {
    Text("2 items")
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Section is context-sensitive.",
                        detail: "The header/footer rendering changes per parent: sticky separators in List, titled groups in Form, labeled segments in Picker. The container drives the visual treatment.",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "Section headers don't conflict with Group.",
                        detail: "Section provides structural meaning (named grouping). Group is invisible layout scaffolding. Use both when you need to group children inside a Section without adding more nesting.",
                        symbol: "square.dashed"
                    )
                }
            }
        }
    }

    // MARK: SectionCollection

    private var sectionCollectionSection: some View {
        PageSection("Reference \u{2014} SectionCollection", subtitle: "struct SectionCollection \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A random-access collection of Section values extracted from a SwiftUI view tree. Produced by Group.init(sections:transform:) or ForEachSectionCollection. SectionCollection iterates the Section boundaries in the source view, exposing each as a SectionConfiguration for introspection and rendering inside custom containers.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Key members")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("SectionCollection.Element", "SectionConfiguration \u{2014} the type produced when iterating.")
                    referenceRow("SectionCollection.Index", "Int \u{2014} zero-based index into the collection.")
                    referenceRow("startIndex / endIndex", "Standard Collection boundaries.")
                    referenceRow("subscript(index:)", "Returns the SectionConfiguration at the given index.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("API declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct SectionCollection : RandomAccessCollection {
    typealias Element = SectionConfiguration
    typealias Index   = Int

    var startIndex: Int { get }
    var endIndex:   Int { get }
    subscript(index: Int) -> SectionConfiguration { get }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Usage \u{2014} inside a custom container")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
// Group(sectionsOf:transform:) gives you the SectionCollection
Group(sectionsOf: content) { sections in
    // sections: SectionCollection — iterate like any collection
    VStack {
        ForEach(sections) { section in
            section.header      // header view (if any)
            section.content     // body views for this section
        }
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "SectionCollection is a macOS 15.0+ API.",
                        detail: "Guard with #available(macOS 15, *) if deployment target is earlier.",
                        symbol: "calendar"
                    )
                    noteRow(
                        title: "SectionCollection is read-only.",
                        detail: "It reflects the sections in the source view. You iterate and render; you cannot mutate the collection.",
                        symbol: "lock"
                    )
                }
            }
        }
    }

    // MARK: SectionConfiguration

    private var sectionConfigurationSection: some View {
        PageSection("Reference \u{2014} SectionConfiguration", subtitle: "struct SectionConfiguration \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Carries the data for a single Section as presented to a custom container via SectionCollection. Contains type-erased header, footer, and content views. Custom containers read these to compose their own section chrome around the original Section's content.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("section.header", "SectionConfiguration.Header? \u{2014} type-erased header view, or nil if the Section has none.")
                    referenceRow("section.footer", "SectionConfiguration.Footer? \u{2014} type-erased footer view, or nil if the Section has none.")
                    referenceRow("section.content", "SectionConfiguration.Content \u{2014} type-erased view containing the Section's body children.")
                    referenceRow("section.id", "AnyHashable \u{2014} a stable identifier for this section (backed by the Section's identity).")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("API declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct SectionConfiguration : Identifiable {
    var id:      AnyHashable                  { get }
    var header:  SectionConfiguration.Header? { get }
    var footer:  SectionConfiguration.Footer? { get }
    var content: SectionConfiguration.Content { get }

    struct Header  : View { … }   // type-erased header view
    struct Footer  : View { … }   // type-erased footer view
    struct Content : View { … }   // type-erased section body
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Reading header + content")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
ForEach(sections) { section in
    VStack(alignment: .leading, spacing: 0) {
        if let header = section.header {
            header
                .font(.footnote.weight(.semibold))
                .padding(.bottom, 4)
        }
        section.content
        if let footer = section.footer {
            footer
                .font(.footnote)
                .foregroundStyle(.tertiary)
        }
    }
    .padding(.vertical, 8)
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "SectionConfiguration is always produced by a SectionCollection iteration.",
                        detail: "You never instantiate SectionConfiguration directly. You receive it when iterating SectionCollection or ForEachSectionCollection.",
                        symbol: "arrow.right.circle"
                    )
                    noteRow(
                        title: "header and footer are Optional.",
                        detail: "If the original Section was created without a header or footer, those properties are nil. Always unwrap before rendering.",
                        symbol: "questionmark.circle"
                    )
                }
            }
        }
    }

    // MARK: ForEachSectionCollection

    private var forEachSectionCollectionSection: some View {
        PageSection("Reference \u{2014} ForEachSectionCollection", subtitle: "struct ForEachSectionCollection \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A ForEach variant that iterates a SectionCollection with stable identity \u{2014} suitable for use inside custom container views that need data-driven section iteration. Functionally equivalent to ForEach over SectionCollection, but the type is optimized for section-identity tracking.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializer")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("ForEachSectionCollection(_ sections: SectionCollection, content:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Usage pattern")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct AccordionContainer<C: View>: View {
    @ViewBuilder var content: C

    var body: some View {
        Group(sectionsOf: content) { sections in
            VStack(spacing: 1) {
                ForEachSectionCollection(sections) { section in
                    DisclosureGroup {
                        section.content
                    } label: {
                        section.header ?? Text("Section")
                    }
                }
            }
        }
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("View, DynamicViewContent")
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
                        title: "Prefer ForEachSectionCollection over plain ForEach for section iteration.",
                        detail: "ForEachSectionCollection handles section identity for SwiftUI's diffing engine. ForEach(sections) also works but ForEachSectionCollection is the canonical pattern.",
                        symbol: "checkmark.circle"
                    )
                    noteRow(
                        title: "ForEachSectionCollection is a macOS 15.0+ API.",
                        detail: "Ships alongside SectionCollection and SectionConfiguration. Use #available(macOS 15, *) guard when needed.",
                        symbol: "calendar"
                    )
                }
            }
        }
    }

    // MARK: Notes from the HIG

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on Section, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Use Section to establish visual hierarchy within lists and forms.",
                    detail: "Section groups related rows under a meaningful header. On macOS, List renders headers as sticky separators; Form renders them as grouped section titles. Both patterns communicate structure at a glance.",
                    symbol: "text.insert"
                )
                noteRow(
                    title: "Section headers should be brief and descriptive.",
                    detail: "Section headers are labels, not descriptions. Short noun phrases ('Account', 'Preferences', 'Recent') work better than sentences.",
                    symbol: "text.quote"
                )
                noteRow(
                    title: "Don't nest Sections — nest Lists or Forms instead.",
                    detail: "Section is not a recursive container. For nested hierarchies, use NavigationSplitView, OutlineGroup, or DisclosureGroup.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "SectionCollection / SectionConfiguration / ForEachSectionCollection are for custom container views.",
                    detail: "These macOS 15+ types are plumbing for building your own list/form-like containers. For standard use cases, just use Section inside List or Form.",
                    symbol: "wrench.and.screwdriver"
                )
                noteRow(
                    title: "Section inside Picker groups options visually.",
                    detail: "A Section in a Picker adds a divider between groups of options. Use sparingly — Picker items should form a short, cohesive set.",
                    symbol: "list.bullet"
                )
            }
        }
    }

    // MARK: Helpers

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 240, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
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

#Preview {
    SectionPage()
        .frame(width: 1100, height: 1200)
}
