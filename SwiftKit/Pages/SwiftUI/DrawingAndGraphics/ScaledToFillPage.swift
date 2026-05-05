import SwiftUI

// SwiftUI `View/scaledToFill()` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/scaledtofill().md
// macOS 10.15+. Scales the view to fill its parent, preserving aspect ratio.
// Equivalent to .aspectRatio(nil, contentMode: .fill).

struct ScaledToFillPage: View {
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
            Text("View/scaledToFill()")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Scales the view to fill its parent while preserving aspect ratio. Equivalent to .aspectRatio(nil, contentMode: .fill).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/scaledtofill().md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFill()
                .foregroundStyle(LinearGradient(colors: [.purple, .pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 120)
                .clipped()
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.separator, lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            APICallout("Image(...).resizable().scaledToFill().frame(...).clipped()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            STFVariantRow(title: "Wide frame — content overflows vertically (clip to crop)") {
                Image(systemName: "leaf.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.green.gradient)
                    .frame(width: 280, height: 80)
                    .clipped()
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            STFVariantRow(title: "Tall frame — content overflows horizontally") {
                Image(systemName: "leaf.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.green.gradient)
                    .frame(width: 80, height: 200)
                    .clipped()
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            STFVariantRow(title: "Square frame — exact fit") {
                Image(systemName: "leaf.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.green.gradient)
                    .frame(width: 120, height: 120)
                    .clipped()
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        STFVariantRow(title: "scaledToFill vs scaledToFit") {
            HStack(spacing: 16) {
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill").resizable().scaledToFill()
                        .foregroundStyle(.cyan.gradient)
                        .frame(width: 160, height: 100).clipped()
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    Text(".scaledToFill()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill").resizable().scaledToFit()
                        .foregroundStyle(.cyan.gradient)
                        .frame(width: 160, height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
                    Text(".scaledToFit()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Equivalent to .aspectRatio(nil, contentMode: .fill).", "Both produce the same fill behavior. .scaledToFill() reads more clearly at the call site for image content.", "function"),
        ("Often paired with .clipped() or a clip shape.", "Without clipping, the larger dimension overflows the parent. .clipped() (or .clipShape(...)) crops to the frame.", "scissors"),
        ("Apply to a resizable Image.", "For Image, .resizable() must come before .scaledToFill() — otherwise the image renders at intrinsic size and the modifier has no effect.", "photo"),
        ("Use .frame(...) to set the parent size.", "scaledToFill scales to fill its parent's offered size; combine with .frame to provide one.", "rectangle.dashed")
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

private struct STFVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ScaledToFillPage().frame(width: 1100, height: 1200) }
