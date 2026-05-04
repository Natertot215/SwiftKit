import SwiftUI

// SwiftUI `RoundedRectangle` reference page.
// Source: Documentation/SwiftUI/shapes/roundedrectangle.md
// macOS 10.15+. A rectangular shape with rounded corners.
// Also covers: RoundedCornerStyle, RoundedRectangularShape, RoundedRectangularShapeCorners

struct RoundedRectanglePage: View {
    @State private var cornerRadius: CGFloat = 16

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
            Text("RoundedRectangle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A rectangular shape with rounded corners, aligned inside the view's frame.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/roundedrectangle.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.tint)
                .frame(width: 200, height: 120)
            APICallout("RoundedRectangle(cornerRadius: 16).fill(.tint)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            RRVariantRow(title: "Corner radius sweep") {
                HStack(spacing: 16) {
                    ForEach([0, 8, 16, 32, 60], id: \.self) { r in
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: CGFloat(r))
                                .fill(.tint)
                                .frame(width: 64, height: 64)
                            Text("r=\(r)")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            RRVariantRow(title: "RoundedCornerStyle — .circular vs .continuous") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 20, style: .circular)
                            .fill(.tint)
                            .frame(width: 80, height: 80)
                        Text(".circular")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.tint)
                            .frame(width: 80, height: 80)
                        Text(".continuous")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            RRVariantRow(title: "strokeBorder (InsettableShape)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(.tint, lineWidth: 3)
                            .frame(width: 100, height: 60)
                        APICallout(".strokeBorder(.tint, lineWidth: 3)")
                    }
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.tint.opacity(0.2))
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(.tint, lineWidth: 2)
                            }
                            .frame(width: 100, height: 60)
                        APICallout(".fill + .strokeBorder overlay")
                    }
                }
            }

            RRVariantRow(title: "Gradient fill") {
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(colors: [.blue, .purple, .pink],
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 240, height: 100)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            RRVariantRow(title: "Interactive corner radius") {
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.tint)
                        .frame(width: 240, height: 120)
                        .animation(.spring, value: cornerRadius)
                    HStack {
                        Text("0").font(.caption).foregroundStyle(.secondary)
                        Slider(value: $cornerRadius, in: 0...60)
                            .frame(maxWidth: 240)
                        Text("60").font(.caption).foregroundStyle(.secondary)
                    }
                    Text("cornerRadius = \(Int(cornerRadius))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Use .continuous for Apple-style squircles.", ".continuous (the default in most Apple UI) matches the corner curve used in app icons and macOS window chrome. Prefer it over .circular for modern macOS UI.", "app"),
        ("InsettableShape — strokeBorder is sharper.", "With .strokeBorder the path is inset so the stroke never bleeds outside the frame. .stroke(lineWidth:) extends outward by half its width on each side.", "square.and.pencil"),
        ("Animatable cornerRadius.", "Binding cornerRadius to state and wrapping changes in withAnimation produces smooth morph animations — useful for selection or focus states.", "wand.and.sparkles"),
        ("clipShape with RoundedRectangle.", "Use .clipShape(RoundedRectangle(cornerRadius:)) to apply rounded clips to images or ZStacks without drawing a separate background.", "photo")
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

private struct RRVariantRow<Content: View>: View {
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
    RoundedRectanglePage()
        .frame(width: 1100, height: 900)
}
