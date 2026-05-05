import SwiftUI

// SwiftUI `View/coordinateSpace(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/coordinatespace(_:).md
// macOS 14.0+. Names a view's coordinate space so descendants can resolve frames in it.

struct CoordinateSpaceModifierPage: View {
    @State private var dragLocation: CGPoint = CGPoint(x: 80, y: 70)

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
            Text("View/coordinateSpace(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Tags this view's coordinate space with a name so descendants can convert their frames into that space using GeometryProxy.frame(in:) or DragGesture(coordinateSpace:).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/coordinatespace(_:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(spacing: 6) {
                Text("Inner GeometryReader reads its frame in the named 'demo' space")
                    .font(.caption).foregroundStyle(.secondary)
                GeometryReader { proxy in
                    let frame = proxy.frame(in: .named("demo"))
                    Text("x \(Int(frame.origin.x))   y \(Int(frame.origin.y))   w \(Int(frame.size.width))   h \(Int(frame.size.height))")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                }
                .frame(height: 44)
                .padding(.leading, 40)
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
            .coordinateSpace(.named("demo"))

            APICallout(".coordinateSpace(.named(\"demo\"))")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Local vs named") {
                VStack(spacing: 0) {
                    GeometryReader { proxy in
                        let local = proxy.frame(in: .local)
                        let named = proxy.frame(in: .named("variants"))
                        VStack(alignment: .leading, spacing: 2) {
                            Text(".local origin \(Int(local.origin.x)), \(Int(local.origin.y))")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            Text(".named(\"variants\") origin \(Int(named.origin.x)), \(Int(named.origin.y))")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    }
                    .frame(height: 56)
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
                .coordinateSpace(.named("variants"))
            }

            VariantRow(title: "Multiple named spaces nested") {
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        GeometryReader { proxy in
                            let outer = proxy.frame(in: .named("outer"))
                            let inner = proxy.frame(in: .named("inner"))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("outer origin: \(Int(outer.origin.x)), \(Int(outer.origin.y))")
                                    .font(.caption).fontDesign(.monospaced)
                                Text("inner origin: \(Int(inner.origin.x)), \(Int(inner.origin.y))")
                                    .font(.caption).fontDesign(.monospaced)
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        }
                        .frame(height: 60)
                    }
                    .padding(20)
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.tint))
                    .coordinateSpace(.named("inner"))
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
                .coordinateSpace(.named("outer"))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Drag location resolved in 'stack'") {
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .topLeading) {
                    Color.accentColor.opacity(0.15)
                        .frame(maxWidth: .infinity).frame(height: 140)
                    Circle()
                        .fill(.tint)
                        .frame(width: 28, height: 28)
                        .position(x: max(14, min(dragLocation.x, 600)),
                                  y: max(14, min(dragLocation.y, 126)))
                        .gesture(
                            DragGesture(coordinateSpace: .named("stack"))
                                .onChanged { info in dragLocation = info.location }
                        )
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .coordinateSpace(.named("stack"))

                Text("DragGesture(coordinateSpace: .named(\"stack\")) reports \(Int(dragLocation.x)), \(Int(dragLocation.y))")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Pairs with GeometryProxy.frame(in:).", "The standard descendant calls proxy.frame(in: .named(\"X\")) to convert its bounds into the named ancestor's space.", "scope"),
        ("DragGesture(coordinateSpace:) consumes it too.", "Dragged distances and locations resolve against the named space \u{2014} useful when the drag target is nested several layers deep.", "hand.draw"),
        ("macOS 14.0 introduced NamedCoordinateSpace.", "Earlier versions used CoordinateSpace.named(\"X\"); the modern overload accepts CoordinateSpaceProtocol values.", "calendar"),
        ("Names are local to the view tree.", "There is no global name registry \u{2014} naming the same space twice in disconnected subtrees is allowed and does not collide.", "tree"),
        ("Compose with .global and .local.", "These two are always available without any modifier: .global is window-relative, .local is the calling view's own space.", "globe")
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
    CoordinateSpaceModifierPage().frame(width: 1100, height: 1100)
}
