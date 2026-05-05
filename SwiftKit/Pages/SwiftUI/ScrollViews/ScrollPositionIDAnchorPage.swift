import SwiftUI

// SwiftUI `View/scrollPosition(id:anchor:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollposition(id:anchor:).md
// macOS 14.0+. Binds a Hashable id to the top-most / leading-most visible view in a scroll view.

struct ScrollPositionIDAnchorPage: View {
    @State private var scrolledID: Int? = nil
    @State private var anchor: UnitPoint = .top

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
            Text("View/scrollPosition(id:anchor:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Binds a Hashable id to the top-most / leading-most visible view in a scroll view. Two-way: writing to the binding scrolls; the user's scrolling updates it. Pair with scrollTargetLayout().")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollposition(id:anchor:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout(".scrollPosition(id: $scrolledID)")
            HStack(spacing: 8) {
                Button("Top (id 0)") { scrolledID = 0 }
                Button("id 25") { scrolledID = 25 }
                Button("Bottom (id 49)") { scrolledID = 49 }
            }
            .font(.caption)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<50, id: \.self) { i in
                        Text("Row \(i)")
                            .font(.callout).foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .id(i)
                        Divider().padding(.leading, 12)
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 200)
            .scrollPosition(id: $scrolledID, anchor: anchor)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

            HStack {
                Text("scrolledID:").foregroundStyle(.secondary)
                Text("\(scrolledID.map { "\($0)" } ?? "nil")")
                    .fontDesign(.monospaced).foregroundStyle(.primary)
            }
            .font(.caption)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "anchor: nil (default) \u{2014} top-most leading view") {
                APICallout(".scrollPosition(id: $scrolledID)  // anchor defaults to nil")
                Text("Without an anchor, SwiftUI uses the top-most (or leading-most) visible view to update the binding, and scrolls the minimal amount when you write a new id.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "anchor: .center | .bottom \u{2014} switch live") {
                APICallout(".scrollPosition(id: $scrolledID, anchor: .center)")
                Picker("Anchor", selection: $anchor) {
                    Text("top").tag(UnitPoint.top)
                    Text("center").tag(UnitPoint.center)
                    Text("bottom").tag(UnitPoint.bottom)
                }
                .pickerStyle(.segmented)
                Text("Switch the segmented control above and use the buttons in Default to see how anchor: changes both the binding value and how each target lands.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "Optional binding semantics") {
                APICallout("@State var scrolledID: Item.ID? = nil")
                Text("The binding is Optional<some Hashable> \u{2014} writing nil keeps the current scroll position. Writing a non-nil value scrolls to that id; writing items.first is a common 'scroll to top' pattern.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Stable across data reordering") {
            APICallout(".scrollPosition(id: $scrolledID)  // SwiftUI keeps the bound id visible")
            Text("When items are reordered, the window resized, or the initial layout has a different top, SwiftUI re-aligns to keep the id in $scrolledID visible. It's the macOS 14 way to maintain scroll state across content changes.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Apply .scrollTargetLayout() inside.", "The lazy stack containing your scroll targets needs .scrollTargetLayout() so SwiftUI knows which children are addressable by id.", "rectangle.split.3x1"),
        ("Hashable id, single type.", "All identified rows must share one Hashable id type. Mixing strings and ints across the same ForEach won't bind through this single optional.", "number"),
        ("Same anchor binds and scrolls.", "anchor: chooses both which view supplies the binding value (the topmost-anchored / centered / bottom-most visible view) and how programmatic scrolls land each target.", "arrow.up.to.line"),
        ("macOS 14+. ScrollPosition is macOS 15+.", "scrollPosition(id:anchor:) is macOS 14. The richer ScrollPosition struct + scrollPosition(_:anchor:) modifier landed in macOS 15.", "calendar")
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
    ScrollPositionIDAnchorPage().frame(width: 1100, height: 1100)
}
