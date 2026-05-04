import SwiftUI

// SwiftUI zIndex(_:) reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/zindex.md
// macOS 10.15+

struct ZIndexPage: View {
    @State private var highlighted: Int = 2

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("zIndex(_:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Controls the display order of overlapping views within their parent. Higher zIndex values appear on top.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/zindex.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout(".zIndex(1.0)")
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red.opacity(0.5))
                        .frame(width: 120, height: 80)
                        .offset(x: -30, y: -20)
                        .zIndex(0)
                        .overlay(Text("zIndex: 0").font(.caption2).foregroundStyle(.white))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue.opacity(0.7))
                        .frame(width: 120, height: 80)
                        .offset(x: 0, y: 0)
                        .zIndex(1)
                        .overlay(Text("zIndex: 1").font(.caption2).foregroundStyle(.white))
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green.opacity(0.9))
                        .frame(width: 120, height: 80)
                        .offset(x: 30, y: 20)
                        .zIndex(2)
                        .overlay(Text("zIndex: 2").font(.caption2).foregroundStyle(.white))
                }
                .frame(height: 140)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Interactive zIndex — click to bring to front").font(.headline).foregroundStyle(.primary)
                    APICallout(".zIndex(highlighted == i ? 10 : Double(i))")

                    HStack(spacing: 0) {
                        ForEach(0..<5) { i in
                            RoundedRectangle(cornerRadius: 8)
                                .fill([Color.red, .orange, .yellow, .teal, .blue][i].opacity(highlighted == i ? 0.9 : 0.5))
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Text("\(i)")
                                        .font(.headline).fontWeight(.bold)
                                        .foregroundStyle(.white)
                                )
                                .zIndex(highlighted == i ? 10 : Double(i))
                                .offset(x: CGFloat(i) * -12)
                                .onTapGesture { highlighted = i }
                                .scaleEffect(highlighted == i ? 1.1 : 1.0)
                                .animation(.spring(response: 0.3), value: highlighted)
                        }
                    }
                    .frame(height: 100)
                    Text("Tap a card to raise it above the others")
                        .font(.caption).foregroundStyle(.tertiary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Default stacking order").font(.headline).foregroundStyle(.primary)
                APICallout("// Without zIndex, later views in the parent body appear on top")
                Text("Without .zIndex(), SwiftUI draws children in source order — the last child appears on top. .zIndex() overrides this ordering.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("zIndex only affects sibling views within the same parent container.", systemImage: "square.3.layers.3d")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Negative values push views behind their default z position.", systemImage: "arrow.down.to.line")
                    .font(.callout).foregroundStyle(.secondary)
                Label("zIndex does not affect layout — only rendering order.", systemImage: "eye")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ZIndexPage().frame(width: 900, height: 700)
}
