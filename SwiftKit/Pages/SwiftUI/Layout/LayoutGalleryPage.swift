import SwiftUI

// Dense custom-layout reference page. Absorbs all 14 placeholder leaves in the
// swiftui.custom-layout catalog folder — split across two dense pages.
// This page covers items 1–9:
//   • Composing custom layouts with SwiftUI (guide article)
//   • Layout (protocol)
//   • LayoutSubviews / LayoutSubview
//   • LayoutProperties
//   • ProposedViewSize
//   • ViewSpacing
//   • LayoutValueKey
//   • View/layoutValue(key:value:) modifier
//
// Sources:
//   Documentation/SwiftUI/custom-layout/layout.md
//   Documentation/SwiftUI/custom-layout/layoutsubview.md
//   Documentation/SwiftUI/custom-layout/layoutsubviews.md
//   Documentation/SwiftUI/custom-layout/layoutproperties.md
//   Documentation/SwiftUI/custom-layout/proposedviewsize.md
//   Documentation/SwiftUI/custom-layout/viewspacing.md
//   Documentation/SwiftUI/custom-layout/layoutvaluekey.md
//   Documentation/SwiftUI/custom-layout/layoutvalue(key:value:).md
//   Documentation/SwiftUI/custom-layout/composing-custom-layouts-with-swiftui.md
//
// Follows TypographyPage / GroupPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

// MARK: - Concrete demo Layout

private struct RadialLayout: Layout {
    var radius: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        let diameter = radius * 2
        return CGSize(width: proposal.width ?? diameter, height: proposal.height ?? diameter)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        guard !subviews.isEmpty else { return }
        let cx = bounds.midX
        let cy = bounds.midY
        let angle = (2 * Double.pi) / Double(subviews.count)
        for (i, subview) in subviews.enumerated() {
            let theta = angle * Double(i) - Double.pi / 2
            let x = cx + CGFloat(cos(theta)) * radius
            let y = cy + CGFloat(sin(theta)) * radius
            let size = subview.sizeThatFits(.unspecified)
            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: ProposedViewSize(size)
            )
        }
    }
}

// MARK: - Page

struct LayoutGalleryPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                referenceSection
                implementationSection
                composingGuideSection
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
            Text("Layout Protocol")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Implement the Layout protocol to build a fully custom container that participates in SwiftUI's layout system — contributing to parent proposals, querying subview ideal sizes, and placing every child precisely.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/custom-layout/  \u{00b7}  macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Layout  \u{00b7}  LayoutSubviews  \u{00b7}  LayoutSubview  \u{00b7}  LayoutProperties  \u{00b7}  ProposedViewSize  \u{00b7}  ViewSpacing  \u{00b7}  LayoutValueKey  \u{00b7}  layoutValue(key:value:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference

    private var referenceSection: some View {
        PageSection("Reference", subtitle: "Type signatures, protocol requirements, and supporting types — macOS 13.0+") {
            VStack(alignment: .leading, spacing: 28) {

                // Layout protocol
                VStack(alignment: .leading, spacing: 8) {
                    Text("Layout protocol")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("A two-method protocol. SwiftUI calls sizeThatFits first with a proposal, then calls placeSubviews to position each child. The protocol passes a Subviews collection (typealias for LayoutSubviews) at both call sites.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
protocol Layout: Animatable {
    associatedtype Cache = Void

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    ) -> CGSize

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    )

    // Optional:
    func makeCache(subviews: Subviews) -> Cache
    static var layoutProperties: LayoutProperties { get }
}
"""
                    )
                    APICallout("struct MyLayout: Layout { … }  // value type required")
                }

                Divider().opacity(0.4)

                // LayoutSubviews / LayoutSubview
                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutSubviews and LayoutSubview")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("LayoutSubviews is a RandomAccessCollection of LayoutSubview values, delivered to both protocol methods as the subviews: parameter. Each LayoutSubview proxies one child view and exposes measurement and placement APIs.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
typealias Subviews = LayoutSubviews     // LayoutSubviews: RandomAccessCollection

// Measurement
subview.sizeThatFits(.unspecified)      // ideal size (nil proposal both axes)
subview.sizeThatFits(ProposedViewSize(width: colWidth, height: nil))
subview.dimensions(in: proposal)        // ViewDimensions with alignment guides

// Placement (call once per subview inside placeSubviews)
subview.place(
    at: CGPoint(x: x, y: y),
    anchor: .topLeading,
    proposal: ProposedViewSize(width: colWidth, height: size.height)
)

// Spacing
subview.spacing   // ViewSpacing — preferred spacing from each of its four edges
"""
                    )
                }

                Divider().opacity(0.4)

                // LayoutProperties
                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutProperties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("An optional static property on Layout implementations. Declares the layout's primary orientation — used by AnyLayout during animated transitions and by SwiftUI to compute inter-view spacing hints from the enclosing context.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
static var layoutProperties: LayoutProperties {
    var p = LayoutProperties()
    p.stackOrientation = .vertical   // .horizontal | .vertical | nil
    return p
}
"""
                    )
                }

                Divider().opacity(0.4)

                // ProposedViewSize
                VStack(alignment: .leading, spacing: 8) {
                    Text("ProposedViewSize")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Wraps optional width and height. SwiftUI uses proposals to drive the two-pass layout system — a container proposes a size to each child, then places it. Three special static values cover common cases.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
struct ProposedViewSize {
    var width: CGFloat?
    var height: CGFloat?
}

ProposedViewSize(width: 200, height: 100)     // both constrained
ProposedViewSize(width: colWidth, height: nil) // width-only constraint
ProposedViewSize.zero          // zero × zero  (minimum size)
ProposedViewSize.infinity      // ∞ × ∞         (maximum size)
ProposedViewSize.unspecified   // nil × nil     (ideal / unconstrained)
"""
                    )
                }

                Divider().opacity(0.4)

                // ViewSpacing
                VStack(alignment: .leading, spacing: 8) {
                    Text("ViewSpacing")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Encapsulates the preferred spacing a view wants from its neighbors on each of its four edges. Use distance(to:along:) inside placeSubviews to get the resolved inter-view gap — the maximum of both views' preferred spacings on the shared axis.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
// Resolve the gap between two adjacent subviews
let gap = subviews[i].spacing.distance(
    to: subviews[i + 1].spacing,
    along: .horizontal
)
// .horizontal | .vertical
"""
                    )
                }

                Divider().opacity(0.4)

                // LayoutValueKey + layoutValue(key:value:)
                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutValueKey and layoutValue(key:value:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("LayoutValueKey lets callers annotate individual children with typed custom data. Conformers declare a defaultValue — the layout reads each subview's value via subscript. Pair with the layoutValue(key:value:) modifier on the child side.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
// 1. Declare the key (on the caller side, usually in an extension)
struct PriorityKey: LayoutValueKey {
    static let defaultValue: Int = 0
}

// 2. Annotate a child view with the modifier
Text("High-priority item")
    .layoutValue(key: PriorityKey.self, value: 2)

// 3. Read it inside the Layout implementation
func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize,
                   subviews: Subviews, cache: inout Cache) {
    for subview in subviews {
        let priority = subview[PriorityKey.self]   // Int
        …
    }
}
"""
                    )
                    APICallout(
"""
// Modifier signature
func layoutValue<K>(key: K.Type, value: K.Value) -> some View
    where K: LayoutValueKey
"""
                    )
                }
            }
        }
    }

    // MARK: Implementation Walkthrough — RadialLayout

    private var implementationSection: some View {
        PageSection(
            "Custom layout implementation walkthrough",
            subtitle: "RadialLayout — arranges subviews in a circle. Demonstrates sizeThatFits and placeSubviews."
        ) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Every custom layout is a value type conforming to Layout. SwiftUI calls sizeThatFits to determine the container's reported size, then calls placeSubviews with the resolved bounds. Both methods receive the same Subviews collection.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(
"""
struct RadialLayout: Layout {
    var radius: CGFloat

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) -> CGSize {
        let diameter = radius * 2
        return CGSize(
            width:  proposal.width  ?? diameter,
            height: proposal.height ?? diameter
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        guard !subviews.isEmpty else { return }
        let angle = (2 * .pi) / Double(subviews.count)
        for (i, subview) in subviews.enumerated() {
            let theta = angle * Double(i) - .pi / 2
            let x = bounds.midX + cos(theta) * radius
            let y = bounds.midY + sin(theta) * radius
            subview.place(at: .init(x: x, y: y), anchor: .center,
                          proposal: .unspecified)
        }
    }
}
"""
                )

                VStack(alignment: .leading, spacing: 8) {
                    Text("Live — RadialLayout with 8 items (radius 80 pt)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    RadialLayout(radius: 80) {
                        ForEach(["A", "B", "C", "D", "E", "F", "G", "H"], id: \.self) { label in
                            Text(label)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .frame(width: 32, height: 32)
                                .background(.tint.opacity(0.15), in: Circle())
                                .foregroundStyle(.tint)
                        }
                    }
                    .frame(width: 240, height: 240)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 12))
                    .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Cache with makeCache(subviews:) for expensive measurements.",
                        detail: "sizeThatFits is called multiple times per layout pass with different proposals. Pre-compute per-subview sizes in makeCache and pass them through the inout cache parameter to avoid re-measuring on every call.",
                        symbol: "memorychip"
                    )
                    noteRow(
                        title: "sizeThatFits must be a pure function.",
                        detail: "Do not store mutable state inside sizeThatFits. SwiftUI may call it with speculative proposals and discard the results. Only placeSubviews produces real side-effects (placing children).",
                        symbol: "function"
                    )
                    noteRow(
                        title: "Layout conforms to Animatable — animate properties across transitions.",
                        detail: "Declare animatable properties in animatableData. AnyLayout can then morph between two Layout values of the same type, animating their parameters (e.g., radius from 40 → 80) during a withAnimation block.",
                        symbol: "wand.and.sparkles"
                    )
                }
            }
        }
    }

    // MARK: Composing Custom Layouts Guide

    private var composingGuideSection: some View {
        PageSection(
            "Composing custom layouts \u{2014} guide",
            subtitle: "Documentation/SwiftUI/custom-layout/composing-custom-layouts-with-swiftui.md  \u{00b7}  macOS 13.0+"
        ) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Apple's 'Composing custom layouts with SwiftUI' article walks the Layout protocol from a minimal EquallySized layout through progressively more capable implementations.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Step progression")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
// Step 1 — Declare a struct conforming to Layout
struct EqualWidthVStack: Layout { … }

// Step 2 — Implement sizeThatFits — return container's total size
func sizeThatFits(proposal: ProposedViewSize,
                  subviews: Subviews,
                  cache: inout Void) -> CGSize {
    let maxWidth = subviews.map { $0.sizeThatFits(.unspecified).width }.max() ?? 0
    let totalHeight = subviews.reduce(0) { $0 + $1.sizeThatFits(.unspecified).height }
    return CGSize(width: maxWidth, height: totalHeight)
}

// Step 3 — Implement placeSubviews — position every child
func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize,
                   subviews: Subviews, cache: inout Void) {
    var y = bounds.minY
    for subview in subviews {
        let size = subview.sizeThatFits(.unspecified)
        subview.place(at: .init(x: bounds.minX, y: y),
                      anchor: .topLeading,
                      proposal: ProposedViewSize(size))
        y += size.height
    }
}

// Step 4 (optional) — Implement makeCache for expensive pre-computation
func makeCache(subviews: Subviews) -> CacheData {
    CacheData(sizes: subviews.map { $0.sizeThatFits(.unspecified) })
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Incorporating ViewSpacing")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The article demonstrates a spacing-aware variant that reads each subview's ViewSpacing and resolves the gap between adjacent views — matching the behavior of VStack's systemSpacing logic.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
// Inter-view spacing resolved from ViewSpacing preferences
var y = bounds.minY
for (i, subview) in subviews.enumerated() {
    if i > 0 {
        let gap = subviews[i - 1].spacing.distance(
            to: subview.spacing,
            along: .vertical
        )
        y += gap
    }
    let size = subview.sizeThatFits(.unspecified)
    subview.place(at: .init(x: bounds.minX, y: y), anchor: .topLeading,
                  proposal: ProposedViewSize(size))
    y += size.height
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Animated layout switching via AnyLayout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The article concludes with AnyLayout as the mechanism for animated transitions — see AnyLayoutPage for the interactive demo.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(
"""
// AnyLayout erases the concrete type; withAnimation animates the swap
let layout: AnyLayout = isVertical
    ? AnyLayout(VStackLayout(spacing: 8))
    : AnyLayout(HStackLayout(spacing: 8))

layout { content }  // callAsFunction syntax
"""
                    )
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Performance guidance, constraints, and reactive behavior.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Layout types must be value types.",
                    detail: "Layout conformers are structs. SwiftUI relies on value semantics to detect changes — reference types (classes) are not valid conformers.",
                    symbol: "cube"
                )
                noteRow(
                    title: "sizeThatFits is called speculatively — keep it allocation-free.",
                    detail: "SwiftUI calls sizeThatFits with multiple proposals (zero, infinity, unspecified, and the actual available size) before committing. Avoid allocating inside sizeThatFits; cache all per-subview state in makeCache.",
                    symbol: "bolt"
                )
                noteRow(
                    title: "ProposedViewSize.unspecified means 'give me your ideal size'.",
                    detail: "When you pass .unspecified to sizeThatFits on a subview, you're asking for its intrinsic content size — uninfluenced by any container constraint. This is the safe default for a first-pass measurement.",
                    symbol: "arrow.up.left.and.arrow.down.right"
                )
                noteRow(
                    title: "Layout animates via Animatable conformance.",
                    detail: "Because Layout extends Animatable, you can animate layout parameters (column count, radius, spacing) using standard SwiftUI animation. Wrap the change in withAnimation and use AnyLayout if switching between heterogeneous layout types.",
                    symbol: "wand.and.sparkles"
                )
                noteRow(
                    title: "LayoutValueKey is the preferred way to pass per-child data into a Layout.",
                    detail: "Prefer LayoutValueKey over environment values or closure captures for passing data from caller to layout algorithm. It survives type-erasure (AnyLayout) and does not require a surrounding view context.",
                    symbol: "key"
                )
                noteRow(
                    title: "The Layout protocol is macOS 13.0+ (iOS 16.0+).",
                    detail: "Guard with #available(macOS 13, *) if your deployment target is earlier. For older targets the closest fallback is GeometryReader + ZStack, which is far more limited.",
                    symbol: "calendar"
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

extension LayoutGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.layout",
        title: "Layout",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Layout",
            "CustomLayout",
            "LayoutSubviews",
            "LayoutSubview",
            "LayoutProperties",
            "ProposedViewSize",
            "ViewSpacing",
            "LayoutValueKey",
            "View/layoutValue(key:value:)",
            "LayoutRotationUnaryLayout",
            "Composing custom layouts with SwiftUI",
            "swiftui.layout-adjustments.layoutrotationunarylayout",
        ],
        blurb: "A protocol for defining a custom layout container. Implementing sizeThatFits and placeSubviews lets you publish a layout that participates in animation, measurement, and AnyLayout substitution alongside the built-in stacks.",
        signature: "@preconcurrency protocol Layout : Sendable, Animatable",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/custom-layout/layout.md",
        page: { AnyView(LayoutGalleryPage()) }
    )
}

#Preview {
    LayoutGalleryPage()
        .frame(width: 1100, height: 1400)
}
