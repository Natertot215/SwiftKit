import SwiftUI

// SwiftUI `View/onGeometryChange(for:of:action:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/ongeometrychange(for:of:action:).md
// macOS 13.0+. Performs an action when a value derived from a GeometryProxy changes.

struct OnGeometryChangePage: View {
    @State private var size: CGSize = .zero
    @State private var isWide: Bool = false
    @State private var globalOriginY: CGFloat = 0

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
            Text("View/onGeometryChange(for:of:action:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Calls action whenever a value transformed from a GeometryProxy changes. Cheap alternative to GeometryReader for reading view metrics into @State \u{2014} only fires when the derived value actually moves.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/ongeometrychange(for:of:action:).md \u{00b7} macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("This text knows its own size")
                .font(.title3).fontWeight(.semibold)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .onGeometryChange(for: CGSize.self) { proxy in
                    proxy.size
                } action: { newValue in
                    size = newValue
                }

            Text("size: \(Int(size.width)) \u{00d7} \(Int(size.height))")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)

            APICallout(".onGeometryChange(for: CGSize.self) { $0.size } action: { size = $0 }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Boolean derived from size") {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Spacer()
                        Text(isWide ? "wide" : "narrow")
                            .font(.headline).fontWeight(.semibold)
                            .foregroundStyle(isWide ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary))
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .onGeometryChange(for: Bool.self) { proxy in
                        proxy.size.width > 480
                    } action: { newValue in
                        isWide = newValue
                    }

                    Text("Resize the window past 480pt to flip.")
                        .font(.caption).foregroundStyle(.tertiary)
                }
            }

            VariantRow(title: "Origin in .global") {
                Text("origin.y: \(Int(globalOriginY))")
                    .font(.callout).fontDesign(.monospaced)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .onGeometryChange(for: CGFloat.self) { proxy in
                        proxy.frame(in: .global).origin.y
                    } action: { newValue in
                        globalOriginY = newValue
                    }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Equatable diffing") {
            Text("onGeometryChange only fires its action when the transformed value compares not-equal to the previous one. Sub-pixel layout changes that don't cross an integer boundary won't ripple downstream.")
                .font(.callout).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Cheaper than GeometryReader for state reads.", "GeometryReader proposes its parent's full size and re-evaluates per layout pass. onGeometryChange only fires action when the transformed value's Equatable comparison changes.", "bolt"),
        ("Scope-down with the transform closure.", "Pick the smallest derivable type \u{2014} Bool, CGFloat, CGSize \u{2014} so unrelated layout passes don't churn @State. Avoid passing through whole CGRects when only origin.y is used.", "scope"),
        ("Designed for ScrollView use.", "Apple's example uses it inside LazyHStack/LazyVStack rows to detect 75% visibility for autoplay \u{2014} the per-frame discipline avoids invalidating sibling rows.", "scroll"),
        ("Sendable transform.", "The transform closure must be @Sendable so the framework can run it across actor boundaries. Capture only Sendable values inside.", "lock.shield"),
        ("Pair with onScrollGeometryChange.", "For scroll-driven UIs there's a more specific .onScrollGeometryChange(for:of:action:) on ScrollView \u{2014} prefer it when the value depends on scroll offset.", "arrow.up.arrow.down")
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
    OnGeometryChangePage().frame(width: 1100, height: 1100)
}
