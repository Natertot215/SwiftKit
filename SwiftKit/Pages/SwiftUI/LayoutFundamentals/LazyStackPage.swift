import SwiftUI

// Dense LazyStack reference page. Consolidates four previously-separate leaves:
//   • LazyVStack                                                        (struct)
//   • LazyHStack                                                        (struct)
//   • Grouping data with lazy stack views                               (guide)
//   • Creating performant scrollable stacks                             (guide)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/lazyvstack.md
//   Documentation/SwiftUI/layout-fundamentals/lazyhstack.md
//   macOS 11.0+

struct LazyStackPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                lazyVStackSection
                lazyHStackSection
                pinnedViewsSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Lazy Stacks")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("LazyVStack and LazyHStack create child views on demand as they become visible inside a ScrollView. Use them for large or unbounded data sets where eager VStack/HStack would be too slow to lay out.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/lazyvstack.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("LazyVStack  \u{00b7}  LazyHStack  \u{00b7}  PinnedScrollableViews  \u{00b7}  pinnedViews:")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: LazyVStack

    private var lazyVStackSection: some View {
        PageSection("LazyVStack", subtitle: "struct LazyVStack<Content: View> \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A vertical stack that creates its children lazily — only as they scroll into the visible region. Accepts alignment, spacing, and an optional pinnedViews option set for section headers/footers.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("LazyVStack(alignment: .leading, spacing: 0) { ForEach(\u{2026}) }")
                    APICallout("LazyVStack(pinnedViews: [.sectionHeaders]) { Section { \u{2026} } header: { \u{2026} } }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("50 rows — only visible rows are rendered")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(0..<50) { i in
                                Text("Row \(i)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                if i < 49 { Divider() }
                            }
                        }
                    }
                    .frame(height: 180)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("ScrollView { LazyVStack(spacing: 0) { ForEach(0..<50) { Text(\"Row \\($0)\") } } }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(["leading", "center", "trailing"], id: \.self) { alignLabel in
                            let align: HorizontalAlignment = alignLabel == "leading" ? .leading : alignLabel == "center" ? .center : .trailing
                            VStack(alignment: .leading, spacing: 4) {
                                Text(".\(alignLabel)")
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                VStack(alignment: align, spacing: 4) {
                                    Text("Short")
                                        .padding(.horizontal, 6).padding(.vertical, 2)
                                        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 4))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    Text("Longer text item")
                                        .padding(.horizontal, 6).padding(.vertical, 2)
                                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                                        .font(.caption)
                                        .foregroundStyle(.tint)
                                }
                                .frame(width: 90)
                            }
                        }
                    }
                    APICallout("LazyVStack(alignment: .leading / .center / .trailing) { \u{2026} }")
                }

                noteRow(
                    title: "LazyVStack does not fill available width by default.",
                    detail: "Unlike VStack, the lazy variant sizes to its content. Wrap in .frame(maxWidth: .infinity, alignment: .leading) if you need it to fill the container.",
                    symbol: "arrow.left.and.right"
                )
            }
        }
    }

    // MARK: LazyHStack

    private var lazyHStackSection: some View {
        PageSection("LazyHStack", subtitle: "struct LazyHStack<Content: View> \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A horizontal stack that creates its children lazily. Requires a horizontal ScrollView to trigger lazy creation. Accepts alignment (vertical), spacing, and pinnedViews.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("ScrollView(.horizontal) { LazyHStack(spacing: 10) { ForEach(\u{2026}) } }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Horizontal lazy row — 30 color tiles")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(0..<30) { i in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hue: Double(i) / 30.0, saturation: 0.5, brightness: 0.7).opacity(0.45))
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

                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment variants — vertical axis")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(["top", "center", "bottom"], id: \.self) { alignLabel in
                            let align: VerticalAlignment = alignLabel == "top" ? .top : alignLabel == "center" ? .center : .bottom
                            VStack(alignment: .leading, spacing: 2) {
                                Text(".\(alignLabel)")
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                HStack(alignment: align, spacing: 6) {
                                    swatch(height: 32)
                                    swatch(height: 52)
                                    swatch(height: 40)
                                }
                            }
                        }
                    }
                    APICallout("LazyHStack(alignment: .top / .center / .bottom) { \u{2026} }")
                }

                noteRow(
                    title: "LazyHStack requires a horizontal ScrollView.",
                    detail: "Without a scroll container the lazy evaluation has no scroll offset to key off, so it falls back to eager rendering. Always pair with ScrollView(.horizontal).",
                    symbol: "arrow.left.and.right.square"
                )
            }
        }
    }

    // MARK: Pinned Headers / Footers

    private var pinnedViewsSection: some View {
        PageSection("Pinning headers and footers", subtitle: "pinnedViews: parameter \u{00b7} PinnedScrollableViews \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The pinnedViews parameter takes a PinnedScrollableViews option set. Pass .sectionHeaders, .sectionFooters, or both to keep section boundaries pinned to the scroll edge as content scrolls beneath them.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("LazyVStack(pinnedViews: [.sectionHeaders]) { Section { \u{2026} } header: { \u{2026} } }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Pinned section headers — scroll the list to see them stick")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            ForEach(["Favorites", "Recents", "All Items"], id: \.self) { section in
                                Section {
                                    ForEach(0..<4) { i in
                                        Text("\(section) \u{00b7} Item \(i + 1)")
                                            .font(.callout)
                                            .foregroundStyle(.primary)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 7)
                                        Divider().padding(.leading, 12)
                                    }
                                } header: {
                                    Text(section)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.secondary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 5)
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
                    Text("Pinned footers — end-of-section markers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionFooters]) {
                            ForEach(["Alpha", "Beta"], id: \.self) { section in
                                Section {
                                    ForEach(0..<4) { i in
                                        Text("\(section) \u{00b7} Item \(i + 1)")
                                            .font(.callout)
                                            .foregroundStyle(.primary)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 7)
                                        Divider().padding(.leading, 12)
                                    }
                                } footer: {
                                    Text("End of \(section)")
                                        .font(.caption)
                                        .foregroundStyle(.tertiary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 5)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(.background)
                                }
                            }
                        }
                    }
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("pinnedViews: []                             // no pinning — default")
                    APICallout("pinnedViews: [.sectionHeaders]              // headers stick to top")
                    APICallout("pinnedViews: [.sectionFooters]              // footers stick to bottom")
                    APICallout("pinnedViews: [.sectionHeaders, .sectionFooters]  // both pinned")
                }

                noteRow(
                    title: "Pinning requires a ScrollView ancestor.",
                    detail: "pinnedViews has no effect without a ScrollView parent to provide the scroll offset. The option set is on the stack, but the ScrollView drives the pinning behavior.",
                    symbol: "pin"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: "Lazy stacks defer child creation until scroll position demands them.",
                    detail: "Views are created as the scroll offset brings them into the visible region. They may be deallocated when they scroll far out of view, reducing memory pressure.",
                    symbol: "bolt.fill"
                )
                noteRow(
                    title: "Do NOT measure height from a lazy stack alone.",
                    detail: "LazyVStack won't measure children that aren't visible, so its intrinsic content height is unknown until all children have appeared. Avoid using it as a height source for other layout calculations.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "When to upgrade from VStack to LazyVStack.",
                    detail: "Switch when the item count exceeds 50\u{2013}100 and the list is inside a ScrollView. For 10\u{2013}20 static items, VStack is fine and simpler. For selection and swipe actions, use List instead.",
                    symbol: "arrow.up.circle"
                )
                noteRow(
                    title: "Pinned header background should use .background(.background).",
                    detail: "Use the semantic .background token, not .ultraThinMaterial, to avoid double-blur artifacts where the pinned header overlaps the scroll content.",
                    symbol: "eyedropper"
                )
            }
        }
    }

    // MARK: Helpers

    private func swatch(height: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(.tint.opacity(0.3))
            .frame(width: 44, height: height)
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

#Preview {
    LazyStackPage()
        .frame(width: 1000, height: 1100)
}
