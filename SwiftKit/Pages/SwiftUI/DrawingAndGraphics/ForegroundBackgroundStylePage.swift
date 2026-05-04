import SwiftUI

// SwiftUI `View/foregroundStyle`, `View/backgroundStyle`, `View/tint`, `View/border` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/
// macOS 10.15+. Controls color, material, and gradient fills for content layers.
// Also covers: AnyShapeStyle, ShadowStyle, View/tint(_:), View/border(_:width:)

struct ForegroundBackgroundStylePage: View {
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
            Text("foregroundStyle · backgroundStyle · tint · border")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Layered style modifiers controlling foreground, background, tint, border, and shadow rendering.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "star.fill")
                .font(.system(size: 48))
                .foregroundStyle(.tint)
            APICallout("Image(systemName: \"star.fill\").foregroundStyle(.tint)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FBSVariantRow(title: "foregroundStyle(_:) — single layer") {
                HStack(spacing: 16) {
                    ForEach(["primary", "secondary", "tertiary"], id: \.self) { level in
                        let style: HierarchicalShapeStyle = {
                            switch level {
                            case "secondary": return .secondary
                            case "tertiary": return .tertiary
                            default: return .primary
                            }
                        }()
                        VStack(spacing: 6) {
                            Image(systemName: "circle.hexagongrid.fill")
                                .font(.system(size: 36))
                                .foregroundStyle(style)
                            Text(".\(level)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(LinearGradient(colors: [.blue, .pink], startPoint: .top, endPoint: .bottom))
                        Text("gradient").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "flame.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.tint)
                        Text(".tint").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            FBSVariantRow(title: "foregroundStyle(_:_:) — two-layer hierarchy") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Image(systemName: "cloud.sun.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.yellow, .blue)
                        APICallout(".foregroundStyle(.yellow, .blue)")
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.tint, .secondary)
                        APICallout(".foregroundStyle(.tint, .secondary)")
                    }
                }
            }

            FBSVariantRow(title: "foregroundStyle(_:_:_:) — three-layer hierarchy") {
                VStack(spacing: 6) {
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.tint, .tint.opacity(0.6), .tint.opacity(0.3))
                    APICallout(".foregroundStyle(.tint, .tint.opacity(0.6), .tint.opacity(0.3))")
                }
            }

            FBSVariantRow(title: "backgroundStyle(_:)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Text("Hello")
                            .padding(12)
                            .backgroundStyle(.tint)
                            .background(.tint, in: RoundedRectangle(cornerRadius: 8))
                        APICallout(".backgroundStyle(.tint)")
                    }
                    VStack(spacing: 6) {
                        Text("World")
                            .padding(12)
                            .backgroundStyle(Color.purple.gradient)
                            .background(Color.purple.gradient, in: RoundedRectangle(cornerRadius: 8))
                        APICallout(".backgroundStyle(.purple.gradient)")
                    }
                }
            }

            FBSVariantRow(title: "tint(_:) — controls accent propagation") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        Button("Default") {}.buttonStyle(.borderedProminent)
                        Text(".tint (default)").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Button("Indigo") {}.buttonStyle(.borderedProminent).tint(.indigo)
                        Text(".tint(.indigo)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Button("Pink") {}.buttonStyle(.borderedProminent).tint(.pink)
                        Text(".tint(.pink)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            FBSVariantRow(title: "border(_:width:)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Text("Hello")
                            .padding(12)
                            .border(.tint)
                        APICallout(".border(.tint)")
                    }
                    VStack(spacing: 6) {
                        Text("Hello")
                            .padding(12)
                            .border(.tint, width: 4)
                        APICallout(".border(.tint, width: 4)")
                    }
                    VStack(spacing: 6) {
                        Text("Hello")
                            .padding(12)
                            .border(LinearGradient(colors: [.blue, .pink], startPoint: .leading, endPoint: .trailing), width: 3)
                        APICallout(".border(LinearGradient(...))")
                    }
                }
            }

            FBSVariantRow(title: "ShadowStyle") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.background)
                            .frame(width: 100, height: 60)
                            .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
                        APICallout(".shadow(radius: 8, y: 4)")
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.yellow)
                            .shadow(color: .yellow.opacity(0.6), radius: 10, x: 0, y: 0)
                        APICallout("inner glow .shadow")
                    }
                    VStack(spacing: 6) {
                        Text("Drop Shadow")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .shadow(color: Color.accentColor.opacity(0.5), radius: 6, x: 2, y: 2)
                        APICallout("text shadow")
                    }
                }
            }

            FBSVariantRow(title: "AnyShapeStyle — type-erased style") {
                let style: AnyShapeStyle = AnyShapeStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                RoundedRectangle(cornerRadius: 12)
                    .fill(style)
                    .frame(width: 200, height: 80)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            FBSVariantRow(title: "Hierarchical fill applied to SF Symbol layers") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        Image(systemName: "externaldrive.fill.badge.checkmark")
                            .font(.system(size: 48))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.tint)
                        Text(".hierarchical").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "externaldrive.fill.badge.checkmark")
                            .font(.system(size: 48))
                            .symbolRenderingMode(.multicolor)
                        Text(".multicolor").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "externaldrive.fill.badge.checkmark")
                            .font(.system(size: 48))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.tint, .green)
                        Text(".palette").font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("foregroundStyle propagates down the view hierarchy.", "Setting .foregroundStyle on a container applies to all descendant Text, Image, and Shape views. Descendants can override by applying their own .foregroundStyle.", "arrow.down.to.line"),
        ("Two- and three-layer styles target SF Symbol layers.", "SF Symbols with multiple rendering layers (hierarchical, palette) use the first, second, and third style arguments respectively.", "square.3.layers.3d"),
        ("tint(_:) is the modern replacement for .accentColor.", ".tint propagates into controls (Button, Toggle, ProgressView) through the environment. Always prefer .tint over direct .foregroundStyle on controls.", "paintbrush"),
        ("border(_:width:) draws outside the frame.", ".border extends outward — be aware it can overlap adjacent views. Use .overlay with .stroke for more control, especially inside padded layouts.", "square.and.pencil"),
        ("AnyShapeStyle erases the concrete type for storage.", "When you need to store a ShapeStyle in a property or pass it without generics, wrap it in AnyShapeStyle.", "square.3.layers.3d")
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

private struct FBSVariantRow<Content: View>: View {
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
    ForegroundBackgroundStylePage()
        .frame(width: 1100, height: 1300)
}
