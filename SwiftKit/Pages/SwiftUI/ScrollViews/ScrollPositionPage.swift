import SwiftUI

// SwiftUI ScrollPosition, scrollPosition(_:anchor:), scrollPosition(id:anchor:),
// defaultScrollAnchor, ScrollAnchorRole reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollposition.md
// macOS 14.0+

struct ScrollPositionPage: View {
    @State private var scrollPosition = ScrollPosition(idType: Int.self)
    @State private var anchorPosition = ScrollPosition(edge: .top)

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("ScrollPosition / scrollPosition(_:anchor:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Tracks and programmatically controls scroll position using a binding to a ScrollPosition value or an id-based anchor.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/scroll-views/scrollposition.md · macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout("@State var pos = ScrollPosition(idType: Int.self)\nScrollView { … }.scrollPosition($pos)")
                HStack(spacing: 8) {
                    Button("Top") { withAnimation { scrollPosition.scrollTo(edge: .top) } }.font(.caption)
                    Button("Row 25") { withAnimation { scrollPosition.scrollTo(id: 25) } }.font(.caption)
                    Button("Bottom") { withAnimation { scrollPosition.scrollTo(edge: .bottom) } }.font(.caption)
                }
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<50) { i in
                            Text("Row \(i)")
                                .font(.callout).foregroundStyle(.primary)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .id(i)
                            Divider().padding(.leading, 12)
                        }
                    }
                }
                .scrollPosition($scrollPosition)
                .frame(height: 180)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                if let id = scrollPosition.viewID(type: Int.self) {
                    Text("First visible row: \(id)")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("defaultScrollAnchor(_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".defaultScrollAnchor(.bottom)")
                    Text("Sets the initial scroll anchor when the view appears. .bottom makes the ScrollView start at the bottom — common for chat/log UIs.")
                        .font(.callout).foregroundStyle(.secondary)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(0..<8) { i in
                                Text("Message \(i + 1)")
                                    .font(.callout).foregroundStyle(.primary)
                                    .padding(.horizontal, 12).padding(.vertical, 6)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Divider().padding(.leading, 12)
                            }
                        }
                    }
                    .defaultScrollAnchor(.bottom)
                    .frame(height: 120)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Starts at bottom — like a chat thread")
                        .font(.caption).foregroundStyle(.tertiary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("defaultScrollAnchor(_:for:) — ScrollAnchorRole").font(.headline).foregroundStyle(.primary)
                    APICallout(".defaultScrollAnchor(.bottom, for: .initialOffset)")
                    APICallout("ScrollAnchorRole: .initialOffset  //  .alignment  //  .sizeChanges  //  .all")
                    Text("ScrollAnchorRole selects which scroll-adjustment scenario the anchor applies to: initial load, content alignment, size changes, or all.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollPosition(id:anchor:) — deprecated style").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollPosition(id: $selectedID, anchor: .center)  // deprecated in macOS 14.0")
                    Text("The id-binding overload is deprecated. Prefer ScrollPosition with scrollPosition($pos).")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("ScrollPosition API").font(.headline).foregroundStyle(.primary)
                APICallout("scrollPosition.scrollTo(id: 42)")
                APICallout("scrollPosition.scrollTo(edge: .top)")
                APICallout("scrollPosition.scrollTo(point: CGPoint(x: 0, y: 200))")
                APICallout("scrollPosition.viewID(type: Int.self)  // read current top-visible ID")
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("ScrollPosition replaces the old id-binding scrollPosition API — more composable.", systemImage: "arrow.up.circle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("scrollTo(id:) only works when the target view has a matching .id() in the scroll view.", systemImage: "scope")
                    .font(.callout).foregroundStyle(.secondary)
                Label("viewID(type:) returns the ID of the first view in the scroll view that is fully or partially visible.", systemImage: "eye")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ScrollPositionPage().frame(width: 900, height: 900)
}
