import SwiftUI

// SwiftUI `View/aspectRatio(_:contentMode:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/aspectratio(_:contentmode:).md
// macOS 10.15+. Constrains the view's dimensions to a width:height ratio
// using ContentMode (.fit or .fill).

struct AspectRatioPage: View {
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
            Text("View/aspectRatio(_:contentMode:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Constrains the view's dimensions to a width:height ratio. ContentMode .fit fits inside; .fill fills out.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/aspectratio(_:contentmode:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Ellipse()
                .fill(.purple.gradient)
                .aspectRatio(0.75, contentMode: .fit)
                .frame(width: 160, height: 160)
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4])))
            APICallout(".aspectRatio(0.75, contentMode: .fit)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ARVariantRow(title: "Common ratios — .fit") {
                HStack(spacing: 16) {
                    aspectBox(ratio: 16.0/9.0, label: "16:9 ", mode: .fit)
                    aspectBox(ratio: 4.0/3.0,  label: "4:3 ", mode: .fit)
                    aspectBox(ratio: 1.0,      label: "1:1 ", mode: .fit)
                    aspectBox(ratio: 9.0/16.0, label: "9:16 ", mode: .fit)
                }
            }

            ARVariantRow(title: ".fit vs .fill") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Rectangle()
                            .fill(.cyan.gradient)
                            .aspectRatio(2, contentMode: .fit)
                            .frame(width: 160, height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4])))
                        Text(".fit, ratio 2:1").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Rectangle()
                            .fill(.cyan.gradient)
                            .aspectRatio(2, contentMode: .fill)
                            .frame(width: 160, height: 100)
                            .clipped()
                            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4])))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        Text(".fill, ratio 2:1").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            ARVariantRow(title: "nil — preserve current aspect") {
                VStack(spacing: 6) {
                    Image(systemName: "swift")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 120, height: 200)
                        .foregroundStyle(.orange.gradient)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                    APICallout(".aspectRatio(nil, contentMode: .fit)")
                }
            }
        }
    }

    private func aspectBox(ratio: CGFloat, label: String, mode: ContentMode) -> some View {
        VStack(spacing: 6) {
            Rectangle()
                .fill(.indigo.gradient)
                .aspectRatio(ratio, contentMode: mode)
                .frame(width: 120, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4])))
            Text(label).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        ARVariantRow(title: "Compare to .scaledToFit / .scaledToFill") {
            HStack(spacing: 16) {
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill").resizable().aspectRatio(contentMode: .fit)
                        .foregroundStyle(.blue.gradient)
                        .frame(width: 160, height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                    Text(".aspectRatio(contentMode: .fit)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill").resizable().aspectRatio(contentMode: .fill)
                        .foregroundStyle(.blue.gradient)
                        .frame(width: 160, height: 100).clipped()
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    Text(".aspectRatio(contentMode: .fill)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("aspectRatio takes a CGFloat?.", "Pass an explicit width:height ratio (e.g., 16.0/9.0). Pass nil to preserve the view's existing aspect ratio (handy for resizable Image content).", "function"),
        ("ContentMode .fit fits inside the parent.", "The longer axis hits the parent's bounds first; the shorter axis is letterboxed/pillarboxed.", "rectangle.compress.vertical"),
        ("ContentMode .fill fills the parent.", "The shorter axis hits the parent first; the longer axis overflows. Pair with .clipped() or .clipShape(...) to crop.", "rectangle.expand.vertical"),
        ("scaledToFit/scaledToFill are shortcuts.", ".scaledToFit() == .aspectRatio(nil, contentMode: .fit). .scaledToFill() == .aspectRatio(nil, contentMode: .fill).", "arrow.up.right.and.arrow.down.left.rectangle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct ARVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { AspectRatioPage().frame(width: 1100, height: 1400) }
