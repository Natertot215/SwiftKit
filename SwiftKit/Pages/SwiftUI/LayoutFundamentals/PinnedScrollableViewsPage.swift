import SwiftUI

// SwiftUI PinnedScrollableViews reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/pinnedscrollableviews.md
// macOS 12.0+

struct PinnedScrollableViewsPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("PinnedScrollableViews")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("An option set that pins section headers and/or footers to the scroll edge of a ScrollView as content scrolls beneath them.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/pinnedscrollableviews.md · macOS 12.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("LazyVStack(pinnedViews: [.sectionHeaders]) { Section { … } header: { … } }")
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        ForEach(["Favorites", "Recents", "All Items"], id: \.self) { section in
                            Section {
                                ForEach(0..<4) { i in
                                    Text("\(section) · Item \(i + 1)")
                                        .font(.callout).foregroundStyle(.primary)
                                        .padding(.horizontal, 12).padding(.vertical, 7)
                                    Divider().padding(.leading, 12)
                                }
                            } header: {
                                Text(section)
                                    .font(.caption).fontWeight(.semibold)
                                    .foregroundStyle(.secondary)
                                    .padding(.horizontal, 12).padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.background)
                            }
                        }
                    }
                }
                .frame(height: 220)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("sectionFooters").font(.headline).foregroundStyle(.primary)
                    APICallout("LazyVStack(pinnedViews: [.sectionFooters]) { … }")
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionFooters]) {
                            ForEach(["Alpha", "Beta"], id: \.self) { section in
                                Section {
                                    ForEach(0..<5) { i in
                                        Text("\(section) · Item \(i + 1)")
                                            .font(.callout).foregroundStyle(.primary)
                                            .padding(.horizontal, 12).padding(.vertical, 7)
                                        Divider().padding(.leading, 12)
                                    }
                                } footer: {
                                    Text("End of \(section)")
                                        .font(.caption).foregroundStyle(.tertiary)
                                        .padding(.horizontal, 12).padding(.vertical, 5)
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
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Option set values").font(.headline).foregroundStyle(.primary)
                ForEach([
                    ("[]", "No pinning — headers/footers scroll with content"),
                    ("[.sectionHeaders]", "Headers stick to top edge"),
                    ("[.sectionFooters]", "Footers stick to bottom edge"),
                    ("[.sectionHeaders, .sectionFooters]", "Both headers and footers pinned")
                ], id: \.0) { code, desc in
                    VStack(alignment: .leading, spacing: 2) {
                        APICallout(code)
                        Text(desc).font(.caption).foregroundStyle(.tertiary)
                    }
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("PinnedScrollableViews is an option set — combine cases with set literal syntax.", systemImage: "checklist")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Works with LazyVStack/LazyHStack inside a ScrollView. Regular VStack doesn't support pinning.", systemImage: "bolt")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Pin background should use .background(.background) — not .ultraThinMaterial — to avoid double-blur artifacts.", systemImage: "eyedropper")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    PinnedScrollableViewsPage().frame(width: 900, height: 800)
}
