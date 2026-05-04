import SwiftUI

// SwiftUI `UnevenRoundedRectangle` reference page.
// Source: Documentation/SwiftUI/shapes/unevenroundedrectangle.md
// macOS 13.0+. A rectangular shape with independently adjustable corner radii.
// Also covers: RectangleCornerRadii, RectangleCornerInsets, ConcentricRectangle

struct UnevenRoundedRectanglePage: View {
    @State private var topLeading: CGFloat = 24
    @State private var topTrailing: CGFloat = 8
    @State private var bottomLeading: CGFloat = 8
    @State private var bottomTrailing: CGFloat = 24

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
            Text("UnevenRoundedRectangle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A rectangle with independently configurable corner radii.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/unevenroundedrectangle.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4))
                .fill(.tint)
                .frame(width: 200, height: 120)
            APICallout("UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4))")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            URRVariantRow(title: "Corner radii combinations") {
                let configs: [(String, RectangleCornerRadii)] = [
                    ("speech bubble TL", .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 4)),
                    ("asymmetric", .init(topLeading: 32, bottomLeading: 4, bottomTrailing: 32, topTrailing: 4)),
                    ("bottom-only rounded", .init(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0)),
                    ("diagonal", .init(topLeading: 32, bottomLeading: 4, bottomTrailing: 4, topTrailing: 32))
                ]
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 16)], spacing: 16) {
                    ForEach(configs, id: \.0) { label, radii in
                        VStack(spacing: 6) {
                            UnevenRoundedRectangle(cornerRadii: radii, style: .continuous)
                                .fill(.tint)
                                .frame(width: 120, height: 80)
                            Text(label)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }

            URRVariantRow(title: "RectangleCornerRadii — stroke border") {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4))
                    .strokeBorder(.tint, lineWidth: 3)
                    .frame(width: 180, height: 100)
            }

            URRVariantRow(title: "ConcentricRectangle — nested inset") {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 8, bottomTrailing: 24, topTrailing: 8))
                        .fill(.tint.opacity(0.15))
                        .frame(width: 200, height: 120)
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 18, bottomLeading: 4, bottomTrailing: 18, topTrailing: 4))
                        .fill(.tint.opacity(0.4))
                        .frame(width: 172, height: 96)
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 12, bottomLeading: 2, bottomTrailing: 12, topTrailing: 2))
                        .fill(.tint)
                        .frame(width: 144, height: 72)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            URRVariantRow(title: "Per-corner interactive control") {
                VStack(alignment: .leading, spacing: 12) {
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: topLeading,
                        bottomLeading: bottomLeading,
                        bottomTrailing: bottomTrailing,
                        topTrailing: topTrailing
                    ), style: .continuous)
                    .fill(.tint)
                    .frame(width: 200, height: 120)
                    .animation(.spring, value: topLeading)
                    .animation(.spring, value: topTrailing)
                    .animation(.spring, value: bottomLeading)
                    .animation(.spring, value: bottomTrailing)

                    Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 8) {
                        GridRow {
                            Text("Top Leading").font(.caption).foregroundStyle(.secondary).frame(width: 100, alignment: .leading)
                            Slider(value: $topLeading, in: 0...60).frame(width: 180)
                            Text("\(Int(topLeading))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                        GridRow {
                            Text("Top Trailing").font(.caption).foregroundStyle(.secondary)
                            Slider(value: $topTrailing, in: 0...60).frame(width: 180)
                            Text("\(Int(topTrailing))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                        GridRow {
                            Text("Bottom Leading").font(.caption).foregroundStyle(.secondary)
                            Slider(value: $bottomLeading, in: 0...60).frame(width: 180)
                            Text("\(Int(bottomLeading))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                        GridRow {
                            Text("Bottom Trailing").font(.caption).foregroundStyle(.secondary)
                            Slider(value: $bottomTrailing, in: 0...60).frame(width: 180)
                            Text("\(Int(bottomTrailing))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("RectangleCornerRadii holds the four values.", "Construct with .init(topLeading:bottomLeading:bottomTrailing:topTrailing:). All default to 0 if omitted.", "slider.horizontal.3"),
        ("Style parameter also applies per-corner.", "Pass style: .continuous to match the squircle look. Each corner arc adapts its G2-continuity independently.", "app"),
        ("InsettableShape — strokeBorder works.", "Like RoundedRectangle, UnevenRoundedRectangle is insettable so strokeBorder paints inside the path boundary.", "square.and.pencil"),
        ("macOS 13.0+ minimum deployment target.", "UnevenRoundedRectangle shipped in macOS Ventura. SwiftKit targets macOS 26 so no @available guard is needed.", "calendar")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct URRVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    UnevenRoundedRectanglePage()
        .frame(width: 1100, height: 900)
}
