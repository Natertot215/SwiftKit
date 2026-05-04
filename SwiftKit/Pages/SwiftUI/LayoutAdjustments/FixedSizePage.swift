import SwiftUI

// SwiftUI fixedSize(), layoutPriority() reference page.
// Source: Documentation/SwiftUI/layout-adjustments/fixedsize.md
// macOS 10.15+

struct FixedSizePage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("fixedSize / layoutPriority")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("fixedSize() prevents a view from being compressed. layoutPriority() controls which sibling claims available space first.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("fixedSize() — use ideal size").font(.headline).foregroundStyle(.primary)
                    APICallout(".fixedSize()  // both axes")
                    HStack {
                        Text("Without fixedSize — this long label gets truncated when the HStack is constrained")
                            .font(.callout).foregroundStyle(.primary)
                            .lineLimit(1)
                    }
                    .frame(width: 250)
                    .padding(8)
                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))

                    HStack {
                        Text("With fixedSize — this long label won't truncate and pushes the frame wider")
                            .font(.callout).foregroundStyle(.primary)
                            .fixedSize()
                    }
                    .frame(width: 250)
                    .padding(8)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("fixedSize(horizontal:vertical:) — selective axes").font(.headline).foregroundStyle(.primary)
                    APICallout(".fixedSize(horizontal: false, vertical: true)")
                    Text("This text is only fixed on the vertical axis — it wraps normally on the horizontal axis but won't be truncated vertically.")
                        .font(.callout).foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 280)
                        .padding(8)
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("layoutPriority(_:) — control space allocation").font(.headline).foregroundStyle(.primary)
                    APICallout(".layoutPriority(1)  // default is 0")
                    VStack(alignment: .leading, spacing: 12) {
                        priorityDemo(label: "Equal priority (default 0)", priorities: (0, 0))
                        priorityDemo(label: "Right has higher priority (1)", priorities: (0, 1))
                        priorityDemo(label: "Left has higher priority (1)", priorities: (1, 0))
                    }
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("layoutPriority governs compression order").font(.headline).foregroundStyle(.primary)
                Text("When space is tight, SwiftUI first compresses views with lower layoutPriority. Higher-priority views keep their ideal size longer before being compressed.")
                    .font(.callout).foregroundStyle(.secondary)
                APICallout("// Default priority is 0. Set to 1 to protect a view from compression.")
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("fixedSize() asks SwiftUI to use the view's ideal size instead of the offered size.", systemImage: "lock")
                    .font(.callout).foregroundStyle(.secondary)
                Label("The ideal size for Text is its full, unwrapped size. Use fixedSize(horizontal: false, vertical: true) to allow wrapping but prevent vertical clipping.", systemImage: "text.alignleft")
                    .font(.callout).foregroundStyle(.secondary)
                Label("layoutPriority is most useful in HStack/VStack when one view should take remaining space over others.", systemImage: "scale.3d")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func priorityDemo(label: String, priorities: (Double, Double)) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label).font(.caption).foregroundStyle(.tertiary)
            HStack(spacing: 4) {
                Text("Left: priority \(Int(priorities.0))")
                    .font(.callout).foregroundStyle(.primary)
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                    .layoutPriority(priorities.0)
                Text("Right: priority \(Int(priorities.1))")
                    .font(.callout).foregroundStyle(.primary)
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(.green.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                    .layoutPriority(priorities.1)
            }
            .frame(width: 340)
        }
    }
}

#Preview {
    FixedSizePage().frame(width: 900, height: 800)
}
