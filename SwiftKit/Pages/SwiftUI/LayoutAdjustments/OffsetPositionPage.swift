import SwiftUI

// SwiftUI offset() and position() modifiers reference page.
// Source: Documentation/SwiftUI/layout-adjustments/offset.md
// macOS 10.15+

struct OffsetPositionPage: View {
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("offset / position")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("offset() shifts a view visually without affecting layout. position() places a view at an absolute coordinate within its parent.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("offset(x:y:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".offset(x: 20, y: -10)")
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(.separator, lineWidth: 1, antialiased: true)
                            .frame(width: 160, height: 50)
                            .overlay(Text("Layout slot").font(.caption).foregroundStyle(.tertiary))
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.tint.opacity(0.3))
                            .frame(width: 160, height: 50)
                            .offset(x: 20, y: -10)
                            .overlay(
                                Text("Offset view")
                                    .font(.caption).foregroundStyle(.tint)
                                    .offset(x: 20, y: -10)
                            )
                    }
                    .frame(height: 80)
                    .padding(8)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("position(x:y:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".position(x: 80, y: 40)")
                    ZStack {
                        Text("At (80, 40)")
                            .font(.caption)
                            .padding(6)
                            .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 4))
                            .foregroundStyle(.tint)
                            .position(x: 80, y: 40)
                    }
                    .frame(width: 200, height: 80)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Interactive offset").font(.headline).foregroundStyle(.primary)
                    APICallout(".offset(x: \(Int(offsetX)), y: \(Int(offsetY)))")
                    HStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("X: \(Int(offsetX))").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                            Slider(value: $offsetX, in: -60...60, step: 2)
                                .frame(width: 140)
                            Text("Y: \(Int(offsetY))").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                            Slider(value: $offsetY, in: -30...30, step: 2)
                                .frame(width: 140)
                        }
                        ZStack {
                            Circle()
                                .strokeBorder(.separator, lineWidth: 1)
                                .frame(width: 20, height: 20)
                            Circle()
                                .fill(.tint)
                                .frame(width: 32, height: 32)
                                .offset(x: offsetX, y: offsetY)
                        }
                        .frame(width: 160, height: 80)
                        .clipped()
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("offset(_:) with CGSize").font(.headline).foregroundStyle(.primary)
                    APICallout(".offset(CGSize(width: 10, height: -5))")
                    Text(".offset(_:) accepts a CGSize value — equivalent to .offset(x: size.width, y: size.height).")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("offset() vs position() key difference").font(.headline).foregroundStyle(.primary)
                    Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 6) {
                        GridRow {
                            Text("modifier").font(.caption).fontWeight(.semibold).foregroundStyle(.secondary).gridColumnAlignment(.trailing)
                            Text("affects layout?").font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                        }
                        Divider().gridCellUnsizedAxes(.horizontal)
                        GridRow {
                            APICallout(".offset(x:y:)")
                            Text("No — layout slot stays at original position").font(.caption).foregroundStyle(.secondary)
                        }
                        GridRow {
                            APICallout(".position(x:y:)")
                            Text("Yes — view center placed at absolute coordinate").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("offset() is purely visual — siblings don't reflow when you offset a view.", systemImage: "eye")
                    .font(.callout).foregroundStyle(.secondary)
                Label("position() places the view's center at the given (x, y) within the parent's coordinate space.", systemImage: "scope")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Combining offset() with animation is the standard way to produce slide-in/slide-out transitions.", systemImage: "wand.and.stars")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    OffsetPositionPage().frame(width: 900, height: 800)
}
