import SwiftUI

// SwiftUI `View/containerRelativeFrame(_:alignment:_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:_:).md
// macOS 14.0+. Closure overload — derive a custom size from the container length and axis.

struct ContainerRelativeFrameClosurePage: View {
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
            Text("View/containerRelativeFrame(_:alignment:_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Positions a view inside an invisible container-relative frame, deriving the resolved size with a closure that receives the container length and axis. Use this overload to apply your own sizing math \u{2014} divisions, fractions, or custom curves.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:_:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".containerRelativeFrame(.horizontal, alignment: .topLeading) { length, axis in length / 3 }")
            Rectangle()
                .fill(.tint.opacity(0.4))
                .aspectRatio(1.0, contentMode: .fill)
                .containerRelativeFrame(.horizontal, alignment: .topLeading) { length, _ in
                    length / 3
                }
                .overlay(Text("\u{2153} container width").font(.caption).foregroundStyle(.white))
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Per-axis math").font(.headline).foregroundStyle(.primary)
                APICallout(".containerRelativeFrame([.horizontal, .vertical]) { length, axis in axis == .horizontal ? length / 2 : length / 4 }")
                Rectangle()
                    .fill(.tint.opacity(0.3))
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        axis == .horizontal ? length / 2 : length / 4
                    }
                    .overlay(Text("Width / 2, height / 4").font(.caption).foregroundStyle(.tint))
                    .frame(maxHeight: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Aspect ratio + container width").font(.headline).foregroundStyle(.primary)
                APICallout(".aspectRatio(3.0/2.0, contentMode: .fit).containerRelativeFrame(.horizontal) { length, _ in length * 0.6 }")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        ForEach(0..<4) { i in
                            Rectangle()
                                .fill(.tint.opacity(0.25))
                                .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                .containerRelativeFrame(.horizontal) { length, _ in
                                    length * 0.6
                                }
                                .overlay(Text("60% width #\(i + 1)").font(.caption).foregroundStyle(.tint))
                        }
                    }
                }
                .frame(height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("alignment parameter").font(.headline).foregroundStyle(.primary)
            APICallout(".containerRelativeFrame(.horizontal, alignment: .center) { … }")
            Text("Alignment positions the wrapped child inside the resolved frame; defaults to .center.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("The closure runs with the container's length on the given axis (after safe-area insets) and returns the size the wrapped view should claim.", systemImage: "function")
                .font(.callout).foregroundStyle(.secondary)
            Label("Use this overload for custom proportional sizing; reach for the count/span overload when you want a fixed grid mathematically.", systemImage: "ruler")
                .font(.callout).foregroundStyle(.secondary)
            Label("The closure is called per axis specified in Axis.Set. For [.horizontal, .vertical] it runs twice \u{2014} once for each direction.", systemImage: "arrow.up.left.and.down.right.magnifyingglass")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContainerRelativeFrameClosurePage().frame(width: 900, height: 800)
}
