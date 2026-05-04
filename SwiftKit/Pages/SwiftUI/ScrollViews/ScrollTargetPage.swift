import SwiftUI

// SwiftUI ScrollTargetBehavior, scrollTargetBehavior(_:), scrollTargetLayout(isEnabled:),
// PagingScrollTargetBehavior, ViewAlignedScrollTargetBehavior, AnyScrollTargetBehavior,
// ScrollTarget, ScrollTargetBehaviorContext, ScrollTargetBehaviorProperties,
// ScrollTargetBehaviorPropertiesContext reference page.
// macOS 14.0+

struct ScrollTargetPage: View {
    @State private var selectedPage = 0

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("ScrollTargetBehavior / scrollTargetBehavior")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Controls where a ScrollView settles after a scroll gesture ends. Built-in behaviors: .paging and .viewAligned.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/scroll-views/scrolltargetbehavior.md · macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout(".scrollTargetBehavior(.paging)")
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(["Page 1", "Page 2", "Page 3", "Page 4"], id: \.self) { page in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.tint.opacity(0.2))
                                .frame(width: 280, height: 120)
                                .overlay(Text(page).font(.title3).fontWeight(.semibold).foregroundStyle(.tint))
                                .padding(.horizontal, 8)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .frame(width: 296, height: 140)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("Snaps to page-sized increments after each swipe")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ViewAlignedScrollTargetBehavior").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollTargetBehavior(.viewAligned)")
                    APICallout(".scrollTargetLayout(isEnabled: true)  // mark the layout container")
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(0..<8) { i in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hue: Double(i) / 8.0, saturation: 0.5, brightness: 0.7).opacity(0.35))
                                    .frame(width: 80, height: 80)
                                    .overlay(Text("Card \(i + 1)").font(.caption2).foregroundStyle(.primary))
                            }
                        }
                        .padding(.horizontal, 12)
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .frame(height: 100)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Snaps to the nearest card edge after scrolling")
                        .font(.caption).foregroundStyle(.tertiary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("AnyScrollTargetBehavior — type erasure").font(.headline).foregroundStyle(.primary)
                    APICallout("let behavior: some ScrollTargetBehavior = .paging")
                    APICallout("AnyScrollTargetBehavior(PagingScrollTargetBehavior())")
                    Text("AnyScrollTargetBehavior erases the concrete type. Use when the behavior is chosen at runtime.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollTarget").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollTarget(rect: CGRect, anchor: UnitPoint?)")
                    Text("ScrollTarget is passed to ScrollTargetBehavior.updateTarget(_:context:) to let custom behaviors adjust the proposed scroll destination.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Custom ScrollTargetBehavior").font(.headline).foregroundStyle(.primary)
                    APICallout("""
struct SnapEvery100: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        let snapped = (target.rect.origin.y / 100).rounded() * 100
        target.rect.origin.y = snapped
    }
}
""")
                    Text("ScrollTargetBehaviorContext provides containerSize, axes, velocity, and originalTarget to inform snapping decisions.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("ScrollTargetBehaviorProperties / ScrollTargetBehaviorPropertiesContext").font(.headline).foregroundStyle(.primary)
                APICallout("static var properties: ScrollTargetBehaviorProperties { … }")
                Text("ScrollTargetBehaviorProperties is a static property on ScrollTargetBehavior. Declare .axes to tell SwiftUI which axes the behavior applies to.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label(".scrollTargetLayout() must wrap the items container (HStack/VStack/LazyHStack), not the individual items.", systemImage: "square.grid.3x3")
                    .font(.callout).foregroundStyle(.secondary)
                Label("PagingScrollTargetBehavior snaps to full-container increments. ViewAlignedScrollTargetBehavior snaps to individual item boundaries.", systemImage: "arrow.left.and.right.square")
                    .font(.callout).foregroundStyle(.secondary)
                Label("ViewAlignedScrollTargetBehavior(limitBehavior: .always) limits scrolling to one item per gesture.", systemImage: "1.circle")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ScrollTargetPage().frame(width: 900, height: 900)
}
