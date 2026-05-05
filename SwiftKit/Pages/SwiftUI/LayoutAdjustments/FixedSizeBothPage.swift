import SwiftUI

// SwiftUI `View/fixedSize()` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/fixedsize().md
// macOS 10.15+. Fixes the wrapped view at its ideal size on both axes.

struct FixedSizeBothPage: View {
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
            Text("View/fixedSize()")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Fixes a view at its ideal size on both axes. The wrapped view counter-proposes its ideal dimensions instead of accepting the parent's offer \u{2014} useful when a Text would otherwise truncate.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/fixedsize().md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Without fixedSize()").font(.caption).foregroundStyle(.tertiary)
                Text("A single line of text, too long to fit in a 200pt-wide box.")
                    .lineLimit(1)
                    .frame(width: 200)
                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("With fixedSize()").font(.caption).foregroundStyle(.tertiary)
                APICallout(".fixedSize()  // both axes")
                Text("A single line of text, too long to fit in a 200pt-wide box.")
                    .fixedSize()
                    .frame(width: 200)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Inside a constrained HStack").font(.headline).foregroundStyle(.primary)
                APICallout("HStack { Text(longLabel).fixedSize(); Spacer(); Image(systemName: \"chevron.right\") }")
                HStack {
                    Text("This long label refuses to truncate")
                        .fixedSize()
                    Spacer()
                    Image(systemName: "chevron.right").foregroundStyle(.tertiary)
                }
                .frame(width: 280)
                .padding(8)
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("With idealWidth").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(idealWidth: 240).fixedSize()")
                Text("Pairing fixedSize with .frame(idealWidth:) is the canonical way to ask SwiftUI to use a specific width as the proposal regardless of parent context.")
                    .frame(idealWidth: 240)
                    .fixedSize()
                    .padding(8)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Counter-proposal").font(.headline).foregroundStyle(.primary)
            Text("Think of fixedSize() as a counter-proposal: the parent offers a size, and fixedSize() answers with the wrapped view's ideal size instead. The wrapped view may end up bigger than the parent expected.")
                .font(.callout).foregroundStyle(.secondary)
            APICallout(".fixedSize()  // counter-proposal: 'I'd rather be ideal-size'")
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("The ideal size depends on the wrapped view: Text's ideal size is its full unwrapped string; container views report the union of their children's ideals.", systemImage: "lightbulb")
                .font(.callout).foregroundStyle(.secondary)
            Label("If you only want to fix one axis (typical for multi-line text), use fixedSize(horizontal:vertical:) instead of fixedSize().", systemImage: "arrow.up.and.down")
                .font(.callout).foregroundStyle(.secondary)
            Label("fixedSize() can cause overflow \u{2014} the wrapped view may extend past the parent's bounds. Combine with a frame to clip if needed.", systemImage: "exclamationmark.triangle")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    FixedSizeBothPage().frame(width: 900, height: 800)
}
