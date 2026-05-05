import SwiftUI

// SwiftUI `View/position(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/position(_:).md
// macOS 10.15+. CGPoint variant.

struct PositionPointPage: View {
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
            Text("View/position(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Positions the center of a view at a CGPoint in its parent's coordinate space. The parent's normal placement is replaced \u{2014} the wrapped view becomes pinned at that absolute coordinate.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/position(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".position(CGPoint(x: 100, y: 50))")
            ZStack {
                Text("(100, 50)")
                    .font(.caption).fontWeight(.semibold)
                    .padding(6)
                    .background(.tint.opacity(0.25), in: RoundedRectangle(cornerRadius: 4))
                    .foregroundStyle(.tint)
                    .position(CGPoint(x: 100, y: 50))
            }
            .frame(width: 240, height: 100)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("The label's center is pinned at x=100, y=50 within the 240\u{00d7}100 ZStack.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Stored CGPoint").font(.headline).foregroundStyle(.primary)
                APICallout("let pin = CGPoint(x: 60, y: 30)\n.position(pin)")
                ZStack {
                    Circle()
                        .fill(.tint.opacity(0.4))
                        .frame(width: 24, height: 24)
                        .position(CGPoint(x: 60, y: 30))
                }
                .frame(width: 200, height: 80)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("With .zero").font(.headline).foregroundStyle(.primary)
                APICallout(".position(.zero)  // pins center at top-leading corner")
                ZStack {
                    Circle()
                        .fill(.tint.opacity(0.4))
                        .frame(width: 24, height: 24)
                        .position(.zero)
                }
                .frame(width: 200, height: 80)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("Half the circle hangs off the top-leading corner because position centers the view at (0, 0).")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("CGPoint vs (x:y:) overload").font(.headline).foregroundStyle(.primary)
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 6) {
                GridRow {
                    Text("modifier").font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                    Text("when to use").font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                }
                Divider().gridCellUnsizedAxes(.horizontal)
                GridRow {
                    APICallout(".position(_:)")
                    Text("You already have a CGPoint value (e.g. from a gesture, a stored state, GeometryProxy).").font(.caption).foregroundStyle(.secondary)
                }
                GridRow {
                    APICallout(".position(x:y:)")
                    Text("You're building the position from two scalars inline.").font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("position takes over placement \u{2014} the parent's stack/grid no longer drives where this view sits, only its center coordinate does.", systemImage: "scope")
                .font(.callout).foregroundStyle(.secondary)
            Label("The size of the wrapped view is unchanged; only its center is fixed. If the view is wider than the available space, it will overflow on either side equally.", systemImage: "rectangle.dashed")
                .font(.callout).foregroundStyle(.secondary)
            Label("Coordinate origin is the parent's top-leading corner; +x trails, +y descends.", systemImage: "arrow.down.right")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PositionPointPage().frame(width: 900, height: 700)
}
