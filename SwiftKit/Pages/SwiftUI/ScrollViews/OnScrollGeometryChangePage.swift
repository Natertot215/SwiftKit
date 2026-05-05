import SwiftUI

// SwiftUI `View/onScrollGeometryChange(for:of:action:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/onscrollgeometrychange(for:of:action:).md
// macOS 15.0+. Calls an action when a value derived from ScrollGeometry changes.

struct OnScrollGeometryChangePage: View {
    @State private var contentOffset: CGPoint = .zero
    @State private var beyondTop: Bool = false

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            offsetReadout
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
            Text("View/onScrollGeometryChange(for:of:action:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds an action that fires when a value derived from ScrollGeometry changes. The transform closure projects the geometry into your own Equatable type, and the action fires only when that projection actually changes.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/onscrollgeometrychange(for:of:action:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var offsetReadout: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".onScrollGeometryChange(for: CGPoint.self) { $0.contentOffset } action: { _, new in offset = new }")
            HStack(spacing: 16) {
                Text("offset.x: \(Int(contentOffset.x))")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Text("offset.y: \(Int(contentOffset.y))")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
            }

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<40) { i in
                        Text("Row \(i)")
                            .font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 200)
            .onScrollGeometryChange(for: CGPoint.self) { geometry in
                geometry.contentOffset
            } action: { _, new in
                contentOffset = new
            }
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Project to Bool — fires once per crossing").font(.headline).foregroundStyle(.primary)
                APICallout(".onScrollGeometryChange(for: Bool.self) { $0.contentOffset.y < $0.contentInsets.top } action: { _, new in beyondTop = new }")
                HStack(spacing: 8) {
                    Image(systemName: beyondTop ? "arrow.up.circle.fill" : "circle")
                        .foregroundStyle(beyondTop ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary))
                    Text(beyondTop ? "scrolled beyond the top inset" : "at or below top inset")
                        .font(.callout).foregroundStyle(.secondary)
                }
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<25) { i in
                            Text("Item \(i)").font(.callout).foregroundStyle(.primary)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Divider().padding(.leading, 12)
                        }
                    }
                }
                .frame(height: 160)
                .onScrollGeometryChange(for: Bool.self) { geometry in
                    geometry.contentOffset.y < geometry.contentInsets.top
                } action: { _, new in
                    beyondTop = new
                }
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("ScrollGeometry shape").font(.headline).foregroundStyle(.primary)
                APICallout("""
geometry.contentOffset    // CGPoint
geometry.contentSize      // CGSize
geometry.containerSize    // CGSize
geometry.contentInsets    // EdgeInsets
geometry.bounds           // CGRect
geometry.visibleRect      // CGRect
""")
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Equatable diffing").font(.headline).foregroundStyle(.primary)
            APICallout("// transform: (ScrollGeometry) -> T   where T: Equatable")
            Text("The action only fires when the projected T value changes \u{2014} not on every scroll tick. Project to Bool / Int / a snapped value to throttle work.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("First scroll view wins.", "If the modifier sees multiple scroll views in the hierarchy only the first is observed and a runtime issue is logged. Place the modifier directly on the scroll view you want to track.", "arrow.up.and.down"),
        ("Project narrowly.", "The action receives (oldT, newT). Narrow projections (like a Bool threshold or rounded offset) are far cheaper than tracking the full CGPoint.", "scope"),
        ("Pair with ScrollPhase if needed.", "Use onScrollPhaseChange to distinguish user drags from programmatic scrolls; onScrollGeometryChange itself doesn't tell you which.", "play.circle"),
        ("Not for layout.", "For non-scroll geometry (frames, sizes), use onGeometryChange(for:of:action:) instead.", "rectangle.dashed")
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
}

#Preview {
    OnScrollGeometryChangePage().frame(width: 1100, height: 1100)
}
