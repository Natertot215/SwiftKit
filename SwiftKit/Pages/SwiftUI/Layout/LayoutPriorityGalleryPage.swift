import SwiftUI

// SwiftUI `View/layoutPriority(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/layoutpriority(_:).md
// macOS 10.15+. Per-sibling space allocation priority.

struct LayoutPriorityGalleryPage: View {
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
            Text("View/layoutPriority(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sets the priority by which a parent layout apportions space among siblings. Default priority is 0 \u{2014} all siblings are equal. Raise a child's priority to make it shrink later and stretch sooner.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/layoutpriority(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".layoutPriority(1)  // default is 0")
            HStack {
                Text("Moderately long string at default priority")
                    .font(.title3)
                    .foregroundStyle(.primary)
                    .padding(6)
                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))

                Spacer()

                Text("Higher priority string")
                    .font(.title3)
                    .foregroundStyle(.primary)
                    .layoutPriority(1)
                    .padding(6)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
            }
            .frame(width: 480)
            Text("The right-hand text claims its full width first; the left-hand text shrinks to fit what's left.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            priorityRow(label: "Equal priority (default 0)", priorities: (0, 0))
            priorityRow(label: "Right has higher priority (1)", priorities: (0, 1))
            priorityRow(label: "Left has higher priority (1)", priorities: (1, 0))
            priorityRow(label: "Right has very high priority (5)", priorities: (0, 5))
        }
    }

    private func priorityRow(label: String, priorities: (Double, Double)) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label).font(.caption).foregroundStyle(.tertiary)
            APICallout(".layoutPriority(\(Int(priorities.0)))  vs  .layoutPriority(\(Int(priorities.1)))")
            HStack(spacing: 4) {
                Text("Left content that wants room")
                    .font(.callout).foregroundStyle(.primary)
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                    .layoutPriority(priorities.0)
                Text("Right content that wants room")
                    .font(.callout).foregroundStyle(.primary)
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(.green.opacity(0.18), in: RoundedRectangle(cornerRadius: 4))
                    .layoutPriority(priorities.1)
            }
            .frame(width: 360)
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Compression order").font(.headline).foregroundStyle(.primary)
            Text("When the parent doesn't have enough room for all siblings, SwiftUI compresses lower-priority views first. Higher-priority views keep their ideal size longer before being compressed.")
                .font(.callout).foregroundStyle(.secondary)
            APICallout("// Default priority is 0. Raise a sibling's priority to protect it from compression.")
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Priority is a Double \u{2014} fractional priorities (0.5, 1.5) work and let you express partial-protection nuances.", systemImage: "scale.3d")
                .font(.callout).foregroundStyle(.secondary)
            Label("Most useful inside HStack/VStack where one sibling should win the leftover space \u{2014} typical for a row that pairs a fixed icon with a flexible label.", systemImage: "rectangle.split.2x1")
                .font(.callout).foregroundStyle(.secondary)
            Label("Pair layoutPriority with .lineLimit(1).truncationMode(.tail) on the lower-priority sibling for a clean compress-and-truncate behavior.", systemImage: "text.alignleft")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

extension LayoutPriorityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.layoutPriority",
        title: "LayoutPriority",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/layoutPriority(_:)",
            "swiftui.layout-adjustments.layoutpriority(_:)",
        ],
        blurb: "Set the priority by which a parent layout apportions space to a child. A higher layoutPriority lets a view claim more of the proposed size when siblings compete for room.",
        signature: "func layoutPriority(_ value: Double) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/layoutpriority(_:).md",
        page: { AnyView(LayoutPriorityGalleryPage()) }
    )
}

#Preview {
    LayoutPriorityGalleryPage().frame(width: 900, height: 800)
}
