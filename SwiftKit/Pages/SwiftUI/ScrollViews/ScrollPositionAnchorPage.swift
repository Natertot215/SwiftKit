import SwiftUI

// SwiftUI `View/scrollPosition(_:anchor:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollposition(_:anchor:).md
// macOS 15.0+. Binds a ScrollPosition value to control or observe a scroll view's position.

struct ScrollPositionAnchorPage: View {
    @State private var position = ScrollPosition(idType: Int.self)

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
            Text("View/scrollPosition(_:anchor:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Associates a binding to a ScrollPosition with a scroll view. Lets you scroll to a view by id, scroll to a concrete offset, or scroll to an edge \u{2014} all through one strongly-typed value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollposition(_:anchor:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout(".scrollPosition($position)  // ScrollPosition(idType: Int.self)")
            HStack(spacing: 8) {
                Button("scrollTo(id: 0)") { position.scrollTo(id: 0, anchor: .top) }
                Button("scrollTo(id: 25)") { position.scrollTo(id: 25, anchor: .center) }
                Button("scrollTo(edge: .bottom)") { position.scrollTo(edge: .bottom) }
            }
            .font(.caption)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<60, id: \.self) { i in
                        HStack {
                            Text("Row \(i)")
                            Spacer()
                            Text(position.viewID(type: Int.self) == i ? "topmost" : "")
                                .font(.caption2).foregroundStyle(.tertiary)
                        }
                        .font(.callout).foregroundStyle(.primary)
                        .padding(.horizontal, 12).padding(.vertical, 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .id(i)
                        Divider().padding(.leading, 12)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 200)
            .scrollPosition($position)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

            HStack {
                Text("position.viewID:").foregroundStyle(.secondary)
                Text("\(position.viewID(type: Int.self).map { "\($0)" } ?? "nil")")
                    .fontDesign(.monospaced).foregroundStyle(.primary)
                Spacer()
                Text("isPositionedByUser: \(position.isPositionedByUser ? "true" : "false")")
                    .fontDesign(.monospaced).foregroundStyle(.secondary)
            }
            .font(.caption)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "scrollPosition(_:) without anchor") {
                APICallout(".scrollPosition($position)")
                Text("Without an anchor, SwiftUI uses the top-most/leading-most visible view to update the binding's viewID, and scrolls the minimal amount when you write a new id.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "scrollPosition(_:anchor:) with .bottom anchor") {
                APICallout(".scrollPosition($position, anchor: .bottom)")
                Text("With anchor: .bottom, the binding tracks the bottom-most visible view and scrolls land each target so it sits at the bottom of the visible region. Useful for chat-style logs.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "Programmatic scrolling via methods") {
                APICallout("position.scrollTo(id:anchor:) | position.scrollTo(edge:) | position.scrollTo(point:)")
                Text("ScrollPosition exposes scrollTo(id:anchor:), scrollTo(edge:), scrollTo(point:), scrollTo(x:y:) \u{2014} all callable from button actions to drive scrolling without a separate ScrollViewReader.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "isPositionedByUser") {
            APICallout("position.isPositionedByUser  // true while user is dragging")
            Text("True while the scroll view is being driven by the user (active drag, decelerating). Useful for pausing automatic scrolls while the user is interacting.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Pair with scrollTargetLayout().", "ScrollPosition needs to know which container holds the identified scroll targets. Apply .scrollTargetLayout() to the LazyVStack/LazyHStack inside the ScrollView.", "rectangle.split.3x1"),
        ("Symmetric: read and write.", "The binding is two-way: SwiftUI updates it as the user scrolls, and writing to it (or calling scrollTo) drives the scroll. The id type is fixed by ScrollPosition(idType:).", "arrow.up.arrow.down"),
        ("Stable across content changes.", "When the data backing the scroll view is reordered or the container resizes, SwiftUI keeps the bound view visible \u{2014} including initial layout when the binding has a different id than the top.", "lock.shield"),
        ("Anchor influences both directions.", "anchor: .bottom means: choose the bottom-most visible view as the binding value AND prefer aligning each programmatic scroll target to the bottom of the visible region.", "arrow.up.to.line"),
        ("New in macOS 15.", "scrollPosition(_:anchor:) and the ScrollPosition struct are macOS 15.0+. For pre-15 use scrollPosition(id:anchor:) with a Hashable id binding.", "calendar")
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
    ScrollPositionAnchorPage().frame(width: 1100, height: 1100)
}
