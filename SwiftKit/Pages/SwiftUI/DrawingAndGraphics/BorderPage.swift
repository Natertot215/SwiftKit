import SwiftUI

// SwiftUI `View/border(_:width:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/border(_:width:).md
// macOS 10.15+. Adds a border with a ShapeStyle and width to a view's frame.

struct BorderPage: View {
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
            Text("View/border(_:width:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a border with the specified ShapeStyle content and width around the view's frame.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/border(_:width:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Inside the view's frame")
                .padding(8)
                .border(Color.accentColor, width: 2)
            APICallout(".border(Color.accentColor, width: 2)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BPVariantRow(title: "Width variants") {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach([1.0, 2.0, 4.0, 8.0], id: \.self) { w in
                        HStack(spacing: 12) {
                            Text("width: \(Int(w))")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                                .frame(width: 80, alignment: .leading)
                            Text("Sample border")
                                .padding(8)
                                .border(.secondary, width: w)
                        }
                    }
                }
            }

            BPVariantRow(title: "ShapeStyle content variants") {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        Text("Color.accentColor").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 200, alignment: .leading)
                        Text("border").padding(6).border(Color.accentColor, width: 2)
                    }
                    HStack(spacing: 12) {
                        Text(".primary").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 200, alignment: .leading)
                        Text("border").padding(6).border(.primary, width: 2)
                    }
                    HStack(spacing: 12) {
                        Text(".secondary").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 200, alignment: .leading)
                        Text("border").padding(6).border(.secondary, width: 2)
                    }
                    HStack(spacing: 12) {
                        Text(".linearGradient(...)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 200, alignment: .leading)
                        Text("border").padding(6).border(LinearGradient(colors: [.accentColor, .pink], startPoint: .leading, endPoint: .trailing), width: 3)
                    }
                    HStack(spacing: 12) {
                        Text(".tint").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 200, alignment: .leading)
                        Text("border").padding(6).border(.tint, width: 2)
                    }
                }
            }

            BPVariantRow(title: "Default width = 1") {
                HStack(spacing: 12) {
                    Text("default").padding(8).border(.secondary)
                    APICallout(".border(.secondary) // width default 1")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        BPVariantRow(title: "Border + .padding to push it outside") {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 16) {
                    Text("Inside")
                        .padding(8)
                        .border(.secondary, width: 2)
                    Text("Outside")
                        .padding(8)
                        .padding(2)
                        .border(.secondary, width: 2)
                }
                Text("By default the border draws inside the view's bounds. Add .padding equal to the border width before .border to draw it outside.")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Generic over ShapeStyle.", "border<S: ShapeStyle>(_ content: S, width: CGFloat = 1) — pass any ShapeStyle: a Color, a hierarchical style, a Gradient, .tint, .accentColor, etc.", "function"),
        ("Border draws INSIDE the view bounds.", "By default .border occupies the inner edge of the view's frame. To place a border outside, add .padding equal to the border width before applying .border.", "rectangle.dashed"),
        ("Default width is 1 point.", "border(_:) without a width parameter uses 1pt. Pass width: explicitly when you need a thicker stroke.", "scribble"),
        ("Use .overlay(...) for advanced borders.", "For rounded corners, gradient strokes, or strokeBorder behavior, prefer .overlay(RoundedRectangle(...).strokeBorder(...)) — .border(_:width:) is rectangular only.", "square.dashed.inset.filled")
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

private struct BPVariantRow<Content: View>: View {
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
    BorderPage()
        .frame(width: 1100, height: 1100)
}
