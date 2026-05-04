import SwiftUI

// SwiftUI HStack, VStack, ZStack reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/hstack.md
// macOS 10.15+

struct HStackPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("HStack / VStack / ZStack")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Fundamental stack containers that arrange children horizontally, vertically, or overlapping in depth.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("HStack").font(.headline).foregroundStyle(.primary)
                    APICallout("HStack(alignment: .center, spacing: 12) { … }")
                    HStack(alignment: .center, spacing: 12) {
                        ForEach(["Alpha", "Beta", "Gamma"], id: \.self) { label in
                            Text(label)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                                .foregroundStyle(.tint)
                        }
                    }
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("VStack").font(.headline).foregroundStyle(.primary)
                    APICallout("VStack(alignment: .leading, spacing: 8) { … }")
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(["First item", "Second item", "Third item"], id: \.self) { label in
                            Label(label, systemImage: "circle.fill")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                Divider()
                VStack(alignment: .leading, spacing: 8) {
                    Text("ZStack").font(.headline).foregroundStyle(.primary)
                    APICallout("ZStack(alignment: .bottomTrailing) { … }")
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.tint.opacity(0.2))
                            .frame(width: 120, height: 80)
                        Text("Badge")
                            .font(.caption2).fontWeight(.semibold)
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background(.tint, in: Capsule())
                            .foregroundStyle(.white)
                            .offset(x: 8, y: 8)
                    }
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("HStack alignment options").font(.headline).foregroundStyle(.primary)
                    HStack(alignment: .top) {
                        swatch(height: 40, label: ".top")
                        swatch(height: 64, label: ".top")
                        swatch(height: 50, label: ".top")
                    }
                    APICallout("HStack(alignment: .top) { … }")
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("VStack alignment options").font(.headline).foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(".leading")
                                .font(.caption).foregroundStyle(.tertiary)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Short")
                                Text("A longer text item here")
                            }
                            .font(.callout).foregroundStyle(.secondary)
                        }
                        VStack(alignment: .center, spacing: 4) {
                            Text(".center")
                                .font(.caption).foregroundStyle(.tertiary)
                            VStack(alignment: .center, spacing: 4) {
                                Text("Short")
                                Text("A longer text item here")
                            }
                            .font(.callout).foregroundStyle(.secondary)
                        }
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(".trailing")
                                .font(.caption).foregroundStyle(.tertiary)
                            VStack(alignment: .trailing, spacing: 4) {
                                Text("Short")
                                Text("A longer text item here")
                            }
                            .font(.callout).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Spacing parameter effect").font(.headline).foregroundStyle(.primary)
                ForEach([0, 8, 24], id: \.self) { spacing in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("spacing: \(spacing)").font(.caption).foregroundStyle(.tertiary)
                        HStack(spacing: CGFloat(spacing)) {
                            ForEach(["A", "B", "C", "D"], id: \.self) { l in
                                Text(l)
                                    .frame(width: 28, height: 28)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 4))
                                    .foregroundStyle(.secondary)
                            }
                        }
                        APICallout("HStack(spacing: \(spacing)) { … }")
                    }
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("HStack/VStack expand to fit the largest child on the cross axis by default.", systemImage: "arrow.left.and.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Spacing=nil uses system default (8pt on macOS). Spacing=0 eliminates all gaps.", systemImage: "ruler")
                    .font(.callout).foregroundStyle(.secondary)
                Label("ZStack draws children back-to-front. The alignment applies to all layers simultaneously.", systemImage: "square.3.layers.3d")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func swatch(height: CGFloat, label: String) -> some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(.tint.opacity(0.25))
            .frame(width: 50, height: height)
            .overlay(Text(label).font(.caption2).foregroundStyle(.tint))
    }
}

#Preview {
    HStackPage().frame(width: 900, height: 800)
}
