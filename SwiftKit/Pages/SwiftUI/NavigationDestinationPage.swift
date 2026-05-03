import SwiftUI

// SwiftUI `View/navigationDestination(for:destination:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationdestination(for:destination:).md
// macOS 13.0+. Type-erased routing inside a NavigationStack:
//   NavigationLink(value:) emits a Hashable value;
//   .navigationDestination(for: T.self) { value in … } resolves the destination.
// One modifier per type. Apply on a non-lazy ancestor (the stack's root List is fine).

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

struct NavigationDestinationPage: View {
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
            Text("View/navigationDestination(for:destination:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Associates a destination view with a presented data type for use within a navigation stack.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationdestination(for:destination:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
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
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "One destination per type") {
                DemoCard(api: ".navigationDestination(for: NDPark.self) { … }") {
                    NavigationStack {
                        List(parks) { park in
                            NavigationLink(park.name, value: park)
                        }
                        .navigationDestination(for: NDPark.self) { park in
                            parkDetail(park)
                        }
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
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pushing — value-based link fires when its value type has a registered destination") {
                DemoCard(api: "NavigationLink(\"Yosemite\", value: parks[0])") {
                    NavigationStack {
                        List {
                            ForEach(parks) { park in
                                NavigationLink(park.name, value: park)
                            }
                        }
                        .navigationDestination(for: NDPark.self) { park in
                            parkDetail(park)
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

    // MARK: Notes

    private struct NDNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NDNote] = [
        .init(title: "Type-driven routing — one modifier per Hashable type.",
              detail: "Apply .navigationDestination(for: T.self) { value in … } once per type the stack should know how to present. Stack matches incoming values to the right modifier by type.",
              symbol: "arrow.triangle.branch"),
        .init(title: "Place inside the stack, on a non-lazy ancestor.",
              detail: "The modifier must live inside the NavigationStack's hierarchy. Don't put it on the stack itself, and don't bury it inside a List or LazyVStack — those are lazy containers and won't materialize the destination until the row scrolls into view.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Pairs with NavigationLink(_:value:) and NavigationLink(value:label:).",
              detail: "The link emits a value; the destination resolves it. Old `NavigationLink(destination:)` initializers don't go through this modifier — they construct destinations eagerly inline.",
              symbol: "link"),
        .init(title: "Stack any number of registrations.",
              detail: "Apply multiple .navigationDestination modifiers — one per type. Order doesn't matter; the runtime dispatch is purely by value type.",
              symbol: "rectangle.stack"),
        .init(title: "Companion modifiers — isPresented and item bindings.",
              detail: "Two sibling overloads accept Binding<Bool> or Binding<Optional<T>>. They're for programmatic single-shot pushes rather than value-driven links. See their own pages.",
              symbol: "switch.2")
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
    NavigationDestinationPage()
        .frame(width: 1100, height: 900)
}
