import SwiftUI

// SwiftUI `View/navigationDestination(item:destination:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationdestination(item:destination:).md
// macOS 14.0+. Programmatic push driven by a Binding<Optional<T>> where T: Hashable.
// Setting the binding to a non-nil value pushes the destination view rendered with
// that value; setting it back to nil pops. Works inside NavigationStack OR
// NavigationSplitView (the only navigationDestination overload that does both).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 320

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

struct NavigationDestinationItemPage: View {
    @State private var stackChip: NDIChip?
    @State private var splitChip: NDIChip?

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
            Text("View/navigationDestination(item:destination:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Associates a destination view with a bound value for use within a navigation stack or navigation split view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationdestination(item:destination:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
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
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
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
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                ForEach(chips) { chip in
                    Button("Push \(chip.name)") { stackChip = chip }
                }
                Button("Pop (nil)") { stackChip = nil }
                Spacer()
            }
            HStack(spacing: 16) {
                Text("stackChip = \(stackChip?.name ?? "nil")")
                Text("·").foregroundStyle(.tertiary)
                Text("splitChip = \(splitChip?.name ?? "nil")")
            }
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
            APICallout("Set the binding back to nil to pop / clear the detail column.")
        }
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

    // MARK: Notes

    private struct NDINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NDINote] = [
        .init(title: "Binding<Optional<T>> drives push / pop.",
              detail: "Setting the bound value to non-nil pushes a destination rendered with that value; setting it to nil pops. The destination receives the unwrapped value as its single argument.",
              symbol: "switch.2"),
        .init(title: "Works in BOTH NavigationStack and NavigationSplitView.",
              detail: "Unlike the type-based and isPresented overloads, the item overload is documented for both NavigationStack and NavigationSplitView. In a split view it replaces the contents of the detail column.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Apply on a non-lazy ancestor.",
              detail: "Same rule as the other navigationDestination overloads: don't bury it inside List or LazyVStack. Place it on a stable container so the framework can always see the destination.",
              symbol: "exclamationmark.triangle"),
        .init(title: "macOS 14+ — newer than the type-based and isPresented overloads.",
              detail: "navigationDestination(item:destination:) shipped in iOS 17 / macOS 14, two years after the original navigationDestination overloads. macOS 13 targets need the type-based form plus a path binding to mimic the same shape.",
              symbol: "calendar"),
        .init(title: "Stacks multiple — one per logical item slot.",
              detail: "Register several .navigationDestination(item:) modifiers on different bindings — each one drives its own push independently."
              , symbol: "rectangle.stack")
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

#Preview {
    NavigationDestinationItemPage()
        .frame(width: 1100, height: 900)
}
