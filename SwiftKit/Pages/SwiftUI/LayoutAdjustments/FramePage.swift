import SwiftUI

// SwiftUI frame() modifiers reference page.
// Source: Documentation/SwiftUI/layout-adjustments/frame.md
// macOS 10.15+

struct FramePage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("frame(width:height:) / frame(min:ideal:max:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Propose a specific size to a view, or constrain its minimum, ideal, and maximum dimensions.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Fixed frame").font(.headline).foregroundStyle(.primary)
                    APICallout(".frame(width: 200, height: 60, alignment: .leading)")
                    Rectangle().fill(.tint.opacity(0.2))
                        .frame(width: 200, height: 60)
                        .overlay(alignment: .leading) {
                            Text("200 × 60").font(.caption).foregroundStyle(.tint).padding(.leading, 8)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Flexible frame").font(.headline).foregroundStyle(.primary)
                    APICallout(".frame(maxWidth: .infinity, minHeight: 40)")
                    Rectangle().fill(Color.accentColor.opacity(0.15))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .overlay(Text("maxWidth: .infinity").font(.caption).foregroundStyle(Color.accentColor))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("alignment parameter").font(.headline).foregroundStyle(.primary)
                    APICallout(".frame(width: 200, height: 60, alignment: .topLeading)")
                    HStack(spacing: 12) {
                        ForEach([
                            (Alignment.topLeading, "topLeading"),
                            (.center, "center"),
                            (.bottomTrailing, "bottomTrailing")
                        ], id: \.1) { alignment, label in
                            VStack(spacing: 4) {
                                Text("Hello")
                                    .frame(width: 100, height: 50, alignment: alignment)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                                    .foregroundStyle(.primary)
                                Text(label)
                                    .font(.caption2).foregroundStyle(.tertiary)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("min/ideal/max constraints").font(.headline).foregroundStyle(.primary)
                    APICallout(".frame(minWidth: 80, maxWidth: 300)")
                    Text("Constrained text wrapping")
                        .frame(minWidth: 80, maxWidth: 300)
                        .padding(8)
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        .foregroundStyle(.primary)
                    Text(".idealWidth triggers fixedSize() to use the view's preferred dimensions")
                        .font(.caption).foregroundStyle(.tertiary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("maxWidth: .infinity — fill all available space").font(.headline).foregroundStyle(.primary)
                    APICallout(".frame(maxWidth: .infinity, alignment: .leading)")
                    HStack(spacing: 0) {
                        Text("Full width")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.tint.opacity(0.15))
                            .foregroundStyle(.primary)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 12) {
                Text("idealWidth / idealHeight — works with fixedSize()").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(idealWidth: 200).fixedSize(horizontal: true, vertical: false)")
                Text("When you set an idealWidth and then apply .fixedSize(), SwiftUI proposes that width to the child regardless of the parent's offer.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label(".frame() wraps the child; it doesn't clip. The child can draw outside if it ignores the proposal.", systemImage: "square.dashed")
                    .font(.callout).foregroundStyle(.secondary)
                Label("maxWidth: .infinity expands to fill the offered space — the most common flexible layout pattern.", systemImage: "arrow.left.and.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Frame alignment is relative to the frame rectangle, not to the child's natural size.", systemImage: "align.horizontal.left")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    FramePage().frame(width: 900, height: 800)
}
