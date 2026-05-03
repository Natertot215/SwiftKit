import SwiftUI

// SwiftUI `EnvironmentValues/sidebarRowSize` reference page.
// Source: Documentation/SwiftUI/navigation/sidebarrowsize.md (same doc covers both
// the type and the environment key).
// macOS 13.0+. Read with @Environment(\.sidebarRowSize); write with
// .environment(\.sidebarRowSize, value). Type is SidebarRowSize.

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 220

private struct SRSEItem: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let items: [SRSEItem] = [
    SRSEItem(name: "Inbox",   symbol: "tray"),
    SRSEItem(name: "Sent",    symbol: "paperplane"),
    SRSEItem(name: "Drafts",  symbol: "doc.text"),
    SRSEItem(name: "Archive", symbol: "archivebox")
]

struct SidebarRowSizeEnvironmentPage: View {
    @Environment(\.sidebarRowSize) private var systemRowSize
    @State private var override: SidebarRowSize = .medium

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
            Text("EnvironmentValues/sidebarRowSize")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The current sidebar row size, controlled by the user's system preference.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/sidebarrowsize.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            DemoCard(api: "@Environment(\\.sidebarRowSize) — read the current value") {
                List(items, id: \.id) { item in
                    Label(item.name, systemImage: item.symbol)
                }
                .listStyle(.sidebar)
            }
            HStack {
                Text("System sidebarRowSize = \(label(for: systemRowSize))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                Spacer()
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Override per subtree — .environment(\\.sidebarRowSize, .large)") {
                DemoCard(api: ".environment(\\.sidebarRowSize, override)") {
                    List(items, id: \.id) { item in
                        Label(item.name, systemImage: item.symbol)
                    }
                    .listStyle(.sidebar)
                    .environment(\.sidebarRowSize, override)
                }
                HStack(spacing: 8) {
                    Button(".small")  { override = .small }
                    Button(".medium") { override = .medium }
                    Button(".large")  { override = .large }
                    Spacer()
                    Text("override = \(label(for: override))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".small")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".environment(\\.sidebarRowSize, .small)") {
                        sample.environment(\.sidebarRowSize, .small)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".medium")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".environment(\\.sidebarRowSize, .medium)") {
                        sample.environment(\.sidebarRowSize, .medium)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".large")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".environment(\\.sidebarRowSize, .large)") {
                        sample.environment(\.sidebarRowSize, .large)
                    }
                }
            }
        }
    }

    private var sample: some View {
        List(items, id: \.id) { item in
            Label(item.name, systemImage: item.symbol)
        }
        .listStyle(.sidebar)
    }

    private func label(for rowSize: SidebarRowSize) -> String {
        switch rowSize {
        case .small:  return ".small"
        case .medium: return ".medium"
        case .large:  return ".large"
        @unknown default: return String(describing: rowSize)
        }
    }

    // MARK: Notes

    private struct SRSENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SRSENote] = [
        .init(title: "Read via @Environment, write via .environment.",
              detail: "@Environment(\\.sidebarRowSize) returns the effective SidebarRowSize for the current view. .environment(\\.sidebarRowSize, .large) overrides it for a subtree. Type is SidebarRowSize.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "macOS — system preference drives the default.",
              detail: "The default value is whatever the user picked in System Settings → Appearance → Sidebar Icon Size. Updates from the user write through to the environment automatically.",
              symbol: "macwindow"),
        .init(title: "Override sparingly — respect the user's accessibility choice.",
              detail: "The system value typically reflects an accessibility preference. Forcing .small inside an app is usually wrong; reach for the override only when a specific layout demands it (e.g. an embedded preview frame).",
              symbol: "exclamationmark.triangle"),
        .init(title: "Other platforms only support .medium.",
              detail: "iOS / iPadOS / tvOS / watchOS / visionOS report .medium and ignore writes of .small / .large. Apple's docs say so explicitly. Plan layout choices around .medium being the universal floor.",
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
    SidebarRowSizeEnvironmentPage()
        .frame(width: 1200, height: 800)
}
