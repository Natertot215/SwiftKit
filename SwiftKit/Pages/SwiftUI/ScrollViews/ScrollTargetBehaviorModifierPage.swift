import SwiftUI

// SwiftUI `View/scrollTargetBehavior(_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolltargetbehavior(_:).md
// macOS 14.0+. Sets the scroll behavior governing where scroll gestures end.

struct ScrollTargetBehaviorModifierPage: View {
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
            Text("View/scrollTargetBehavior(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sets the scroll behavior of a scrollable view. Built-in behaviors: .paging (container-aligned) and .viewAligned (item-aligned). Pair .viewAligned with .scrollTargetLayout() inside the scroll view.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolltargetbehavior(_:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout(".scrollTargetBehavior(.paging)")
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<6) { i in
                        page(index: i)
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .frame(height: 220)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("Vertical paging \u{2014} each scroll settles on the next container-sized page.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: ".viewAligned \u{2014} settle on individual views") {
                APICallout(".scrollTargetBehavior(.viewAligned)  // requires .scrollTargetLayout() inside")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        ForEach(0..<10) { i in
                            card(index: i)
                                .frame(width: 180, height: 110)
                        }
                    }
                    .padding(.horizontal, 20)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .frame(height: 130)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VariantRow(title: ".viewAligned(limitBehavior: .always)") {
                APICallout(".scrollTargetBehavior(.viewAligned(limitBehavior: .always))")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        ForEach(0..<10) { i in
                            card(index: i)
                                .frame(width: 180, height: 110)
                        }
                    }
                    .padding(.horizontal, 20)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .frame(height: 130)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VariantRow(title: ".paging \u{2014} horizontal carousel") {
                APICallout("ScrollView(.horizontal) { \u{2026} }.scrollTargetBehavior(.paging)")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<6) { i in
                            page(index: i)
                                .frame(width: 280)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                .frame(height: 130)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "AnyScrollTargetBehavior \u{2014} switch at runtime") {
            APICallout(".scrollTargetBehavior(condition ? AnyScrollTargetBehavior(.paging) : AnyScrollTargetBehavior(.viewAligned))")
            Text("Use AnyScrollTargetBehavior to swap behaviors based on size class, user preference, or any runtime condition. SwiftUI updates the scroll view's behavior live when the underlying value changes.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        (".paging needs no layout hint.", ".paging settles on container-sized boundaries; works without .scrollTargetLayout(). It treats each container's worth of content as a page.", "rectangle.split.3x1"),
        (".viewAligned requires scrollTargetLayout().", "Apply .scrollTargetLayout() to the LazyHStack/VStack inside the ScrollView so SwiftUI knows which views are alignment candidates. Otherwise .viewAligned has nothing to settle on.", "exclamationmark.triangle"),
        ("limitBehavior controls drag distance.", ".viewAligned(limitBehavior: .always) only allows scrolling a few views per gesture. Default behavior limits in compact size classes; otherwise unrestricted.", "ruler"),
        ("Custom behaviors via the protocol.", "Conform to ScrollTargetBehavior with updateTarget(_:context:) to round to multiples, snap to grid lines, or any custom alignment logic.", "wand.and.stars"),
        ("Pairs with safeAreaPadding for centering.", "When .viewAligned content is narrower than the container, .safeAreaPadding(.horizontal, 20) keeps the first/last items reachable without clipping.", "rectangle.center.inset.filled")
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

    private func page(index: Int) -> some View {
        Text("Page \(index)")
            .font(.title3).fontWeight(.semibold).foregroundStyle(.primary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(height: 220)
            .background(.fill.tertiary)
            .overlay(Divider().opacity(0.5), alignment: .bottom)
    }

    private func card(index: Int) -> some View {
        VStack(alignment: .leading) {
            Text("Card \(index)")
                .font(.headline).foregroundStyle(.primary)
            Spacer()
            Text("aligned").font(.caption).foregroundStyle(.tertiary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 8))
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
    ScrollTargetBehaviorModifierPage().frame(width: 1100, height: 1100)
}
