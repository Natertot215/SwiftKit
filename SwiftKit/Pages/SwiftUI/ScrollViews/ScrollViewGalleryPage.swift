import SwiftUI

// SwiftUI `ScrollView` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollview.md
// macOS 10.15+. A scrollable container that adjusts its visible region as the user scrolls.

struct ScrollViewGalleryPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            verticalDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("ScrollView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A scrollable view. Pass an axes set (.vertical default, .horizontal, or both) and a content closure. ScrollView is not lazy on its own \u{2014} pair with LazyVStack/LazyHStack for large data.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollview.md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var verticalDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout("ScrollView { VStack { ForEach(0..<24) { i in Text(\"Row \\(i)\") } } }")
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(0..<24) { i in
                        Text("Row \(i + 1)")
                            .font(.callout).foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                    }
                }
                .padding(8)
            }
            .frame(height: 180)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "ScrollView(.horizontal)") {
                APICallout("ScrollView(.horizontal) { HStack { \u{2026} } }")
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(0..<20) { i in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.tint.opacity(0.25))
                                .frame(width: 72, height: 72)
                                .overlay(Text("\(i + 1)").font(.callout).foregroundStyle(.primary))
                        }
                    }
                    .padding(8)
                }
                .frame(height: 96)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VariantRow(title: "ScrollView([.horizontal, .vertical]) \u{2014} both axes") {
                APICallout("ScrollView([.horizontal, .vertical]) { Grid \u{2026} }")
                ScrollView([.horizontal, .vertical]) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(0..<8) { row in
                            HStack(spacing: 4) {
                                ForEach(0..<14) { col in
                                    Text("\(row),\(col)")
                                        .font(.caption2).fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                        .frame(width: 48, height: 28)
                                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 3))
                                }
                            }
                        }
                    }
                    .padding(8)
                }
                .frame(height: 120)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VariantRow(title: "Lazy content (LazyVStack)") {
                APICallout("ScrollView { LazyVStack { ForEach(items) { ItemView($0) } } }")
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 4) {
                        ForEach(0..<200) { i in
                            Text("Lazy row \(i)")
                                .font(.callout).foregroundStyle(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 12).padding(.vertical, 4)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .frame(height: 140)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "showsIndicators: false (deprecated initializer)") {
            APICallout("ScrollView(showsIndicators: false) { \u{2026} }  // deprecated; prefer .scrollIndicators(.hidden)")
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(0..<10) { i in
                        Text("Row \(i)")
                            .font(.callout).foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 12).padding(.vertical, 4)
                    }
                }
                .padding(.vertical, 6)
            }
            .frame(height: 120)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("ScrollView is not lazy.", "ScrollView itself does not lazily realize children. Wrap large content in LazyVStack / LazyHStack so off-screen rows aren't materialized.", "bolt"),
        ("Default axis is .vertical.", "init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, content: \u{2026}). Pass [.horizontal, .vertical] to scroll in both directions.", "arrow.up.arrow.down"),
        ("Use defaultScrollAnchor for initial position.", ".defaultScrollAnchor(.center) starts both-axes content centered; .defaultScrollAnchor(.bottom) pins a chat-style log to the bottom on launch.", "scope"),
        ("Use ScrollViewReader for programmatic scrolling.", "Wrap the ScrollView in ScrollViewReader { proxy in \u{2026} } and call proxy.scrollTo(id:anchor:) inside a button or onChange handler \u{2014} not during the body builder.", "arrow.up.and.down.text.horizontal"),
        ("showsIndicators is deprecated.", "Prefer .scrollIndicators(_:axes:) on the ScrollView. The legacy initializer parameter still compiles but is marked deprecated since the modifier landed in macOS 13.", "exclamationmark.triangle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

extension ScrollViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollView",
        title: "ScrollView",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: ["ScrollView"],
        blurb: "A scrollable view that adjusts which portion of its underlying content is visible as the user performs platform-appropriate scroll gestures. Scrolls horizontally, vertically, or both; does not zoom.",
        signature: "struct ScrollView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollview.md",
        page: { AnyView(ScrollViewGalleryPage()) }
    )
}

#Preview {
    ScrollViewGalleryPage().frame(width: 1100, height: 1100)
}
