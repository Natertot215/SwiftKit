import SwiftUI

// SwiftUI `View/position(x:y:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/position(x:y:).md
// macOS 10.15+. Two-scalar variant.

struct PositionXYPage: View {
    @State private var positionX: CGFloat = 80
    @State private var positionY: CGFloat = 40

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
            Text("View/position(x:y:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Positions the center of a view at the specified coordinates in its parent's coordinate space. Two-scalar variant for inline composition.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/position(x:y:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".position(x: 144, y: 80)")
            ZStack {
                Image(systemName: "circle")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .position(x: 144, y: 80)
            }
            .frame(width: 200, height: 160)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("The circle's center is anchored at (144, 80) inside a 200\u{00d7}160 stack.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Interactive position").font(.headline).foregroundStyle(.primary)
                APICallout(".position(x: \(Int(positionX)), y: \(Int(positionY)))")
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("X: \(Int(positionX))").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                        Slider(value: $positionX, in: 0...240, step: 1).frame(width: 160)
                        Text("Y: \(Int(positionY))").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                        Slider(value: $positionY, in: 0...120, step: 1).frame(width: 160)
                    }
                    ZStack {
                        Circle()
                            .fill(.tint)
                            .frame(width: 24, height: 24)
                            .position(x: positionX, y: positionY)
                    }
                    .frame(width: 240, height: 120)
                    .clipped()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Defaults \u{2014} both zero").font(.headline).foregroundStyle(.primary)
                APICallout(".position()  // x and y default to 0 \u{2014} pins center at origin")
                ZStack {
                    Rectangle()
                        .fill(.tint.opacity(0.4))
                        .frame(width: 30, height: 20)
                        .position()
                }
                .frame(width: 200, height: 80)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("Both x and y default to 0; the rectangle's center sits at the top-leading corner.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Animating a position").font(.headline).foregroundStyle(.primary)
            Text("Wrap position changes in withAnimation { ... } or apply .animation(_:value:) to drive smooth movement \u{2014} position is animatable on both axes independently.")
                .font(.callout).foregroundStyle(.secondary)
            APICallout("withAnimation(.spring) { positionX = newX }")
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Reach for position when the parent's normal layout can't reach the placement you need (e.g., absolute placement inside a ZStack).", systemImage: "scope")
                .font(.callout).foregroundStyle(.secondary)
            Label("If you only want to nudge a view from where the parent placed it, use offset(x:y:) instead \u{2014} offset preserves the layout slot.", systemImage: "arrow.up.left.and.down.right.magnifyingglass")
                .font(.callout).foregroundStyle(.secondary)
            Label("position is animatable: changing x or y inside withAnimation produces smooth motion.", systemImage: "wand.and.stars")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PositionXYPage().frame(width: 900, height: 800)
}
