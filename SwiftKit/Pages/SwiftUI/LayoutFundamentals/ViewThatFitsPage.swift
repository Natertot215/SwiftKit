import SwiftUI

// SwiftUI ViewThatFits reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/viewthatfits.md
// macOS 13.0+

struct ViewThatFitsPage: View {
    @State private var containerWidth: CGFloat = 400

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("ViewThatFits")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A view that picks the first child view that fits within its offered space, along the specified axes.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/viewthatfits.md · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout("ViewThatFits { WideView(); NarrowView(); MinimalView() }")
                VStack(alignment: .leading, spacing: 8) {
                    Text("Drag the slider to resize the container")
                        .font(.caption).foregroundStyle(.tertiary)
                    Slider(value: $containerWidth, in: 80...500, step: 10)
                    Text("\(Int(containerWidth)) pt wide").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                }

                ViewThatFits(in: .horizontal) {
                    // Widest variant
                    HStack(spacing: 8) {
                        Label("Save Document", systemImage: "square.and.arrow.down")
                        Label("Share with Team", systemImage: "person.2")
                        Label("Export PDF", systemImage: "arrow.up.doc")
                    }
                    .font(.callout).foregroundStyle(.primary)

                    // Medium variant
                    HStack(spacing: 8) {
                        Label("Save", systemImage: "square.and.arrow.down")
                        Label("Share", systemImage: "person.2")
                        Label("Export", systemImage: "arrow.up.doc")
                    }
                    .font(.callout).foregroundStyle(.primary)

                    // Minimal: icons only
                    HStack(spacing: 12) {
                        Image(systemName: "square.and.arrow.down")
                        Image(systemName: "person.2")
                        Image(systemName: "arrow.up.doc")
                    }
                    .font(.title3).foregroundStyle(.primary)
                }
                .frame(width: containerWidth, alignment: .leading)
                .padding()
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("in: .vertical axis").font(.headline).foregroundStyle(.primary)
                    APICallout("ViewThatFits(in: .vertical) { TallView(); ShortView() }")
                    ViewThatFits(in: .vertical) {
                        VStack(spacing: 4) {
                            ForEach(["Line 1", "Line 2", "Line 3", "Line 4"], id: \.self) { l in
                                Text(l).foregroundStyle(.secondary)
                            }
                        }
                        VStack(spacing: 4) {
                            Text("Line 1").foregroundStyle(.secondary)
                            Text("Line 2").foregroundStyle(.secondary)
                        }
                    }
                    .frame(height: 40)
                    .font(.callout)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Container is 40pt tall — the 4-line variant doesn't fit, so the 2-line fallback is used.")
                        .font(.caption).foregroundStyle(.tertiary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("ViewThatFits evaluates children in order and picks the first that fits.").font(.callout).foregroundStyle(.secondary)
                Text("It respects the ideal sizes of its children — views that prefer more space than offered are skipped.").font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("The default in: parameter is [.horizontal, .vertical] — checks both axes.", systemImage: "arrow.up.left.and.arrow.down.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Place the most detailed / widest variant first. ViewThatFits picks the first one that fits.", systemImage: "1.circle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("If no child fits, ViewThatFits uses the last child regardless.", systemImage: "questionmark.circle")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ViewThatFitsPage().frame(width: 900, height: 800)
}
