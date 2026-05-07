import SwiftUI

// SwiftUI Alignment, HorizontalAlignment, VerticalAlignment, AlignmentID,
// alignmentGuide(_:computeValue:), ViewDimensions reference page.
// Source: Documentation/SwiftUI/layout-adjustments/alignment.md
// macOS 10.15+

private extension HorizontalAlignment {
    struct CustomCenter: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    static let customCenter = HorizontalAlignment(CustomCenter.self)
}

struct AlignmentGalleryPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Alignment / AlignmentID / alignmentGuide")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Named alignment guides that propagate through view hierarchies. HorizontalAlignment, VerticalAlignment, and Alignment combine into a 2D anchor.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/alignment.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Built-in HorizontalAlignment values").font(.headline).foregroundStyle(.primary)
                    VStack(spacing: 4) {
                        ForEach(["leading", "center", "trailing"], id: \.self) { labelStr in
                            let alignment: HorizontalAlignment = labelStr == "leading" ? .leading : labelStr == "center" ? .center : .trailing
                            VStack(alignment: alignment, spacing: 4) {
                                Text(labelStr)
                                ForEach(["Short", "A medium text", "The longest text here"], id: \.self) { t in
                                    Text(t).font(.callout).foregroundStyle(.secondary)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("alignmentGuide(_:computeValue:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".alignmentGuide(.leading) { d in d[.trailing] }")
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Normal leading")
                            .font(.callout).foregroundStyle(.primary)
                        Text("Shifted: aligned at trailing edge")
                            .font(.callout).foregroundStyle(.tint)
                            .alignmentGuide(.leading) { d in d[.trailing] }
                        Text("Normal leading again")
                            .font(.callout).foregroundStyle(.primary)
                    }
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Custom AlignmentID — align across stacks").font(.headline).foregroundStyle(.primary)
                    APICallout("static let customCenter = HorizontalAlignment(CustomCenter.self)")
                    HStack(alignment: .top) {
                        VStack(alignment: .customCenter, spacing: 4) {
                            Text("Labels")
                                .font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                            Text("Name:")
                                .font(.callout).foregroundStyle(.secondary)
                                .alignmentGuide(.customCenter) { d in d[.trailing] }
                            Text("Role:")
                                .font(.callout).foregroundStyle(.secondary)
                                .alignmentGuide(.customCenter) { d in d[.trailing] }
                        }
                        VStack(alignment: .customCenter, spacing: 4) {
                            Text("Values")
                                .font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                            Text("Alice").font(.callout).foregroundStyle(.primary)
                            Text("Engineer").font(.callout).foregroundStyle(.primary)
                        }
                    }
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ViewDimensions — accessed in alignmentGuide closure").font(.headline).foregroundStyle(.primary)
                    APICallout(".alignmentGuide(.top) { d in d[.bottom] }  // flip")
                    Text("ViewDimensions exposes width, height, and all named alignment guides via subscript. Use it to compute custom alignment values from actual geometry.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Aligning across stacks with VerticalAlignment").font(.headline).foregroundStyle(.primary)
                APICallout("HStack(alignment: .firstTextBaseline) { … }")
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text("Big").font(.title).foregroundStyle(.primary)
                    Text("aligned").font(.body).foregroundStyle(.secondary)
                    Text("on baseline").font(.caption).foregroundStyle(.tertiary)
                }
                .padding(8)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Alignment combines HorizontalAlignment + VerticalAlignment into a 2D anchor.", systemImage: "scope")
                    .font(.callout).foregroundStyle(.secondary)
                Label("alignmentGuide overrides just the one named guide for that view — siblings still use their own guides.", systemImage: "arrow.left.and.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("AlignmentID defaultValue must return a sensible fallback used when no explicit guide is set.", systemImage: "function")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func label(_ text: String) -> some View {
        Text(text)
            .font(.caption).fontWeight(.semibold)
            .foregroundStyle(.tint)
    }
}

extension AlignmentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.alignment",
        title: "Alignment",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Aligning views across stacks",
            "Aligning views within a stack",
            "Alignment",
            "AlignmentID",
            "DepthAlignment",
            "HorizontalAlignment",
            "VerticalAlignment",
            "View/alignmentGuide(_:computeValue:)",
            "swiftui.layout-adjustments.aligning-views-across-stacks",
            "swiftui.layout-adjustments.aligning-views-within-a-stack",
            "swiftui.layout-adjustments.alignment",
            "swiftui.layout-adjustments.alignmentguide(_:computevalue:)",
            "swiftui.layout-adjustments.alignmentid",
            "swiftui.layout-adjustments.depthalignment",
            "swiftui.layout-adjustments.horizontalalignment",
            "swiftui.layout-adjustments.verticalalignment",
        ],
        blurb: "The Alignment family covers two-axis Alignment plus the per-axis HorizontalAlignment, VerticalAlignment, and DepthAlignment guides (and the AlignmentID protocol behind them). The alignmentGuide(_:computeValue:) modifier overrides a guide's value on a single view to nudge it relative to its siblings.",
        signature: "Alignment \u{00b7} HorizontalAlignment \u{00b7} VerticalAlignment \u{00b7} DepthAlignment \u{00b7} AlignmentID \u{00b7} alignmentGuide",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/alignment.md",
        page: { AnyView(AlignmentGalleryPage()) }
    )
}

#Preview {
    AlignmentGalleryPage().frame(width: 900, height: 900)
}
