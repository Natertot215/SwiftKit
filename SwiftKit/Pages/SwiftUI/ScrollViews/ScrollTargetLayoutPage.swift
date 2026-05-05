import SwiftUI

// SwiftUI `View/scrollTargetLayout(isEnabled:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolltargetlayout(isenabled:).md
// macOS 14.0+. Marks an outermost stack as a scroll-target layout.

struct ScrollTargetLayoutPage: View {
    @State private var enabled: Bool = true

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
            Text("View/scrollTargetLayout(isEnabled:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Marks the outermost LazyVStack / LazyHStack inside a ScrollView as the scroll-target layout. Required for .scrollTargetBehavior(.viewAligned) and for scrollPosition(id:anchor:) to identify candidates.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolltargetlayout(isenabled:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout(
"""
ScrollView(.horizontal) {
    LazyHStack(spacing: 12) { \u{2026} }
        .scrollTargetLayout()
}
.scrollTargetBehavior(.viewAligned)
"""
            )
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(0..<12) { i in
                        card(index: i)
                            .frame(width: 200, height: 110)
                    }
                }
                .padding(.horizontal, 20)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .frame(height: 130)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("Drag horizontally \u{2014} the scroll settles on individual cards.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Vertical \u{2014} LazyVStack") {
                APICallout("LazyVStack { \u{2026} }.scrollTargetLayout()")
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(0..<20) { i in
                            row(index: i)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .frame(height: 200)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VariantRow(title: "Identifies targets for scrollPosition(id:)") {
                APICallout(
"""
LazyVStack { ForEach(items) { \u{2026}.id(...) } }
    .scrollTargetLayout()
"""
                )
                Text("scrollPosition(id:anchor:) reads identity from views inside the layout marked .scrollTargetLayout(). Without it, the binding has nothing to track.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "isEnabled toggle") {
            APICallout(".scrollTargetLayout(isEnabled: someBool)")
            HStack {
                Toggle("scrollTargetLayout enabled", isOn: $enabled)
                    .toggleStyle(.switch)
            }
            .font(.caption)

            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(0..<12) { i in
                        card(index: i).frame(width: 200, height: 90)
                    }
                }
                .padding(.horizontal, 20)
                .scrollTargetLayout(isEnabled: enabled)
            }
            .scrollTargetBehavior(.viewAligned)
            .frame(height: 110)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

            Text(enabled
                ? "Enabled: scrolls settle on individual cards (.viewAligned has alignment candidates)."
                : "Disabled: .viewAligned can't find candidates, so scrolls settle wherever momentum stops.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("One layout per ScrollView.", "If you nest a layout inside a marked layout, only the outermost one is the scroll-target layout. Nested LazyHStacks within a marked LazyVStack are NOT also targets.", "rectangle.split.3x1"),
        ("Required by .viewAligned.", ".scrollTargetBehavior(.viewAligned) needs candidates to settle on \u{2014} they come from .scrollTargetLayout(). Without it, viewAligned has nothing to align to.", "exclamationmark.triangle"),
        ("Implicit per-child .scrollTarget.", "scrollTargetLayout is shorthand: it applies View/scrollTarget(isEnabled:) to each child of the layout. You can also opt individual children in/out manually with .scrollTarget.", "scope"),
        ("isEnabled lets you opt out conditionally.", "Useful when toggling between paging and free-scroll modes \u{2014} keep the layout stable but disable target tracking.", "switch.2"),
        ("Pairs with scrollPosition(id:anchor:).", "scrollPosition(id:) reads identity from the views in the layout. Without scrollTargetLayout(), the id binding has no candidates.", "location")
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

    private func card(index: Int) -> some View {
        VStack(alignment: .leading) {
            Text("Card \(index)").font(.headline).foregroundStyle(.primary)
            Spacer()
            Text("aligned").font(.caption).foregroundStyle(.tertiary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 8))
    }

    private func row(index: Int) -> some View {
        Text("Row \(index)")
            .font(.callout).foregroundStyle(.primary)
            .padding(.horizontal, 12).padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
            .padding(.horizontal, 8)
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
    ScrollTargetLayoutPage().frame(width: 1100, height: 1100)
}
