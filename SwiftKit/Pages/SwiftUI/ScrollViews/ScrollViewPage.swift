import SwiftUI

// SwiftUI ScrollView, ScrollViewReader, ScrollViewProxy reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollview.md
// macOS 10.15+

struct ScrollViewPage: View {
    @State private var scrollTarget: Int? = nil

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("ScrollView / ScrollViewReader / ScrollViewProxy")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A scrollable container. ScrollViewReader and ScrollViewProxy enable programmatic scrolling to identified child views.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/scroll-views/scrollview.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollView — vertical (default)").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollView { VStack { … } }")
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(0..<12) { i in
                                Text("Item \(i + 1)")
                                    .font(.callout).foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 12).padding(.vertical, 6)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollView(.horizontal)").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollView(.horizontal) { HStack { … } }")
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(0..<20) { i in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hue: Double(i) / 20.0, saturation: 0.5, brightness: 0.7).opacity(0.4))
                                    .frame(width: 72, height: 72)
                                    .overlay(Text("\(i + 1)").font(.caption).foregroundStyle(.primary))
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 92)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollViewReader — programmatic scrolling").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollViewReader { proxy in proxy.scrollTo(id, anchor: .top) }")

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Button("Scroll to top") { scrollTarget = 0 }
                            Button("Scroll to 25") { scrollTarget = 24 }
                            Button("Scroll to bottom") { scrollTarget = 49 }
                        }
                        .font(.caption)

                        ScrollViewReader { proxy in
                            ScrollView {
                                VStack(spacing: 0) {
                                    ForEach(0..<50) { i in
                                        Text("Row \(i)")
                                            .font(.callout).foregroundStyle(.primary)
                                            .padding(.horizontal, 12).padding(.vertical, 5)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .id(i)
                                        Divider().padding(.leading, 12)
                                    }
                                }
                            }
                            .frame(height: 160)
                            .onChange(of: scrollTarget) { _, target in
                                if let t = target {
                                    withAnimation { proxy.scrollTo(t, anchor: .center) }
                                    scrollTarget = nil
                                }
                            }
                        }
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollView([.horizontal, .vertical]) — both axes").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollView([.horizontal, .vertical]) { … }")
                    ScrollView([.horizontal, .vertical]) {
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(0..<6) { row in
                                HStack(spacing: 4) {
                                    ForEach(0..<10) { col in
                                        Text("\(row),\(col)")
                                            .font(.caption2).fontDesign(.monospaced)
                                            .frame(width: 40, height: 24)
                                            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 3))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 100)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("showsIndicators — deprecated; use scrollIndicators(_:axes:)").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollIndicators(.visible)  //  .hidden  //  .automatic  //  .never")
                Text("The showsIndicators parameter on ScrollView is deprecated. Use the .scrollIndicators modifier instead.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("ScrollViewProxy.scrollTo(_:anchor:) only works with views that have a matching .id() in scope.", systemImage: "scope")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Wrap ScrollView content in a LazyVStack for large data sets — ScrollView itself is not lazy.", systemImage: "bolt")
                    .font(.callout).foregroundStyle(.secondary)
                Label("ScrollView clips its content by default. Use .scrollClipDisabled() to allow overflow.", systemImage: "scissors")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ScrollViewPage().frame(width: 900, height: 1000)
}
