import SwiftUI

// SwiftUI `Rectangle` reference page.
// Source: Documentation/SwiftUI/shapes/rectangle.md
// macOS 10.15+. A rectangular shape aligned inside the frame of the view containing it.

struct RectanglePage: View {
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
            Text("Rectangle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A rectangular shape aligned inside the frame of the view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/rectangle.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(.tint)
                .frame(width: 200, height: 120)
            APICallout("Rectangle().fill(.tint).frame(width: 200, height: 120)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ShapeVariantRow(title: "fill(_:)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Rectangle().fill(.tint).frame(width: 80, height: 60)
                        APICallout(".fill(.tint)")
                    }
                    VStack(spacing: 6) {
                        Rectangle().fill(.secondary).frame(width: 80, height: 60)
                        APICallout(".fill(.secondary)")
                    }
                    VStack(spacing: 6) {
                        Rectangle()
                            .fill(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 80, height: 60)
                        APICallout(".fill(LinearGradient(...))")
                    }
                }
            }

            ShapeVariantRow(title: "stroke(_:lineWidth:)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Rectangle().stroke(.tint, lineWidth: 2).frame(width: 80, height: 60)
                        APICallout(".stroke(.tint, lineWidth: 2)")
                    }
                    VStack(spacing: 6) {
                        Rectangle().stroke(.tint, lineWidth: 6).frame(width: 80, height: 60)
                        APICallout("lineWidth: 6")
                    }
                    VStack(spacing: 6) {
                        Rectangle()
                            .stroke(style: StrokeStyle(lineWidth: 3, dash: [8, 4]))
                            .frame(width: 80, height: 60)
                            .foregroundStyle(.tint)
                        APICallout("StrokeStyle(dash: [8, 4])")
                    }
                }
            }

            ShapeVariantRow(title: "trim(from:to:)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Rectangle().trim(from: 0, to: 0.5).stroke(.tint, lineWidth: 3).frame(width: 80, height: 60)
                        APICallout(".trim(from: 0, to: 0.5)")
                    }
                    VStack(spacing: 6) {
                        Rectangle().trim(from: 0.25, to: 0.75).stroke(.tint, lineWidth: 3).frame(width: 80, height: 60)
                        APICallout(".trim(from: 0.25, to: 0.75)")
                    }
                }
            }

            ShapeVariantRow(title: "fill + stroke overlay") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Rectangle()
                            .fill(.tint.opacity(0.3))
                            .overlay { Rectangle().stroke(.tint, lineWidth: 2) }
                            .frame(width: 80, height: 60)
                        APICallout(".fill(...).overlay { .stroke(...) }")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ShapeVariantRow(title: "Scale and rotation transforms") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        Rectangle()
                            .fill(.tint)
                            .frame(width: 80, height: 60)
                            .scaleEffect(0.6)
                        APICallout(".scaleEffect(0.6)")
                    }
                    VStack(spacing: 6) {
                        Rectangle()
                            .fill(.tint)
                            .frame(width: 80, height: 60)
                            .rotationEffect(.degrees(15))
                        APICallout(".rotationEffect(.degrees(15))")
                    }
                }
            }

            ShapeVariantRow(title: "clipShape") {
                VStack(alignment: .leading, spacing: 8) {
                    Image(systemName: "photo")
                        .font(.system(size: 40))
                        .frame(width: 120, height: 80)
                        .background(.secondary.opacity(0.3))
                        .clipShape(Rectangle())
                    APICallout(".clipShape(Rectangle())")
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Rectangle fills the available frame.", "Unlike a fixed-size UIView, Rectangle expands to fill whatever frame you apply. Always pair with .frame(...) or use in a sized container.", "rectangle"),
        ("InsettableShape — supports .strokeBorder.", "Rectangle conforms to InsettableShape so you can use .strokeBorder(_:lineWidth:) to stroke inside the path rather than centered on the edge.", "square.and.pencil"),
        ("Use as a clip shape for images.", "Rectangle().clipShape cuts content exactly to its bounds — useful for cropping images to a precise rectangular area.", "photo"),
        ("trim(from:to:) animates beautifully.", "Animating the `to` value of .trim creates a draw-on effect for progress indicators and onboarding flows.", "wand.and.sparkles")
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

private struct ShapeVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    RectanglePage()
        .frame(width: 1100, height: 800)
}
