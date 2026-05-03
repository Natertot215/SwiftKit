import SwiftUI

// SwiftUI `View/navigationDestination(isPresented:destination:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationdestination(ispresented:destination:).md
// macOS 13.0+. Programmatic single-shot push driven by a Binding<Bool>.
// When the bound value flips true, SwiftUI pushes the destination. Setting it
// back to false pops the destination. Apple recommends preferring path bindings
// for general programmatic navigation; this overload is for component-style
// "build a button that owns its own push" use.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 320

struct NavigationDestinationIsPresentedPage: View {
    @State private var showInbox = false
    @State private var showSent = false
    @State private var showSettings = false

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
            Text("View/navigationDestination(isPresented:destination:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Associates a destination view with a binding that can be used to push the view onto a NavigationStack.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationdestination(ispresented:destination:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
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
                        detail("Inbox", symbol: "tray")
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
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
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
                            detail("Sent", symbol: "paperplane")
                        }
                        .navigationDestination(isPresented: $showSettings) {
                            detail("Settings", symbol: "gear")
                        }
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
                Button("Push Sent")        { showSent = true }
                Button("Pop Sent")         { showSent = false }
                Button("Push Settings")    { showSettings = true }
                Button("Pop Settings")     { showSettings = false }
                Spacer()
            }
            HStack(spacing: 16) {
                Text("showSent = \(String(showSent))")
                Text("·").foregroundStyle(.tertiary)
                Text("showSettings = \(String(showSettings))")
            }
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
            APICallout("Setting the binding back to false pops the destination.")
        }
    }

    private func detail(_ title: String, symbol: String) -> some View {
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

    // MARK: Notes

    private struct NDPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NDPNote] = [
        .init(title: "One binding → one destination → one push.",
              detail: "This overload owns a single destination view tied to a Boolean. When `isPresented` flips to true the destination pushes; setting it back to false pops. Useful for buttons that should own their own push.",
              symbol: "switch.2"),
        .init(title: "Apply inside the stack on a non-lazy ancestor.",
              detail: "Same rule as the type-based overload — don't bury it inside List or LazyVStack. Attach it to a stable container like a VStack or directly on a leaf view.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Prefer path bindings for general programmatic navigation.",
              detail: "Apple's docs say to favor `NavigationStack(path:)` with array or NavigationPath bindings for app-wide programmatic navigation. The isPresented overload is best for self-contained components that ship with their own push behavior.",
              symbol: "list.bullet.indent"),
        .init(title: "Stack multiple — one per logical destination.",
              detail: "You can register several .navigationDestination(isPresented:) modifiers on the same view, each owning its own boolean. They don't interact — flipping one pushes its destination independently.",
              symbol: "rectangle.stack"),
        .init(title: "Sibling overloads — for: T.self and item: Binding<Optional<T>>.",
              detail: "Use the type-based overload when a value drives the push. Use the item overload to push a typed value optionally. The boolean overload is the lowest-level — destination is fixed at the call site.",
              symbol: "ellipsis.circle")
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
    NavigationDestinationIsPresentedPage()
        .frame(width: 1100, height: 900)
}
