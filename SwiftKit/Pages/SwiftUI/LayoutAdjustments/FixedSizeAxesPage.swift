import SwiftUI

// SwiftUI `View/fixedSize(horizontal:vertical:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/fixedsize(horizontal:vertical:).md
// macOS 10.15+. Per-axis fixedSize.

struct FixedSizeAxesPage: View {
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
            Text("View/fixedSize(horizontal:vertical:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Fixes the wrapped view at its ideal size only on the axes you flag true. The standard pattern for multi-line text that should NOT truncate vertically while still wrapping horizontally.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/fixedsize(horizontal:vertical:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".fixedSize(horizontal: false, vertical: true)")
            Text("Multi-line text that wraps within the proposed width but is allowed to grow tall enough to show every line. The vertical axis is fixed at the wrapped view's ideal (full) height.")
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 280)
                .padding(8)
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Horizontal-only").font(.headline).foregroundStyle(.primary)
                APICallout(".fixedSize(horizontal: true, vertical: false)")
                Text("Single-line label that refuses to compress horizontally")
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(6)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Both axes (= fixedSize())").font(.headline).foregroundStyle(.primary)
                APICallout(".fixedSize(horizontal: true, vertical: true)  // same as .fixedSize()")
                Text("Use the parameterless overload as a shorthand when fixing both.")
                    .font(.callout).foregroundStyle(.secondary)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Neither axis (= no-op)").font(.headline).foregroundStyle(.primary)
                APICallout(".fixedSize(horizontal: false, vertical: false)  // pass-through")
                Text("Both flags false leaves the wrapped view unchanged \u{2014} useful when toggling fixed-size behavior conditionally.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Common pattern: text in a vertical scroll").font(.headline).foregroundStyle(.primary)
            APICallout(".fixedSize(horizontal: false, vertical: true)")
            Text("This is exactly the pattern DescribePage's blurb uses \u{2014} let SwiftUI propose a width, but always render the full text height so nothing truncates.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Pick the axis the parent's proposal is tightening on \u{2014} that's the axis you set to true.", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                .font(.callout).foregroundStyle(.secondary)
            Label("vertical: true is the standard fix for paragraph Text inside a constrained container that would otherwise clip the bottom lines.", systemImage: "text.alignleft")
                .font(.callout).foregroundStyle(.secondary)
            Label("Even when both flags are true the modifier still wraps the view; nothing is removed from the hierarchy. Reach for fixedSize() as a clearer name in that case.", systemImage: "lock")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    FixedSizeAxesPage().frame(width: 900, height: 800)
}
