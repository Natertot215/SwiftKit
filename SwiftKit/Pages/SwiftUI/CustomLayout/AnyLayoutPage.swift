import SwiftUI

// Dense AnyLayout / concrete Layout conformers reference page.
// Absorbs items 10–14 of the swiftui.custom-layout catalog folder:
//   • AnyLayout (type eraser)
//   • HStackLayout
//   • VStackLayout
//   • ZStackLayout
//   • GridLayout
//
// Sources:
//   Documentation/SwiftUI/custom-layout/anylayout.md
//   Documentation/SwiftUI/custom-layout/hstacklayout.md
//   Documentation/SwiftUI/custom-layout/vstacklayout.md
//   Documentation/SwiftUI/custom-layout/zstacklayout.md
//   Documentation/SwiftUI/custom-layout/gridlayout.md
//
// Follows TypographyPage / GroupPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

struct AnyLayoutPage: View {
    @State private var useVertical = false
    @State private var useGrid = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                referenceSection
                animatedTransitionSection
                conformersSection
                gridDemoSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("AnyLayout / Layout Conformers")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("AnyLayout is the type-erasing wrapper that enables animated transitions between heterogeneous Layout implementations. The four concrete conformers — HStackLayout, VStackLayout, ZStackLayout, GridLayout — are the Layout-protocol equivalents of the standard SwiftUI stack containers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/custom-layout/anylayout.md  \u{00b7}  macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("AnyLayout  \u{00b7}  HStackLayout  \u{00b7}  VStackLayout  \u{00b7}  ZStackLayout  \u{00b7}  GridLayout")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference

    private var referenceSection: some View {
        PageSection("Reference", subtitle: "Type signatures — macOS 13.0+") {
            VStack(alignment: .leading, spacing: 28) {

                // AnyLayout
                VStack(alignment: .leading, spacing: 8) {
                    Text("AnyLayout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("A type-erasing wrapper around any Layout conformer. Stores the concrete type at runtime while presenting a uniform Layout interface. Calling it as a function (callAsFunction) applies the wrapped layout to a ViewBuilder closure. The primary use case is animating a swap between two different layout types via withAnimation.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
struct AnyLayout: Layout {
    init<L: Layout>(_ layout: L)
}

// Initialization
let layout = AnyLayout(HStackLayout(spacing: 8))
let layout = AnyLayout(VStackLayout(alignment: .leading))
let layout = AnyLayout(GridLayout(horizontalSpacing: 8, verticalSpacing: 8))

// Call-as-function syntax — applies the layout to a ViewBuilder closure
layout {
    Text("A")
    Text("B")
    Text("C")
}
"""
                    )
                }

                Divider().opacity(0.4)

                // HStackLayout
                VStack(alignment: .leading, spacing: 8) {
                    Text("HStackLayout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The Layout-conforming equivalent of HStack. Accepts the same alignment and spacing parameters. Use anywhere a Layout value is needed (e.g., stored in an AnyLayout, or used directly as a container).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
struct HStackLayout: Layout {
    init(
        alignment: VerticalAlignment = .center,
        spacing: CGFloat? = nil
    )
}

HStackLayout()                             // center-aligned, system spacing
HStackLayout(alignment: .top, spacing: 12) // top-aligned, 12 pt gap
HStackLayout(alignment: .bottom)           // bottom-aligned, system spacing
"""
                    )
                }

                Divider().opacity(0.4)

                // VStackLayout
                VStack(alignment: .leading, spacing: 8) {
                    Text("VStackLayout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The Layout-conforming equivalent of VStack. Identical semantics to VStack but participates in the Layout protocol, making it composable with AnyLayout.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
struct VStackLayout: Layout {
    init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil
    )
}

VStackLayout()                              // center-aligned, system spacing
VStackLayout(alignment: .leading, spacing: 8) // leading-aligned, 8 pt gap
VStackLayout(alignment: .trailing)           // trailing-aligned, system spacing
"""
                    )
                }

                Divider().opacity(0.4)

                // ZStackLayout
                VStack(alignment: .leading, spacing: 8) {
                    Text("ZStackLayout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The Layout-conforming equivalent of ZStack. Layers all children in the z-axis anchored to the specified alignment point.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
struct ZStackLayout: Layout {
    init(alignment: Alignment = .center)
}

ZStackLayout()                        // centered overlay
ZStackLayout(alignment: .topLeading)  // pinned to top-leading
ZStackLayout(alignment: .bottom)      // all children anchored at bottom
"""
                    )
                }

                Divider().opacity(0.4)

                // GridLayout
                VStack(alignment: .leading, spacing: 8) {
                    Text("GridLayout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The Layout-conforming equivalent of Grid. Lays out children in rows and columns with cross-row alignment support. Best used with AnyLayout to animate between a grid arrangement and a stack arrangement.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
struct GridLayout: Layout {
    init(
        alignment: Alignment = .center,
        horizontalSpacing: CGFloat? = nil,
        verticalSpacing: CGFloat? = nil
    )
}

GridLayout()                                   // centered, system spacing
GridLayout(horizontalSpacing: 8, verticalSpacing: 8)
GridLayout(alignment: .topLeading, horizontalSpacing: 4, verticalSpacing: 4)
"""
                    )
                }
            }
        }
    }

    // MARK: Animated Layout Transition

    private var animatedTransitionSection: some View {
        PageSection(
            "Animated layout transition",
            subtitle: "Toggle between HStackLayout and VStackLayout via AnyLayout — spring animation."
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Store an AnyLayout in a computed property driven by @State. Changing the wrapped layout type inside withAnimation produces a smooth morph — SwiftUI animates the subview positions rather than cross-fading two separate arrangements.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(
"""
@State private var useVertical = false

// Recompute the layout whenever the state changes
let layout: AnyLayout = useVertical
    ? AnyLayout(VStackLayout(spacing: 8))
    : AnyLayout(HStackLayout(spacing: 8))

Toggle("Vertical stack", isOn: $useVertical.animation(.spring(response: 0.35)))
    .toggleStyle(.switch)

layout {
    ForEach(["Swift", "UIKit", "SwiftUI"], id: \\.self) { label in
        Text(label)
            .padding(.horizontal, 12).padding(.vertical, 6)
            .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
            .foregroundStyle(.tint)
    }
}
"""
                )

                VStack(alignment: .leading, spacing: 8) {
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
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                                .foregroundStyle(.tint)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                noteRow(
                    title: "Transition is a position animation, not a cross-fade.",
                    detail: "SwiftUI keeps the same view identity across the layout swap and animates each subview from its old frame to its new frame. Views are never remounted — no state is lost.",
                    symbol: "wand.and.sparkles"
                )
            }
        }
    }

    // MARK: Concrete Conformers Reference

    private var conformersSection: some View {
        PageSection(
            "Concrete Layout conformers",
            subtitle: "HStackLayout, VStackLayout, ZStackLayout, GridLayout — when to choose each."
        ) {
            VStack(alignment: .leading, spacing: 20) {
                Text("The four concrete conformers map one-to-one to their corresponding SwiftUI container types. Choose the Layout variant when you need to store, switch, or animate the layout type itself — not just its content.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("HStackLayout vs HStack")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
// HStack — standard usage; layout type is fixed at compile time
HStack(alignment: .top, spacing: 12) { … }

// HStackLayout — use when the layout type itself must be a value
AnyLayout(HStackLayout(alignment: .top, spacing: 12)) { … }
// or used directly as a container without AnyLayout
HStackLayout(alignment: .top, spacing: 12) { … }
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("VStackLayout vs VStack")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
VStack(alignment: .leading) { … }            // standard
AnyLayout(VStackLayout(alignment: .leading)) { … }  // Layout-protocol form
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ZStackLayout vs ZStack")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
ZStack(alignment: .topLeading) { … }            // standard
AnyLayout(ZStackLayout(alignment: .topLeading)) { … }  // Layout-protocol form
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("GridLayout vs Grid — cross-row alignment")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("GridLayout is the go-to choice for animated transitions between a grid and a stack because it accepts the same children as HStackLayout/VStackLayout (flat, not GridRow-structured).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
// Grid (standard) — requires GridRow children for column alignment
Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
    GridRow { … }
}

// GridLayout (Layout conformer) — flat children, used with AnyLayout
AnyLayout(GridLayout(horizontalSpacing: 8, verticalSpacing: 8)) {
    ForEach(items) { item in ItemView(item) }
}
"""
                    )
                }
            }
        }
    }

    // MARK: Grid / Stack Animated Demo

    private var gridDemoSection: some View {
        PageSection(
            "Grid \u{2194} HStack animated demo",
            subtitle: "Toggle between GridLayout and HStackLayout using AnyLayout."
        ) {
            VStack(alignment: .leading, spacing: 16) {
                APICallout(
"""
@State private var useGrid = false

let layout: AnyLayout = useGrid
    ? AnyLayout(GridLayout(horizontalSpacing: 8, verticalSpacing: 8))
    : AnyLayout(HStackLayout(spacing: 8))

Toggle("Use grid", isOn: $useGrid.animation(.spring(response: 0.4)))

layout {
    ForEach(0..<6) { i in
        RoundedRectangle(cornerRadius: 6)
            .fill(.tint.opacity(0.2))
            .frame(width: 48, height: 48)
            .overlay(Text("\\(i + 1)").font(.caption))
    }
}
"""
                )

                Toggle("Use grid", isOn: $useGrid.animation(.spring(response: 0.4)))
                    .toggleStyle(.switch)
                    .font(.callout)

                let gridOrStack: AnyLayout = useGrid
                    ? AnyLayout(GridLayout(horizontalSpacing: 8, verticalSpacing: 8))
                    : AnyLayout(HStackLayout(spacing: 8))

                gridOrStack {
                    ForEach(0..<6) { i in
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.tint.opacity(Double(i + 2) / 10.0))
                            .frame(width: 48, height: 48)
                            .overlay(
                                Text("\(i + 1)")
                                    .font(.caption)
                                    .foregroundStyle(.primary)
                            )
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "AnyLayout semantics, animation tips, and conformer selection.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "AnyLayout enables matched-geometry animation across layout boundaries.",
                    detail: "Combine AnyLayout with .matchedGeometryEffect to animate shared views moving between entirely different container structures — a grid becoming a list, for example.",
                    symbol: "arrow.left.arrow.right.circle"
                )
                noteRow(
                    title: "callAsFunction is the call-site syntax for AnyLayout.",
                    detail: "AnyLayout conforms to Layout which provides callAsFunction(_ content:). This is what makes layout { … } valid Swift — it's not special syntax, it's a method call on the Layout type.",
                    symbol: "function"
                )
                noteRow(
                    title: "HStackLayout / VStackLayout are the right defaults for animated toggles.",
                    detail: "For a simple horizontal-to-vertical transition, HStackLayout and VStackLayout wrapped in AnyLayout are the canonical pattern. Reach for GridLayout when you need cross-row column alignment in the 'expanded' state.",
                    symbol: "rectangle.grid.2x2"
                )
                noteRow(
                    title: "ZStackLayout layers without proposing a size to children.",
                    detail: "Like ZStack, ZStackLayout reports the size of its largest child. Each child receives the full proposed size from ZStackLayout, and is positioned according to the alignment anchor.",
                    symbol: "square.stack"
                )
                noteRow(
                    title: "GridLayout's children are flat — not wrapped in GridRow.",
                    detail: "Unlike Grid (which requires GridRow for column alignment), GridLayout treats each direct child as a separate item and flows them into rows automatically based on available width. This makes it composable with ForEach.",
                    symbol: "tablecells"
                )
            }
        }
    }

    // MARK: Helpers

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

#Preview {
    AnyLayoutPage()
        .frame(width: 1100, height: 1400)
}
