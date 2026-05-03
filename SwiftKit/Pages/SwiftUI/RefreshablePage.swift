import SwiftUI

// SwiftUI `View/refreshable(action:)` reference page.
// Source: Documentation/SwiftUI/lists/refreshable(action:).md
// Single API:
//   func refreshable(action: @escaping @Sendable () async -> Void) -> some View
// Adds an asynchronous handler to the @Environment(\.refresh) value.
// macOS 12.0+. Pull-to-refresh is iOS-flavored — macOS Lists do not surface
// a pull gesture; the typical macOS path is to read .refresh from the
// environment and trigger it from a toolbar/menu/button.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

private struct ManualRefreshButton: View {
    @Environment(\.refresh) private var refresh
    @State private var isRefreshing = false

    var body: some View {
        HStack(spacing: 8) {
            Button {
                Task {
                    isRefreshing = true
                    await refresh?()
                    isRefreshing = false
                }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .disabled(refresh == nil || isRefreshing)

            if isRefreshing {
                ProgressView()
                    .controlSize(.small)
            }
        }
    }
}

struct RefreshablePage: View {
    @State private var lastRefresh: Date = .now

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
            Text("refreshable(action:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds an asynchronous handler that can update the data the view displays.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/refreshable(action:).md · macOS 12.0+ (iOS-flavored gesture)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".refreshable { await mailbox.fetch() }") {
            VStack(alignment: .leading, spacing: 8) {
                List {
                    Text("Last refresh: \(lastRefresh.formatted(date: .omitted, time: .standard))")
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                .refreshable {
                    try? await Task.sleep(for: .milliseconds(600))
                    lastRefresh = .now
                }
                ManualRefreshButton()
                    .padding(.horizontal, 8)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Apply to a List — handler runs on refresh request") {
                DemoCard(api: "List(...).refreshable { await fetch() }") {
                    List(0..<5, id: \.self) { i in
                        Text("Row \(i)")
                    }
                    .refreshable {
                        try? await Task.sleep(for: .milliseconds(300))
                    }
                }
            }

            VariantBlock(title: "Read .refresh from a child view (macOS-friendly)") {
                DemoCard(api: "@Environment(\\.refresh) — call refresh?() from a Button") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("On macOS, attach .refreshable on a parent List, then call refresh() from a toolbar/menu/button in any descendant. Pull-to-refresh is iOS-flavored and not exposed on macOS.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        ManualRefreshButton()
                    }
                    .padding()
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — without vs with .refreshable") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "No .refreshable", api: "(no modifier)") {
                        VStack {
                            List(0..<3, id: \.self) { Text("Row \($0)") }
                            ManualRefreshButton().padding(.bottom, 8)
                        }
                    }
                    StateColumn(label: "With .refreshable", api: ".refreshable { … }") {
                        VStack {
                            List(0..<3, id: \.self) { Text("Row \($0)") }
                                .refreshable { try? await Task.sleep(for: .milliseconds(200)) }
                            ManualRefreshButton().padding(.bottom, 8)
                        }
                    }
                }
                Text("Notice: the Refresh button is disabled in the left column (no RefreshAction in scope) and enabled in the right column.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "iOS-flavored — no macOS pull-to-refresh gesture.",
              detail: "Per the doc: 'when you apply this modifier on iOS and iPadOS to a List, the list enables a standard pull-to-refresh gesture.' macOS Lists don't surface that gesture. The macOS path is to read @Environment(\\.refresh) and trigger refresh() from a toolbar item, menu item, or explicit Button.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Sets EnvironmentValues.refresh in the modified view's environment.",
              detail: "All descendants can read @Environment(\\.refresh) to discover whether a refresh action is available, and to trigger it. The action is RefreshAction (its own page) — call it as a function via callAsFunction().",
              symbol: "arrow.clockwise"),
        .init(title: "The handler is @Sendable () async -> Void.",
              detail: "Sendable + async: the framework can run it on any actor. Use await inside for asynchronous work; the surrounding lifetime is used to indicate progress (spinner / pull-to-refresh indicator on iOS).",
              symbol: "function"),
        .init(title: "Custom views can offer refresh too.",
              detail: "Per the doc: read @Environment(\\.refresh), branch on whether it's nil, and call await refresh?() to trigger. This lets a Button or Toolbar item participate in refresh on platforms without a built-in gesture (i.e. macOS).",
              symbol: "rectangle.stack")
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

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height)
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

#Preview {
    RefreshablePage()
        .frame(width: 1100, height: 800)
}
