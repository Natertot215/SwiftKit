import SwiftUI

// Dense Stacks reference page. Consolidates seven previously-separate leaves:
//   • HStack                                                            (struct)
//   • VStack                                                            (struct)
//   • ZStack                                                            (struct)
//   • View/zIndex(_:)                                                   (modifier)
//   • Building layouts with stack views                                 (guide)
//   • Picking container views for your content                          (guide)
//   • Adding a background to your view (background-section header)     (guide)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/hstack.md
//   Documentation/SwiftUI/layout-fundamentals/vstack.md
//   Documentation/SwiftUI/layout-fundamentals/zstack.md
//   Documentation/SwiftUI/layout-fundamentals/zindex(_:).md
//   macOS 10.15+

struct StacksGalleryPage: View {
    @State private var highlighted: Int = 2

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                vstackSection
                hstackSection
                zstackSection
                zindexSection
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
            Text("Stacks")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Fundamental layout containers that arrange children vertically (VStack), horizontally (HStack), or overlapping in depth (ZStack). The zIndex(_:) modifier controls rendering order within a ZStack or any parent.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/ \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("VStack  \u{00b7}  HStack  \u{00b7}  ZStack  \u{00b7}  View/zIndex(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: VStack

    private var vstackSection: some View {
        PageSection("VStack", subtitle: "struct VStack<Content: View> \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Arranges its children in a vertical line. Children are spaced by a system default of 8pt unless overridden. Alignment applies on the horizontal axis.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("VStack(alignment: .leading, spacing: 8) { \u{2026} }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default (center alignment, nil spacing)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack {
                        rowChip("First item")
                        rowChip("Second item")
                        rowChip("Third item")
                    }
                    APICallout("VStack { Text(\u{2026}); Text(\u{2026}); Text(\u{2026}) }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        ForEach(Array([HorizontalAlignment.leading, .center, .trailing].enumerated()), id: \.offset) { _, align in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(alignLabel(align))
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                VStack(alignment: align, spacing: 4) {
                                    Text("Short")
                                        .padding(.horizontal, 8).padding(.vertical, 3)
                                        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 4))
                                        .foregroundStyle(.secondary)
                                    Text("A longer text item")
                                        .padding(.horizontal, 8).padding(.vertical, 3)
                                        .background(.tint.opacity(0.18), in: RoundedRectangle(cornerRadius: 4))
                                        .foregroundStyle(.tint)
                                }
                                .font(.caption)
                            }
                        }
                    }
                    APICallout("VStack(alignment: .leading / .center / .trailing) { \u{2026} }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Spacing variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 32) {
                        ForEach([0, 8, 24], id: \.self) { sp in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("spacing: \(sp)")
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                VStack(spacing: CGFloat(sp)) {
                                    ForEach(["A", "B", "C"], id: \.self) { l in
                                        Text(l)
                                            .frame(width: 28, height: 28)
                                            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 4))
                                            .foregroundStyle(.secondary)
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    APICallout("VStack(spacing: 0 / 8 / 24) { \u{2026} }")
                }

                noteRow(
                    title: "VStack expands to the widest child on the horizontal axis.",
                    detail: "spacing: nil uses the system default (8pt on macOS). Use spacing: 0 to eliminate gaps entirely.",
                    symbol: "arrow.up.and.down"
                )
            }
        }
    }

    // MARK: HStack

    private var hstackSection: some View {
        PageSection("HStack", subtitle: "struct HStack<Content: View> \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Arranges its children in a horizontal line. Alignment applies on the vertical axis (top, center, bottom, firstTextBaseline, lastTextBaseline).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("HStack(alignment: .center, spacing: 12) { \u{2026} }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default (center alignment)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 10) {
                        ForEach(["Alpha", "Beta", "Gamma"], id: \.self) { label in
                            Text(label)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                                .foregroundStyle(.tint)
                                .font(.callout)
                        }
                    }
                    APICallout("HStack(spacing: 10) { Text(\u{2026}); Text(\u{2026}); Text(\u{2026}) }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment variants — .top / .center / .bottom")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Array([VerticalAlignment.top, .center, .bottom].enumerated()), id: \.offset) { _, align in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(vAlignLabel(align))
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                HStack(alignment: align, spacing: 6) {
                                    swatch(height: 40)
                                    swatch(height: 64)
                                    swatch(height: 50)
                                }
                            }
                        }
                    }
                    APICallout("HStack(alignment: .top / .center / .bottom) { \u{2026} }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Text-baseline alignment")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .firstTextBaseline, spacing: 6) {
                        Text("Large")
                            .font(.largeTitle)
                            .foregroundStyle(.primary)
                        Text("aligned")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("to baseline")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                    APICallout("HStack(alignment: .firstTextBaseline) { \u{2026} }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Spacing variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach([0, 8, 24], id: \.self) { sp in
                            VStack(alignment: .leading, spacing: 2) {
                                Text("spacing: \(sp)")
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                HStack(spacing: CGFloat(sp)) {
                                    ForEach(["A", "B", "C", "D"], id: \.self) { l in
                                        Text(l)
                                            .frame(width: 28, height: 28)
                                            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 4))
                                            .foregroundStyle(.secondary)
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    APICallout("HStack(spacing: 0 / 8 / 24) { \u{2026} }")
                }

                noteRow(
                    title: "HStack expands to the tallest child on the vertical axis.",
                    detail: "firstTextBaseline and lastTextBaseline are most useful when mixing different font sizes in a row.",
                    symbol: "arrow.left.and.right"
                )
            }
        }
    }

    // MARK: ZStack

    private var zstackSection: some View {
        PageSection("ZStack", subtitle: "struct ZStack<Content: View> \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Overlays its children, drawing them back-to-front. The last child in the body appears on top. Alignment governs how children are positioned in the 2D plane when they have different sizes.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("ZStack(alignment: .bottomTrailing) { \u{2026} }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default (center alignment)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.tint.opacity(0.2))
                            .frame(width: 180, height: 100)
                        Text("Overlaid label")
                            .font(.callout)
                            .foregroundStyle(.primary)
                    }
                    APICallout("ZStack { BackgroundView(); ForegroundView() }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 20) {
                        ForEach(alignmentCases, id: \.label) { item in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.label)
                                    .font(.caption2)
                                    .foregroundStyle(.tertiary)
                                ZStack(alignment: item.alignment) {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.fill.tertiary)
                                        .frame(width: 72, height: 56)
                                    Circle()
                                        .fill(.tint.opacity(0.7))
                                        .frame(width: 18, height: 18)
                                }
                            }
                        }
                    }
                    APICallout("ZStack(alignment: .topLeading / .center / .bottomTrailing \u{2026}) { \u{2026} }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Badge pattern")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "envelope.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                            .padding()
                        Text("3")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .frame(width: 18, height: 18)
                            .background(.red, in: Circle())
                            .foregroundStyle(.white)
                            .offset(x: 4, y: -4)
                    }
                    APICallout("ZStack(alignment: .topTrailing) { Icon(); Badge() }")
                }

                noteRow(
                    title: "ZStack draws children back-to-front — last child appears on top.",
                    detail: "The alignment applies simultaneously to all layers. Use .overlay(alignment:content:) instead when you need one layer to affect another's layout.",
                    symbol: "square.3.layers.3d"
                )
            }
        }
    }

    // MARK: zIndex

    private var zindexSection: some View {
        PageSection("View/zIndex(_:)", subtitle: "func zIndex(_ value: Double) -> some View \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Overrides a view's Z position within its parent. Higher values appear on top; the default is 0.0. Applies within any parent container, not just ZStack.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(".zIndex(1.0)")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Static z-order — three overlapping cards")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .frame(width: 120, height: 80)
                            .offset(x: -30, y: -16)
                            .zIndex(0)
                            .overlay(Text("zIndex: 0").font(.caption2).foregroundStyle(.white))
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.7))
                            .frame(width: 120, height: 80)
                            .zIndex(1)
                            .overlay(Text("zIndex: 1").font(.caption2).foregroundStyle(.white))
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green.opacity(0.9))
                            .frame(width: 120, height: 80)
                            .offset(x: 30, y: 16)
                            .zIndex(2)
                            .overlay(Text("zIndex: 2").font(.caption2).foregroundStyle(.white))
                    }
                    .frame(height: 140)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Interactive — tap to bring to front")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".zIndex(highlighted == i ? 10 : Double(i))")
                    HStack(spacing: 0) {
                        ForEach(0..<5) { i in
                            RoundedRectangle(cornerRadius: 8)
                                .fill([Color.red, .orange, .yellow, .teal, .blue][i]
                                    .opacity(highlighted == i ? 0.9 : 0.5))
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Text("\(i)")
                                        .font(.headline)
                                        .fontWeight(.bold)
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
                    Text("Tap a card to raise it above the others.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "zIndex only affects siblings within the same parent.",
                        detail: "It has no cross-container effect. A view with zIndex(100) cannot paint over a view in a different parent.",
                        symbol: "square.3.layers.3d"
                    )
                    noteRow(
                        title: "Negative values push views behind their default z position.",
                        detail: "Without .zIndex(), SwiftUI draws children in source order — the last child appears on top. Explicit .zIndex() overrides this ordering.",
                        symbol: "arrow.down.to.line"
                    )
                    noteRow(
                        title: "zIndex does not affect layout — only rendering order.",
                        detail: "Layout measurements are unaffected. Use this for visual overlap control, not to change how space is distributed.",
                        symbol: "eye"
                    )
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: "Choose the stack based on the major axis of arrangement.",
                    detail: "VStack for vertical lists of views; HStack for horizontal rows; ZStack for overlapping layers. Nest them freely — the most common pattern is VStack { HStack { \u{2026} }; HStack { \u{2026} } }.",
                    symbol: "square.grid.2x2"
                )
                noteRow(
                    title: "VStack and HStack vs List.",
                    detail: "Use VStack/HStack for small, static collections of views. Use List for long, scrollable, selectable, or dynamic data — it adds separators, swipe actions, and selection behavior.",
                    symbol: "list.bullet"
                )
                noteRow(
                    title: "Spacing nil vs 0.",
                    detail: "nil uses the platform default (8pt on macOS). 0 removes all gaps. Use nil for most layouts; 0 only when you explicitly want items flush.",
                    symbol: "ruler"
                )
                noteRow(
                    title: "Performance: stacks evaluate all children eagerly.",
                    detail: "For large or unbounded collections, prefer LazyVStack/LazyHStack inside a ScrollView. Eager stacks measure every child on first layout — avoid them for 50+ items.",
                    symbol: "bolt"
                )
                noteRow(
                    title: "ZStack vs .overlay.",
                    detail: ".overlay(alignment:content:) is preferred when the background view should set the layout size and the overlay is decorative. ZStack is preferred when both layers are equally important to the layout.",
                    symbol: "square.on.square"
                )
            }
        }
    }

    // MARK: Helpers

    private func rowChip(_ label: String) -> some View {
        Label(label, systemImage: "circle.fill")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    private func swatch(height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(.tint.opacity(0.3))
            .frame(width: 44, height: height)
    }

    private func alignLabel(_ a: HorizontalAlignment) -> String {
        switch a {
        case .leading:  return ".leading"
        case .center:   return ".center"
        case .trailing: return ".trailing"
        default:        return "custom"
        }
    }

    private func vAlignLabel(_ a: VerticalAlignment) -> String {
        switch a {
        case .top:    return ".top"
        case .center: return ".center"
        case .bottom: return ".bottom"
        default:      return "custom"
        }
    }

    private struct AlignmentCase {
        let label: String
        let alignment: Alignment
    }

    private let alignmentCases: [AlignmentCase] = [
        AlignmentCase(label: ".topLeading",      alignment: .topLeading),
        AlignmentCase(label: ".center",          alignment: .center),
        AlignmentCase(label: ".bottomTrailing",  alignment: .bottomTrailing),
        AlignmentCase(label: ".bottomLeading",   alignment: .bottomLeading),
    ]

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

extension StacksGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.stacks",
        title: "Stacks",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Stacks",
            "HStack",
            "VStack",
            "ZStack",
            "View/zIndex(_:)",
            "Picking container views for your content",
            "Building layouts with stack views",
            "swiftui.layout-fundamentals.picking-container-views-for-your-content",
            "swiftui.layout-fundamentals.building-layouts-with-stack-views",
        ],
        blurb: "Arrange views in horizontal, vertical, or layered stacks. SwiftUI's HStack, VStack, and ZStack render their subviews eagerly along an axis (or front-to-back), with zIndex(_:) controlling overlap order.",
        signature: "@frozen struct HStack<Content> · @frozen struct VStack<Content> · @frozen struct ZStack<Content>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/hstack.md",
        page: { AnyView(StacksGalleryPage()) }
    )
}

#Preview {
    StacksGalleryPage()
        .frame(width: 1000, height: 1100)
}
