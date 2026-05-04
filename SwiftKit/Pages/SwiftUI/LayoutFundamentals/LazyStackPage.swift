import SwiftUI

// SwiftUI LazyHStack, LazyVStack reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/lazyhstack.md
// macOS 14.0+

struct LazyStackPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("LazyHStack / LazyVStack")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Lazy stack containers that create child views only when they become visible in a surrounding ScrollView. Use for large or unbounded data sets.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/lazyvstack.md · macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("ScrollView { LazyVStack { ForEach(0..<1000) { Text(\"Row \\($0)\") } } }")
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(0..<50) { i in
                            Text("Row \(i)")
                                .font(.callout).foregroundStyle(.primary)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                            if i < 49 {
                                Divider()
                            }
                        }
                    }
                }
                .frame(height: 180)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("LazyVStack with pinned section headers").font(.headline).foregroundStyle(.primary)
                    APICallout("LazyVStack(pinnedViews: [.sectionHeaders]) { Section { … } header: { … } }")
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            ForEach(["A", "B", "C"], id: \.self) { section in
                                Section {
                                    ForEach(0..<5) { i in
                                        Text("\(section)\(i + 1)")
                                            .font(.callout).foregroundStyle(.primary)
                                            .padding(.horizontal, 12).padding(.vertical, 6)
                                        Divider()
                                    }
                                } header: {
                                    Text("Section \(section)")
                                        .font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                                        .padding(.horizontal, 12).padding(.vertical, 4)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(.background)
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("LazyHStack — horizontal lazy scrolling").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollView(.horizontal) { LazyHStack { … } }")
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(0..<30) { i in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hue: Double(i) / 30.0, saturation: 0.5, brightness: 0.7).opacity(0.4))
                                    .frame(width: 64, height: 64)
                                    .overlay(Text("\(i)").font(.caption).foregroundStyle(.primary))
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 84)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("PinnedScrollableViews options").font(.headline).foregroundStyle(.primary)
                APICallout("pinnedViews: [.sectionHeaders]  // or .sectionFooters, or both")
                Text("pinnedViews keeps section header or footer views stuck to the scroll edge while scrolling through their section's content.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("LazyVStack/LazyHStack do NOT measure their children until visible — great for performance, bad for height calculations.", systemImage: "bolt.fill")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Unlike VStack, LazyVStack won't fill the available width by default — wrap in a frame(.maxWidth: .infinity) if needed.", systemImage: "arrow.left.and.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("pinnedViews requires a ScrollView ancestor to take effect.", systemImage: "pin")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    LazyStackPage().frame(width: 900, height: 900)
}
