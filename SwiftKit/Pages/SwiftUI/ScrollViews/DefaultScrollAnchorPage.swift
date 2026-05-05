import SwiftUI

// SwiftUI `View/defaultScrollAnchor(_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/defaultscrollanchor(_:).md
// macOS 14.0+. Sets which UnitPoint of a scroll view's content should be visible by default.

struct DefaultScrollAnchorPage: View {
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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/defaultScrollAnchor(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Specifies the UnitPoint of a scroll view's content that should be initially visible. Affects both the launch position and how the scroll view repositions when content size changes.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/defaultscrollanchor(_:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 16) {
            anchorDemo("\u{2026}.defaultScrollAnchor(.top)", anchor: .top)
            anchorDemo("\u{2026}.defaultScrollAnchor(.center)", anchor: .center)
            anchorDemo("\u{2026}.defaultScrollAnchor(.bottom)", anchor: .bottom)
        }
    }

    private func anchorDemo(_ api: String, anchor: UnitPoint) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            APICallout(api)
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(0..<30) { i in
                        Text("Row \(i)")
                            .font(.callout).foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 12).padding(.vertical, 4)
                    }
                }
                .padding(.vertical, 6)
            }
            .frame(height: 130)
            .defaultScrollAnchor(anchor)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Both axes \u{2014} .center") {
                APICallout("ScrollView([.horizontal, .vertical]) { \u{2026} }.defaultScrollAnchor(.center)")
                ScrollView([.horizontal, .vertical]) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(0..<10) { row in
                            HStack(spacing: 4) {
                                ForEach(0..<14) { col in
                                    Text("\(row),\(col)")
                                        .font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                                        .frame(width: 48, height: 28)
                                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 3))
                                }
                            }
                        }
                    }
                    .padding(8)
                }
                .frame(height: 140)
                .defaultScrollAnchor(.center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VariantRow(title: "Chat-style log \u{2014} .bottom") {
                APICallout("ScrollView { \u{2026} }.defaultScrollAnchor(.bottom)")
                Text("Most messaging apps land at the bottom of the conversation on launch and stay pinned there as new content arrives. .defaultScrollAnchor(.bottom) achieves both behaviors.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Content size change re-uses the anchor") {
            APICallout("// content grows  \u{2192}  scroll view re-positions per the anchor")
            Text("When the scroll view's content size changes, SwiftUI consults the same anchor to decide how to reposition. With .bottom, new rows pin to the bottom; with .top, the existing top stays put.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Initial-only \u{2014} user can scroll away.", "After the scroll view first lays out, the user can freely scroll away from the anchor. The anchor only governs the initial position and content-size-change behavior.", "play.circle"),
        ("UnitPoint, not edge cases.", "Pass any UnitPoint: .top, .center, .bottom, .leading, .trailing, or a custom UnitPoint(x:y:). nil resets to the system default (top/leading).", "scope"),
        ("Behavior split via for: role.", "If you need different anchors for initial layout vs alignment vs size changes, use defaultScrollAnchor(_:for:) (macOS 15) with a ScrollAnchorRole.", "rectangle.split.3x1"),
        ("Pairs cleanly with scrollPosition.", "Use defaultScrollAnchor for first-paint position and scrollPosition for ongoing programmatic scrolling \u{2014} they don't conflict.", "calendar")
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

#Preview {
    DefaultScrollAnchorPage().frame(width: 1100, height: 1100)
}
