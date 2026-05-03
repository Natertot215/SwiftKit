import SwiftUI

// SwiftUI `RefreshAction` (struct) reference page.
// Source: Documentation/SwiftUI/lists/refreshaction.md
// Read via @Environment(\.refresh). When non-nil, the surrounding context
// has registered a refreshable action you can call via callAsFunction().
// macOS 12.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

private struct RefreshableSurface: View {
    @Environment(\.refresh) private var refresh
    @State private var isRefreshing = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(refresh == nil
                 ? "RefreshAction in scope: NO"
                 : "RefreshAction in scope: YES")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(refresh == nil ? .secondary : .primary)

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
                    ProgressView().controlSize(.small)
                }
            }
        }
        .padding()
    }
}

struct RefreshActionTypePage: View {
    @State private var lastTick = Date.now

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
            Text("RefreshAction")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An action that initiates a refresh operation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/refreshaction.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "@Environment(\\.refresh) private var refresh") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Tick: \(lastTick.formatted(date: .omitted, time: .standard))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                RefreshableSurface()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .refreshable {
                try? await Task.sleep(for: .milliseconds(500))
                lastTick = .now
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Custom view that offers refresh capability") {
                DemoCard(api: "Button { Task { await refresh?() } }.disabled(refresh == nil)") {
                    RefreshableSurface()
                        .refreshable {
                            try? await Task.sleep(for: .milliseconds(400))
                        }
                }
            }

            VariantBlock(title: "Without .refreshable in scope — environment value is nil") {
                DemoCard(api: "(no .refreshable in scope)") {
                    RefreshableSurface()
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — RefreshAction nil vs non-nil") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "No .refreshable", api: "@Environment(\\.refresh) == nil") {
                        RefreshableSurface()
                    }
                    StateColumn(label: "With .refreshable", api: "@Environment(\\.refresh) != nil") {
                        RefreshableSurface()
                            .refreshable {
                                try? await Task.sleep(for: .milliseconds(300))
                            }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "An EnvironmentValue, not a modifier.",
              detail: "Read with @Environment(\\.refresh). The value is RefreshAction? — nil if no ancestor has applied .refreshable, non-nil otherwise. Branch on optionality to enable/disable refresh UI.",
              symbol: "function"),
        .init(title: "Trigger via callAsFunction() — i.e. just call it.",
              detail: "RefreshAction defines callAsFunction() async, so 'refresh()' invokes the registered handler. Always precede with await; wrap in Task { } if you're not already in an async context.",
              symbol: "play.circle"),
        .init(title: "Lifetime is used as progress feedback.",
              detail: "The framework uses the duration of the call to drive the pull-to-refresh indicator (iOS) or any explicit progress UI you build. Show a spinner before the call and hide it after.",
              symbol: "hourglass"),
        .init(title: "Pairs with .refreshable(action:).",
              detail: ".refreshable installs the action; @Environment(\\.refresh) reads it. The two are designed together — one publishes, the other consumes.",
              symbol: "arrow.left.arrow.right")
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
                .frame(width: demoFrameWidth, height: height, alignment: .topLeading)
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
                .frame(width: 240, height: demoFrameHeight, alignment: .topLeading)
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
    RefreshActionTypePage()
        .frame(width: 1100, height: 800)
}
