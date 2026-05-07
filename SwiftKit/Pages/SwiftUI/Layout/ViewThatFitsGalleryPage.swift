import SwiftUI

// Dense ViewThatFits reference page.
//   • ViewThatFits                                                      (struct)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/viewthatfits.md
//   macOS 13.0+

struct ViewThatFitsGalleryPage: View {
    @State private var containerWidth: CGFloat = 400

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                defaultSection
                axesSection
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
            Text("ViewThatFits")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that presents the first child that fits within its offered space along the specified axes. Use it to build responsive layouts that gracefully degrade to simpler forms at smaller sizes.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/viewthatfits.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("struct ViewThatFits<Content: View>")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default — horizontal axis

    private var defaultSection: some View {
        PageSection("Default \u{2014} in: .horizontal", subtitle: "Picks the first child that fits horizontally \u{00b7} interactive") {
            VStack(alignment: .leading, spacing: 20) {
                Text("ViewThatFits evaluates children in order and picks the first one whose ideal size fits within the offered space. Subsequent children are never created. The last child is always used as a final fallback.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("ViewThatFits(in: .horizontal) { WideView(); MediumView(); NarrowView() }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Drag the slider to resize — watch the toolbar adapt")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                    HStack(spacing: 12) {
                        Slider(value: $containerWidth, in: 80...520, step: 10)
                        Text("\(Int(containerWidth)) pt")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.tertiary)
                            .frame(width: 52, alignment: .trailing)
                    }

                    ViewThatFits(in: .horizontal) {
                        // Widest variant
                        HStack(spacing: 8) {
                            Label("Save Document", systemImage: "square.and.arrow.down")
                            Label("Share with Team", systemImage: "person.2")
                            Label("Export PDF", systemImage: "arrow.up.doc")
                        }
                        .font(.callout)
                        .foregroundStyle(.primary)

                        // Medium variant
                        HStack(spacing: 8) {
                            Label("Save", systemImage: "square.and.arrow.down")
                            Label("Share", systemImage: "person.2")
                            Label("Export", systemImage: "arrow.up.doc")
                        }
                        .font(.callout)
                        .foregroundStyle(.primary)

                        // Minimal: icons only
                        HStack(spacing: 12) {
                            Image(systemName: "square.and.arrow.down")
                            Image(systemName: "person.2")
                            Image(systemName: "arrow.up.doc")
                        }
                        .font(.title3)
                        .foregroundStyle(.primary)
                    }
                    .frame(width: containerWidth, alignment: .leading)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Three variants: full labels \u{2192} short labels \u{2192} icons only")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                    APICallout("""
ViewThatFits(in: .horizontal) {
    HStack { Label(\"Save Document\", ...) /* wide */ }
    HStack { Label(\"Save\", ...)          /* medium */ }
    HStack { Image(systemName: ...)       /* minimal */ }
}
""")
                }

                noteRow(
                    title: "Always put the most detailed variant first.",
                    detail: "ViewThatFits picks the FIRST child that fits. If a simpler view is listed first, the detailed version is never tried.",
                    symbol: "1.circle"
                )
            }
        }
    }

    // MARK: Axes variants

    private var axesSection: some View {
        PageSection("Axes variants", subtitle: "in: .horizontal / .vertical / [.horizontal, .vertical]") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The in: parameter specifies which axes ViewThatFits checks when evaluating fit. The default [.horizontal, .vertical] checks both axes. Pass a single axis to check only that dimension.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("ViewThatFits(in: .horizontal)  { \u{2026} }  // checks width only")
                    APICallout("ViewThatFits(in: .vertical)    { \u{2026} }  // checks height only")
                    APICallout("ViewThatFits                   { \u{2026} }  // default: [.horizontal, .vertical]")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("in: .vertical — container is 40pt tall")
                        .font(.headline).foregroundStyle(.primary)
                    Text("The 4-line view is too tall; ViewThatFits picks the 2-line fallback.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
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
                    APICallout("ViewThatFits(in: .vertical) { FourLines(); TwoLines() }.frame(height: 40)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default (both axes) — evaluates width AND height")
                        .font(.headline).foregroundStyle(.primary)
                    ViewThatFits {
                        HStack(spacing: 8) {
                            chip("Primary Action")
                            chip("Secondary Action")
                        }
                        chip("Primary")
                    }
                    .frame(width: 180)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("ViewThatFits { WideHStack(); SingleChip() }.frame(width: 180)")
                }

                noteRow(
                    title: "If no child fits, the last child is always used.",
                    detail: "ViewThatFits will never render nothing. The last child in the content builder is the unconditional fallback — size it as your minimum viable rendering.",
                    symbol: "questionmark.circle"
                )
                noteRow(
                    title: "Use ViewThatFits instead of GeometryReader for responsive text.",
                    detail: "GeometryReader disrupts layout by eagerly consuming space. ViewThatFits participates in the normal SwiftUI layout pass without side effects.",
                    symbol: "arrow.up.left.and.arrow.down.right"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: "ViewThatFits checks ideal sizes, not minimum sizes.",
                    detail: "A view is considered to 'fit' when its idealSize is at most the offered space. Views that prefer more space (e.g., a text wrapping at a narrow width) are skipped.",
                    symbol: "ruler"
                )
                noteRow(
                    title: "The first matching child wins; later children are not created.",
                    detail: "Only one child view is ever instantiated. The other children are never evaluated by SwiftUI. This is efficient for conditional layouts.",
                    symbol: "bolt"
                )
                noteRow(
                    title: "ViewThatFits vs AnyLayout.",
                    detail: "AnyLayout allows switching between layout algorithms (HStack vs VStack) with animation. ViewThatFits picks a content variant based on available space — they solve different problems and compose well together.",
                    symbol: "arrow.left.and.right.square"
                )
                noteRow(
                    title: "macOS 13.0+ / iOS 16.0+.",
                    detail: "ViewThatFits was introduced alongside the new Layout protocol. On earlier OS targets, use conditional GeometryReader-based workarounds.",
                    symbol: "calendar"
                )
            }
        }
    }

    // MARK: Helpers

    private func chip(_ label: String) -> some View {
        Text(label)
            .font(.callout)
            .padding(.horizontal, 10).padding(.vertical, 4)
            .background(.tint.opacity(0.15), in: Capsule())
            .foregroundStyle(.tint)
    }

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

extension ViewThatFitsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.viewThatFits",
        title: "ViewThatFits",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "ViewThatFits",
        ],
        blurb: "A view that adapts to the available space by selecting the first child whose ideal size fits within the proposal. Provide candidates in preference order — usually largest to smallest — to gracefully degrade content under tight space constraints.",
        signature: "@frozen struct ViewThatFits<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/viewthatfits.md",
        page: { AnyView(ViewThatFitsGalleryPage()) }
    )
}

#Preview {
    ViewThatFitsGalleryPage()
        .frame(width: 1000, height: 1000)
}
