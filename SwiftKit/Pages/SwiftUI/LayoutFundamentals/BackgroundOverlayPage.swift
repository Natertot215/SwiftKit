import SwiftUI

// SwiftUI background(_:) / overlay(_:) modifiers reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/background.md
// macOS 10.15+

struct BackgroundOverlayPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("background / overlay")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Add layers behind (background) or in front (overlay) of a view, using ShapeStyles, shapes, or arbitrary views.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/background.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("background(_:ignoresSafeAreaEdges:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".background(.tint.opacity(0.15))")
                    Text("Hello, background")
                        .padding()
                        .background(.tint.opacity(0.15))
                        .foregroundStyle(.primary)
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("background(_:in:fillStyle:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".background(.fill.secondary, in: RoundedRectangle(cornerRadius: 10))")
                    Text("Shaped background")
                        .padding(.horizontal, 16).padding(.vertical, 8)
                        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.primary)
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("background(alignment:content:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".background(alignment: .bottomTrailing) { Circle()… }")
                    Text("View with custom background")
                        .padding()
                        .frame(width: 200, height: 80)
                        .background(alignment: .bottomTrailing) {
                            Circle()
                                .fill(.tint.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .offset(x: 10, y: 10)
                        }
                        .foregroundStyle(.primary)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("overlay(_:ignoresSafeAreaEdges:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".overlay(.separator.opacity(0.5))")
                    Text("Overlay tint wash")
                        .font(.title2).fontWeight(.semibold)
                        .padding()
                        .frame(width: 200, height: 80)
                        .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 10))
                        .overlay(.tint.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.primary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("overlay(_:in:fillStyle:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".overlay(.separator, in: RoundedRectangle(cornerRadius: 8).stroke())")
                    Text("Border via overlay")
                        .padding()
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(.separator, in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
                        .foregroundStyle(.primary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("overlay(alignment:content:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".overlay(alignment: .topTrailing) { badge }")
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.secondary)
                        .padding()
                        .overlay(alignment: .topTrailing) {
                            Text("3")
                                .font(.caption2).fontWeight(.bold)
                                .frame(width: 18, height: 18)
                                .background(.red, in: Circle())
                                .foregroundStyle(.white)
                                .offset(x: 4, y: -4)
                        }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("EnvironmentValues.backgroundMaterial").font(.headline).foregroundStyle(.primary)
                    APICallout(".background(.ultraThinMaterial)")
                    Text("Material background")
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.primary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("containerBackground(_:for:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".containerBackground(.background, for: .navigation)")
                    Text("containerBackground applies behind entire containers (navigation stack, TabView, etc.) using a ContainerBackgroundPlacement value.")
                        .font(.callout).foregroundStyle(.secondary)
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("ContainerBackgroundPlacement cases").font(.headline).foregroundStyle(.primary)
                    APICallout(".navigation  //  .tabView  //  .widget  //  .contentUnavailableView")
                    Text("Each case targets a different container type. The system manages layering — you provide the ShapeStyle.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("background() grows to match the view's frame. It does not clip the view.", systemImage: "square.dashed")
                    .font(.callout).foregroundStyle(.secondary)
                Label("overlay() sits on top and doesn't affect layout — perfect for badges and borders.", systemImage: "square.on.square")
                    .font(.callout).foregroundStyle(.secondary)
                Label("ignoresSafeAreaEdges: .all lets the background bleed beyond safe-area bounds.", systemImage: "arrow.up.backward.and.arrow.down.forward")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    BackgroundOverlayPage().frame(width: 900, height: 900)
}
