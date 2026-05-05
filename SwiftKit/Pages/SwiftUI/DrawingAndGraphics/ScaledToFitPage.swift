import SwiftUI

// SwiftUI `View/scaledToFit()` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/scaledtofit().md
// macOS 10.15+. Scales the view to fit its parent, preserving aspect ratio.
// Equivalent to .aspectRatio(nil, contentMode: .fit).

struct ScaledToFitPage: View {
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
            Text("View/scaledToFit()")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Scales the view to fit inside its parent while preserving aspect ratio. Equivalent to .aspectRatio(nil, contentMode: .fit).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/scaledtofit().md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(LinearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 120)
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
            APICallout("Image(...).resizable().scaledToFit().frame(...)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            STFitVariantRow(title: "Wide frame — letterboxed") {
                Image(systemName: "leaf.fill")
                    .resizable().scaledToFit()
                    .foregroundStyle(.green.gradient)
                    .frame(width: 280, height: 80)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
            }

            STFitVariantRow(title: "Tall frame — pillarboxed") {
                Image(systemName: "leaf.fill")
                    .resizable().scaledToFit()
                    .foregroundStyle(.green.gradient)
                    .frame(width: 80, height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
            }

            STFitVariantRow(title: "Square frame — exact fit") {
                Image(systemName: "leaf.fill")
                    .resizable().scaledToFit()
                    .foregroundStyle(.green.gradient)
                    .frame(width: 120, height: 120)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        STFitVariantRow(title: "scaledToFit vs scaledToFill") {
            HStack(spacing: 16) {
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill").resizable().scaledToFit()
                        .foregroundStyle(.cyan.gradient)
                        .frame(width: 160, height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                    Text(".scaledToFit()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill").resizable().scaledToFill()
                        .foregroundStyle(.cyan.gradient)
                        .frame(width: 160, height: 100).clipped()
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    Text(".scaledToFill()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Equivalent to .aspectRatio(nil, contentMode: .fit).", "Both produce identical fit behavior. .scaledToFit() reads cleanly at the call site for media content.", "function"),
        ("Default for image previews.", "When you don't know the exact aspect of incoming content, .scaledToFit() ensures nothing is cropped.", "photo"),
        ("Apply to a resizable Image.", "For Image, .resizable() must come before .scaledToFit() — otherwise the image renders at its intrinsic size and ignores the modifier.", "photo.fill"),
        ("Pair with .frame(...) to set bounds.", "scaledToFit scales to fit its parent's offered size; .frame(...) provides explicit bounds when there isn't a sized parent.", "rectangle.dashed")
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

private struct STFitVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ScaledToFitPage().frame(width: 1100, height: 1200) }
