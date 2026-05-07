import SwiftUI

// Dense SwiftUI NavigationDestination gallery — consolidates the entire family:
//   View/navigationDestination(for:destination:)         (type-driven, macOS 13.0+)
//   View/navigationDestination(isPresented:destination:) (Boolean push, macOS 13.0+)
//   View/navigationDestination(item:destination:)        (item Optional push, macOS 14.0+)
//
// Source docs:
//   Documentation/SwiftUI/navigation/navigationdestination(for:destination:).md
//   Documentation/SwiftUI/navigation/navigationdestination(ispresented:destination:).md
//   Documentation/SwiftUI/navigation/navigationdestination(item:destination:).md

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 320

private struct NDPark: Identifiable, Hashable {
    let name: String
    let state: String
    var id: String { name }
}

private struct NDTrail: Hashable {
    let name: String
    let lengthMiles: Double
}

private let parks: [NDPark] = [
    NDPark(name: "Yosemite", state: "California"),
    NDPark(name: "Zion",     state: "Utah"),
    NDPark(name: "Acadia",   state: "Maine")
]

private let trails: [NDTrail] = [
    NDTrail(name: "Mist Trail",      lengthMiles: 7.0),
    NDTrail(name: "Half Dome",       lengthMiles: 16.0)
]

// Chip data for navigationDestination(item:) (absorbed from NavigationDestinationItemPage)
private struct NDIChip: Identifiable, Hashable {
    let name: String
    let color: Color
    var id: String { name }
}

private let chips: [NDIChip] = [
    NDIChip(name: "Mint",   color: .mint),
    NDIChip(name: "Pink",   color: .pink),
    NDIChip(name: "Teal",   color: .teal),
    NDIChip(name: "Indigo", color: .indigo)
]

struct NavigationDestinationGalleryPage: View {
    // navigationDestination(isPresented:) demos
    @State private var showInbox = false
    @State private var showSent = false
    @State private var showSettings = false

    // navigationDestination(item:) demos
    @State private var stackChip: NDIChip?
    @State private var splitChip: NDIChip?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                forTypeSection
                isPresentedSection
                itemSection
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
            Text("NavigationDestination")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Associates a destination view with a presented data type, an explicit isPresented binding, or an optional bound item — the modifier wired into NavigationStack-based navigation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/  \u{00b7}  macOS 13.0+ (item: macOS 14.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".navigationDestination(for:destination:)  \u{00b7}  .navigationDestination(isPresented:destination:)  \u{00b7}  .navigationDestination(item:destination:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: navigationDestination(for:destination:)

    private var forTypeSection: some View {
        PageSection("View/navigationDestination(for:destination:)",
                    subtitle: "Type-driven routing — one modifier per Hashable type \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("NavigationLink(value:) emits a Hashable value; .navigationDestination(for: T.self) { value in … } resolves the destination. One modifier per type. Apply on a non-lazy ancestor (the stack's root List is fine).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".navigationDestination(for: NDPark.self) { park in … }") {
                    NavigationStack {
                        List(parks) { park in
                            NavigationLink(park.name, value: park)
                        }
                        .navigationDestination(for: NDPark.self) { park in
                            parkDetail(park)
                        }
                    }
                }

                VariantBlock(title: "Two types — register both modifiers on the same root") {
                    DemoCard(api: ".navigationDestination(for: NDPark.self) { … }    .navigationDestination(for: NDTrail.self) { … }") {
                        NavigationStack {
                            List {
                                Section("Parks") {
                                    ForEach(parks) { park in
                                        NavigationLink(park.name, value: park)
                                    }
                                }
                                Section("Trails") {
                                    ForEach(trails, id: \.self) { trail in
                                        NavigationLink(trail.name, value: trail)
                                    }
                                }
                            }
                            .navigationDestination(for: NDPark.self) { park in
                                parkDetail(park)
                            }
                            .navigationDestination(for: NDTrail.self) { trail in
                                trailDetail(trail)
                            }
                        }
                    }
                }

                VariantBlock(title: "No destination registered — taps silently no-op") {
                    DemoCard(api: "// No .navigationDestination(for: NDTrail.self) — link does nothing") {
                        NavigationStack {
                            List(trails, id: \.self) { trail in
                                NavigationLink(trail.name, value: trail)
                            }
                            // intentionally no .navigationDestination — illustrates the silent failure
                        }
                    }
                }
            }
        }
    }

    // MARK: navigationDestination(isPresented:) (absorbed from NavigationDestinationIsPresentedPage)

    private var isPresentedSection: some View {
        PageSection("View/navigationDestination(isPresented:destination:)",
                    subtitle: "Boolean-driven push \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Programmatic single-shot push driven by a Binding<Bool>. When the bound value flips true, SwiftUI pushes the destination; setting it back to false pops. Apple recommends path bindings for general programmatic navigation; this overload is best for component-style \"button owns its own push\" use.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".navigationDestination(isPresented: $showInbox) { InboxDetail() }") {
                    NavigationStack {
                        VStack(spacing: 12) {
                            Image(systemName: "tray")
                                .font(.system(size: 48))
                                .foregroundStyle(.secondary)
                            Button("Show inbox") { showInbox = true }
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .navigationDestination(isPresented: $showInbox) {
                            ndDetail("Inbox", symbol: "tray")
                        }
                    }
                }

                HStack {
                    Text("showInbox = \(String(showInbox))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button("Reset") { showInbox = false }
                }

                VariantBlock(title: "Two destinations — separate boolean bindings") {
                    DemoCard(api: ".navigationDestination(isPresented: $showSent) { … }    .navigationDestination(isPresented: $showSettings) { … }") {
                        NavigationStack {
                            VStack(spacing: 12) {
                                Button("Open Sent")     { showSent = true }
                                Button("Open Settings") { showSettings = true }
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .navigationDestination(isPresented: $showSent) {
                                ndDetail("Sent", symbol: "paperplane")
                            }
                            .navigationDestination(isPresented: $showSettings) {
                                ndDetail("Settings", symbol: "gear")
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        Button("Push Sent")     { showSent = true }
                        Button("Pop Sent")      { showSent = false }
                        Button("Push Settings") { showSettings = true }
                        Button("Pop Settings")  { showSettings = false }
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        Text("showSent = \(String(showSent))")
                        Text("\u{00b7}").foregroundStyle(.tertiary)
                        Text("showSettings = \(String(showSettings))")
                    }
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    APICallout("Setting the binding back to false pops the destination.")
                }
            }
        }
    }

    // MARK: navigationDestination(item:) (absorbed from NavigationDestinationItemPage)

    private var itemSection: some View {
        PageSection("View/navigationDestination(item:destination:)",
                    subtitle: "Optional<Hashable> push — works in BOTH NavigationStack and NavigationSplitView \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Programmatic push driven by a Binding<Optional<T>> where T : Hashable. Setting the binding to a non-nil value pushes the destination view rendered with that value; setting it back to nil pops. Works inside NavigationStack OR NavigationSplitView (the only navigationDestination overload that does both).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".navigationDestination(item: $stackChip) { chip in ChipDetail(chip) }") {
                    NavigationStack {
                        VStack(spacing: 8) {
                            ForEach(chips) { chip in
                                Button(chip.name) { stackChip = chip }
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .navigationDestination(item: $stackChip) { chip in
                            chipDetail(chip)
                        }
                    }
                }

                HStack {
                    Text("stackChip = \(stackChip?.name ?? "nil")")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button("Reset") { stackChip = nil }
                }

                VariantBlock(title: "Inside a NavigationSplitView — Apple's reference shape") {
                    DemoCard(api: ".navigationDestination(item: $splitChip) { chip in ChipDetail(chip) }") {
                        NavigationSplitView {
                            List {
                                ForEach(chips) { chip in
                                    Button(chip.name) { splitChip = chip }
                                }
                            }
                            .navigationDestination(item: $splitChip) { chip in
                                chipDetail(chip)
                            }
                        } detail: {
                            Text("Pick a color")
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        ForEach(chips) { chip in
                            Button("Push \(chip.name)") { stackChip = chip }
                        }
                        Button("Pop (nil)") { stackChip = nil }
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        Text("stackChip = \(stackChip?.name ?? "nil")")
                        Text("\u{00b7}").foregroundStyle(.tertiary)
                        Text("splitChip = \(splitChip?.name ?? "nil")")
                    }
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    APICallout("Set the binding back to nil to pop / clear the detail column.")
                }
            }
        }
    }

    // MARK: Notes

    private struct NDNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NDNote] = [
        .init(title: "Three overloads — for: T.self, isPresented:, item:.",
              detail: "Type-based routing covers value-driven NavigationLink. The Boolean overload owns a single fixed destination. The item overload pushes a typed value optionally and is the only one that works in both NavigationStack and NavigationSplitView.",
              symbol: "switch.2"),
        .init(title: "Place inside the stack, on a non-lazy ancestor.",
              detail: "The modifier must live inside the NavigationStack's hierarchy. Don't put it on the stack itself, and don't bury it inside a List or LazyVStack — those are lazy containers and won't materialize the destination until the row scrolls into view.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Pairs with NavigationLink(_:value:) and NavigationLink(value:label:).",
              detail: "The link emits a value; the destination resolves it. Old `NavigationLink(destination:)` initializers don't go through this modifier — they construct destinations eagerly inline.",
              symbol: "link"),
        .init(title: "Stack any number of registrations.",
              detail: "Apply multiple .navigationDestination modifiers — one per type or one per logical destination. Order doesn't matter; the runtime dispatch is purely by value type.",
              symbol: "rectangle.stack"),
        .init(title: "Prefer path bindings for general programmatic navigation.",
              detail: "Apple's docs say to favor `NavigationStack(path:)` with array or NavigationPath bindings for app-wide programmatic navigation. The isPresented overload is best for self-contained components that ship with their own push behavior.",
              symbol: "list.bullet.indent"),
        .init(title: "item overload (macOS 14+) is newer than the others.",
              detail: "navigationDestination(item:destination:) shipped in iOS 17 / macOS 14, two years after the original navigationDestination overloads. macOS 13 targets need the type-based form plus a path binding to mimic the same shape.",
              symbol: "calendar")
    ]

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
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

    // MARK: Detail builders

    private func parkDetail(_ park: NDPark) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(park.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(park.state)
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func trailDetail(_ trail: NDTrail) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(trail.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("\(trail.lengthMiles, specifier: "%.1f") miles")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func ndDetail(_ title: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: symbol)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Pushed via .navigationDestination(isPresented:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func chipDetail(_ chip: NDIChip) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(chip.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            RoundedRectangle(cornerRadius: 8)
                .fill(chip.color)
                .frame(height: 80)
            Text("Pushed via .navigationDestination(item:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
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

extension NavigationDestinationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationDestination",
        title: "NavigationDestination",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/navigationDestination(for:destination:)",
            "View/navigationDestination(isPresented:destination:)",
            "View/navigationDestination(item:destination:)"
        ],
        blurb: "Associates a destination view with a presented data type, an explicit isPresented binding, or an optional bound item — the modifier wired into NavigationStack-based navigation.",
        signature: "func navigationDestination<D, C>(for data: D.Type, @ViewBuilder destination: @escaping (D) -> C) -> some View where D : Hashable, C : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationdestination(for:destination:).md",
        page: { AnyView(NavigationDestinationGalleryPage()) }
    )
}

#Preview {
    NavigationDestinationGalleryPage()
        .frame(width: 1100, height: 1400)
}
