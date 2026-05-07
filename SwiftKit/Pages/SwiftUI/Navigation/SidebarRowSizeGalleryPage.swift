import SwiftUI

// SwiftUI `SidebarRowSize` reference page.
// Source: Documentation/SwiftUI/navigation/sidebarrowsize.md
// macOS 13.0+. Enum with three cases: .small, .medium, .large.
// On macOS the value is primarily controlled by the user's "Sidebar Icon Size"
// in System Settings → Appearance and applies app-wide. Read or write via the
// EnvironmentValues.sidebarRowSize key.

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 220

private struct SRSItem: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let sidebarItems: [SRSItem] = [
    SRSItem(name: "Inbox",   symbol: "tray"),
    SRSItem(name: "Sent",    symbol: "paperplane"),
    SRSItem(name: "Drafts",  symbol: "doc.text"),
    SRSItem(name: "Archive", symbol: "archivebox")
]

struct SidebarRowSizeGalleryPage: View {
    @State private var rowSize: SidebarRowSize = .medium

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
            Text("SidebarRowSize")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The standard sizes of sidebar rows.")
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
            DemoCard(api: ".environment(\\.sidebarRowSize, rowSize)") {
                sidebar
                    .environment(\.sidebarRowSize, rowSize)
            }
            HStack(spacing: 8) {
                Button(".small")  { rowSize = .small }
                Button(".medium") { rowSize = .medium }
                Button(".large")  { rowSize = .large }
                Spacer()
                Text("rowSize = \(label(for: rowSize))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All three cases — fixed via .environment.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(".small")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".environment(\\.sidebarRowSize, .small)") {
                        sidebar.environment(\.sidebarRowSize, .small)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".medium")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".environment(\\.sidebarRowSize, .medium)") {
                        sidebar.environment(\.sidebarRowSize, .medium)
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(".large")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    DemoCard(api: ".environment(\\.sidebarRowSize, .large)") {
                        sidebar.environment(\.sidebarRowSize, .large)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("On macOS the system reads this value from the user's Appearance → Sidebar Icon Size preference. Writing the environment overrides per-subtree.")
                .font(.callout)
                .foregroundStyle(.secondary)
            APICallout("@Environment(\\.sidebarRowSize) private var sidebarRowSize")
            APICallout("// switch sidebarRowSize { case .small: …; case .medium: …; case .large: … }")
        }
    }

    private var sidebar: some View {
        List(sidebarItems, id: \.id) { item in
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

    private struct SRSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SRSNote] = [
        .init(title: "Three cases — .small, .medium, .large.",
              detail: "On macOS all three cases are honored. On every other platform only .medium is supported — the others fall back silently.",
              symbol: "rectangle.expand.vertical"),
        .init(title: "User-controlled via System Settings → Appearance.",
              detail: "macOS exposes a global Sidebar Icon Size preference (Small / Medium / Large) that applies to every running app. Your code reads the current value via @Environment(\\.sidebarRowSize).",
              symbol: "macwindow"),
        .init(title: "Override per subtree with .environment.",
              detail: "Apply .environment(\\.sidebarRowSize, .large) on a List to force a specific size regardless of the system preference. Use sparingly — overriding the user's accessibility preference is usually the wrong call.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "Equatable / Hashable / Sendable.",
              detail: "All standard conformances. Drives switch-on-cases for layout decisions and is safe to pass across actor boundaries."
              , symbol: "circle.dashed")
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

extension SidebarRowSizeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.sidebarRowSize",
        title: "SidebarRowSize",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "SidebarRowSize",
            "EnvironmentValues/sidebarRowSize"
        ],
        blurb: "The standard sizes of sidebar rows on macOS — small, medium, and large. Read from the environment to adapt sidebar row layouts to the user's Sidebar Icon Size preference.",
        signature: "enum SidebarRowSize",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/sidebarrowsize.md",
        page: { AnyView(SidebarRowSizeGalleryPage()) }
    )
}

#Preview {
    SidebarRowSizeGalleryPage()
        .frame(width: 1200, height: 800)
}
