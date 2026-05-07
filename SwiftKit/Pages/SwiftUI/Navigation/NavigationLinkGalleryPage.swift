import SwiftUI

// SwiftUI `NavigationLink` reference page.
// Source: Documentation/SwiftUI/navigation/navigationlink.md
// macOS 10.15+. Four documented initializers:
//   init(_:destination:)        — string label, inline destination view (legacy form)
//   init(destination:label:)    — view-builder label, inline destination view (legacy form)
//   init(_:value:)              — string label, value-based (modern; macOS 13+ pattern)
//   init(value:label:)          — view-builder label, value-based (modern; macOS 13+ pattern)
// The value-based forms pair with .navigationDestination(for:destination:) on the
// enclosing NavigationStack or NavigationSplitView. Each demo is framed in a
// fixed container so embedded navigation containers don't blow up the host scroll view.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 300

private struct ColorChip: Identifiable, Hashable {
    let name: String
    let color: Color
    var id: String { name }
}

private let chips: [ColorChip] = [
    ColorChip(name: "Mint",   color: .mint),
    ColorChip(name: "Pink",   color: .pink),
    ColorChip(name: "Teal",   color: .teal),
    ColorChip(name: "Indigo", color: .indigo),
    ColorChip(name: "Yellow", color: .yellow)
]

private struct Mailbox: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let mailboxes: [Mailbox] = [
    Mailbox(name: "Inbox",     symbol: "tray"),
    Mailbox(name: "Sent",      symbol: "paperplane"),
    Mailbox(name: "Drafts",    symbol: "doc.text"),
    Mailbox(name: "Archive",   symbol: "archivebox")
]

struct NavigationLinkGalleryPage: View {
    @State private var splitSelection: ColorChip?
    @State private var stackPath: [ColorChip] = []

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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NavigationLink")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that controls a navigation presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationlink.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "NavigationLink(chip.name, value: chip) // paired with .navigationDestination") {
            NavigationStack {
                List(chips) { chip in
                    NavigationLink(chip.name, value: chip)
                }
                .navigationDestination(for: ColorChip.self) { chip in
                    chipDetail(chip)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Value-based, string label — init(_:value:)") {
                DemoCard(api: "NavigationLink(\"Mint\", value: chip)") {
                    NavigationStack {
                        List(chips) { chip in
                            NavigationLink(chip.name, value: chip)
                        }
                        .navigationDestination(for: ColorChip.self) { chip in
                            chipDetail(chip)
                        }
                    }
                }
            }

            VariantBlock(title: "Value-based, view-builder label — init(value:label:)") {
                DemoCard(api: "NavigationLink(value: mailbox) { Label(mailbox.name, systemImage:) }") {
                    NavigationStack {
                        List(mailboxes) { mailbox in
                            NavigationLink(value: mailbox) {
                                Label(mailbox.name, systemImage: mailbox.symbol)
                            }
                        }
                        .navigationDestination(for: Mailbox.self) { mailbox in
                            mailboxDetail(mailbox)
                        }
                    }
                }
            }

            VariantBlock(title: "Legacy, string label — init(_:destination:)") {
                DemoCard(api: "NavigationLink(\"Mint\") { ChipDetail(chip:) } — destination eagerly built") {
                    NavigationStack {
                        List(chips) { chip in
                            NavigationLink(chip.name) {
                                chipDetail(chip)
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "Legacy, view-builder label — init(destination:label:)") {
                DemoCard(api: "NavigationLink { MailboxDetail(mailbox:) } label: { Label(_, systemImage:) }") {
                    NavigationStack {
                        List(mailboxes) { mailbox in
                            NavigationLink {
                                mailboxDetail(mailbox)
                            } label: {
                                Label(mailbox.name, systemImage: mailbox.symbol)
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "Inside NavigationSplitView — coordinates with List(selection:)") {
                DemoCard(api: "NavigationSplitView { List(_:selection:) { NavigationLink(value:) } } detail: { … }",
                         height: 320) {
                    NavigationSplitView {
                        List(chips, selection: $splitSelection) { chip in
                            NavigationLink(chip.name, value: chip)
                        }
                    } detail: {
                        if let chip = splitSelection {
                            chipDetail(chip)
                        } else {
                            placeholder("Pick a color")
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Disabled link") {
                DemoCard(api: "NavigationLink(\"Mint\", value: chip).disabled(true)") {
                    NavigationStack {
                        List {
                            NavigationLink("Mint (enabled)", value: chips[0])
                            NavigationLink("Pink (disabled)", value: chips[1])
                                .disabled(true)
                            NavigationLink("Teal (enabled)", value: chips[2])
                        }
                        .navigationDestination(for: ColorChip.self) { chip in
                            chipDetail(chip)
                        }
                    }
                }
            }

            VariantBlock(title: "Programmatic push — append to a bound path") {
                DemoCard(api: "stackPath.append(chip) — equivalent to tapping a NavigationLink(value: chip)") {
                    NavigationStack(path: $stackPath) {
                        List(chips) { chip in
                            NavigationLink(chip.name, value: chip)
                        }
                        .navigationDestination(for: ColorChip.self) { chip in
                            chipDetail(chip)
                        }
                    }
                }
                HStack(spacing: 8) {
                    Button("Push Mint") { stackPath.append(chips[0]) }
                    Button("Push Pink") { stackPath.append(chips[1]) }
                    Button("Pop")       {
                        if !stackPath.isEmpty { stackPath.removeLast() }
                    }
                    Button("Pop to root") { stackPath.removeAll() }
                    Spacer()
                    Text("depth = \(stackPath.count)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Side-by-side — label content variations") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Plain text", api: "NavigationLink(\"Mint\", value:)") {
                        NavigationStack {
                            List {
                                NavigationLink("Mint", value: chips[0])
                                NavigationLink("Pink", value: chips[1])
                                NavigationLink("Teal", value: chips[2])
                            }
                            .navigationDestination(for: ColorChip.self) { chip in
                                chipDetail(chip)
                            }
                        }
                    }
                    StateColumn(label: "Label + symbol", api: "NavigationLink(value:) { Label(_, systemImage:) }") {
                        NavigationStack {
                            List {
                                ForEach(mailboxes, id: \.id) { mailbox in
                                    NavigationLink(value: mailbox) {
                                        Label(mailbox.name, systemImage: mailbox.symbol)
                                    }
                                }
                            }
                            .navigationDestination(for: Mailbox.self) { mailbox in
                                mailboxDetail(mailbox)
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct NLNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NLNote] = [
        .init(title: "Four initializers — two label forms × two routing styles.",
              detail: "Label is either a String (init(_:value:) / init(_:destination:)) or a view builder (init(value:label:) / init(destination:label:)). Routing is either value-based (paired with .navigationDestination) or destination-based (the destination view is constructed inline up front).",
              symbol: "switch.2"),
        .init(title: "Prefer the value-based form on macOS 13+.",
              detail: "init(_:value:) and init(value:label:) defer destination construction until the link actually fires, support deep-linking via a path binding, and decouple link sites from destination wiring. The legacy destination forms still work but eagerly build every destination view.",
              symbol: "checkmark.seal"),
        .init(title: "Value-based links require .navigationDestination(for:) in the enclosing container.",
              detail: "Apply .navigationDestination(for: T.self) { value in … } inside the NavigationStack (or NavigationSplitView column). Without a matching destination for the value's type, taps are silently ignored. Register one modifier per type.",
              symbol: "arrow.triangle.branch"),
        .init(title: "NavigationLink composes with Label for sidebar-style rows.",
              detail: "Pair NavigationLink with Label(_:systemImage:) to get the standard symbol-plus-text row treatment Apple uses in Mail, Notes, and System Settings. The link absorbs the row's hit area; the label provides the visual hierarchy.",
              symbol: "rectangle.lefthalf.filled.righthalf.striped.horizontal"),
        .init(title: "Inside NavigationSplitView, coordinate selection with List(selection:).",
              detail: "Bind List(selection:) to the same value type the NavigationLink emits. Selecting a row pushes via the binding; navigating back clears the selection. The detail column reads the selection to decide what to render.",
              symbol: "rectangle.split.3x1"),
        .init(title: ".disabled(_:) suppresses the link without removing it.",
              detail: "Standard SwiftUI: applying .disabled(true) on a NavigationLink renders the row in the disabled style and ignores taps. Use this for unavailable destinations rather than conditionally omitting the link.",
              symbol: "nosign"),
        .init(title: "isDetailLink(_:) is iOS-only.",
              detail: "The isDetailLink(_:) modifier exists on the documentation but only affects iPad split views. macOS NavigationSplitView has no analogous concept — selections in the leading column always drive the detail column.",
              symbol: "iphone")
    ]

    @ViewBuilder
    private var notesContent: some View {
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

    // MARK: Detail builders (trivial composition only)

    private func chipDetail(_ chip: ColorChip) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(chip.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            RoundedRectangle(cornerRadius: 8)
                .fill(chip.color)
                .frame(height: 80)
            Text("Tap a row to push another color.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func mailboxDetail(_ mailbox: Mailbox) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(mailbox.name, systemImage: mailbox.symbol)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Mailbox contents would render here.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func placeholder(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var width: CGFloat = demoFrameWidth
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: width, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 280, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

extension NavigationLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationLink",
        title: "NavigationLink",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationLink"
        ],
        blurb: "A view that controls a navigation presentation. People click or tap a navigation link to present a view inside a NavigationStack or NavigationSplitView.",
        signature: "struct NavigationLink<Label, Destination> where Label : View, Destination : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/navigationlink.md",
        page: { AnyView(NavigationLinkGalleryPage()) }
    )
}

#Preview {
    NavigationLinkGalleryPage()
        .frame(width: 1100, height: 900)
}
