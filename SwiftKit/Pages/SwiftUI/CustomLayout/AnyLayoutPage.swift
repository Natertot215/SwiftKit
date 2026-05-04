import SwiftUI

// SwiftUI AnyLayout, HStackLayout, VStackLayout, ZStackLayout, GridLayout reference page.
// Source: Documentation/SwiftUI/custom-layout/anylayout.md
// macOS 13.0+

struct AnyLayoutPage: View {
    @State private var useVertical = false
    @State private var useGrid = false

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("AnyLayout / HStackLayout / VStackLayout / ZStackLayout / GridLayout")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Type-erased Layout wrapper enabling animated layout transitions. The concrete stack types (HStackLayout, VStackLayout, etc.) conform to Layout for use with AnyLayout.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/custom-layout/anylayout.md · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout("let layout: AnyLayout = useVertical ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())")
                Toggle("Vertical stack", isOn: $useVertical.animation(.spring(response: 0.35)))
                    .toggleStyle(.switch)
                    .font(.callout)

                let layout: AnyLayout = useVertical
                    ? AnyLayout(VStackLayout(spacing: 8))
                    : AnyLayout(HStackLayout(spacing: 8))

                layout {
                    ForEach(["Swift", "UIKit", "SwiftUI"], id: \.self) { label in
                        Text(label)
                            .font(.callout)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                            .foregroundStyle(.tint)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Text("Transition is animated — SwiftUI morphs between layouts without remounting views")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("HStackLayout / VStackLayout / ZStackLayout").font(.headline).foregroundStyle(.primary)
                    APICallout("HStackLayout(alignment: .top, spacing: 12)")
                    Text("These are Layout-conforming types corresponding to HStack, VStack, ZStack. They accept the same alignment and spacing parameters. Use them anywhere a Layout value is needed.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout("VStackLayout(alignment: .leading, spacing: 8)")
                    APICallout("ZStackLayout(alignment: .center)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("GridLayout").font(.headline).foregroundStyle(.primary)
                    APICallout("AnyLayout(GridLayout(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8))")
                    Text("GridLayout is the Layout-conforming equivalent of Grid. Use with AnyLayout to animate between grid and stack arrangements.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Animated transition between Grid and HStack").font(.headline).foregroundStyle(.primary)
                    Toggle("Use grid", isOn: $useGrid.animation(.spring(response: 0.4)))
                        .toggleStyle(.switch)
                        .font(.callout)

                    let gridOrStack: AnyLayout = useGrid
                        ? AnyLayout(GridLayout(horizontalSpacing: 8, verticalSpacing: 8))
                        : AnyLayout(HStackLayout(spacing: 8))

                    gridOrStack {
                        ForEach(0..<6) { i in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color(hue: Double(i) / 6.0, saturation: 0.5, brightness: 0.7).opacity(0.4))
                                .frame(width: 48, height: 48)
                                .overlay(Text("\(i + 1)").font(.caption).foregroundStyle(.primary))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Composing custom layouts with SwiftUI — article overview").font(.headline).foregroundStyle(.primary)
                Text("The 'Composing custom layouts with SwiftUI' article walks through building progressively more complex Layout implementations: from a simple HStack clone, to ViewSpacing-aware radial layouts. Key APIs: Layout, AnyLayout, Subviews, LayoutSubview, ProposedViewSize.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("AnyLayout enables SwiftUI's matched-geometry animation across different container types.", systemImage: "wand.and.sparkles")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Calling AnyLayout as a function: layout { … } — this uses Layout's callAsFunction.", systemImage: "function")
                    .font(.callout).foregroundStyle(.secondary)
                Label("HStackLayout/VStackLayout are the right default choices; use GridLayout when you need cross-row alignment.", systemImage: "tablecells")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AnyLayoutPage().frame(width: 900, height: 900)
}
