import SwiftUI

// SwiftUI ScrollGeometry, onScrollGeometryChange, onScrollPhaseChange, onScrollVisibilityChange,
// onScrollTargetVisibilityChange, ScrollPhase, ScrollPhaseChangeContext,
// safeAreaBar reference page.
// macOS 14.0+

struct ScrollGeometryPage: View {
    @State private var scrollPhase: ScrollPhase = .idle
    @State private var contentOffset: CGPoint = .zero
    @State private var visibleIDs: Set<Int> = []

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("ScrollGeometry / Scroll Phase / Visibility")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("APIs that observe scroll geometry changes, scroll phase transitions, and visibility of scroll content items.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/scroll-views/ · macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".onScrollGeometryChange(for: CGPoint.self) { g in g.contentOffset } action: { _, new in … }")
                APICallout(".onScrollPhaseChange { _, new in scrollPhase = new }")

                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("offset: (\(Int(contentOffset.x)), \(Int(contentOffset.y)))")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        Text("phase: \(phaseLabel(scrollPhase))")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    Spacer()
                }

                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<30) { i in
                            Text("Row \(i)")
                                .font(.callout).foregroundStyle(.primary)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .id(i)
                            Divider().padding(.leading, 12)
                        }
                    }
                }
                .onScrollGeometryChange(for: CGPoint.self) { g in
                    g.contentOffset
                } action: { _, new in
                    contentOffset = new
                }
                .onScrollPhaseChange { _, new in
                    scrollPhase = new
                }
                .frame(height: 180)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollGeometry properties").font(.headline).foregroundStyle(.primary)
                    APICallout("""
geometry.contentOffset    // CGPoint — current scroll position
geometry.contentSize      // CGSize — total scrollable content size
geometry.containerSize    // CGSize — visible frame size
geometry.contentInsets    // EdgeInsets — scroll view insets
geometry.bounds           // CGRect — visible content bounds
""")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollPhase cases").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollPhase: .idle  //  .tracking  //  .interacting  //  .animating  //  .decelerating")
                    Text(".idle: no scroll activity. .tracking: finger is down, no movement yet. .interacting: active drag. .decelerating: momentum phase. .animating: programmatic scroll.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("onScrollVisibilityChange(threshold:_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".onScrollVisibilityChange(threshold: 0.5) { isVisible in … }")
                    Text("Fires when the view's visibility fraction crosses the threshold. 0.5 means at least 50% must be visible before the callback fires with true.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("onScrollTargetVisibilityChange(idType:threshold:_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".onScrollTargetVisibilityChange(idType: Int.self, threshold: 0.8) { ids in … }")
                    Text("Tracks a set of IDs that are currently visible above the threshold. The callback receives the current set of visible IDs.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("safeAreaBar(edge:alignment:spacing:content:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaBar(edge: .bottom, alignment: .center, spacing: 0) { BottomBar() }")
                    Text("Similar to safeAreaInset but explicitly adds a bar-style overlay that adjusts the scroll view's safe area. macOS 26.0+.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollPhaseChangeContext").font(.headline).foregroundStyle(.primary)
                    APICallout(".onScrollPhaseChange { old, new, context in context.geometry … }")
                    Text("ScrollPhaseChangeContext provides the current ScrollGeometry at the moment of transition, enabling response to velocity or position at phase-change time.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("ScrollTransitionPhase").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollTransitionPhase: .identity  //  .topLeading  //  .bottomTrailing")
                APICallout("phase.isIdentity  // Bool — true when view is in the visible region")
                APICallout("phase.value      // Double — -1.0 (above) → 0.0 (visible) → 1.0 (below)")
                Text("ScrollTransitionPhase is the argument in .scrollTransition { content, phase in … } closures.")
                    .font(.callout).foregroundStyle(.secondary)

                Text("ScrollTransitionConfiguration").font(.headline).foregroundStyle(.primary).padding(.top, 8)
                APICallout("ScrollTransitionConfiguration.animated  //  .interactive  //  .identity")
                Text("Controls how the transition phase is determined. .interactive provides a continuous phase value proportional to scroll position.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("onScrollGeometryChange uses equatable diffing — only fires when the selected value changes.", systemImage: "equal.circle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("ScrollPhase.isScrolling is true during .tracking, .interacting, and .decelerating.", systemImage: "arrow.up.and.down")
                    .font(.callout).foregroundStyle(.secondary)
                Label("safeAreaBar is macOS 26.0+ only. Use safeAreaInset for backwards compatibility.", systemImage: "exclamationmark.circle")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func phaseLabel(_ phase: ScrollPhase) -> String {
        switch phase {
        case .idle: return "idle"
        case .tracking: return "tracking"
        case .interacting: return "interacting"
        case .decelerating: return "decelerating"
        case .animating: return "animating"
        @unknown default: return "unknown"
        }
    }
}

#Preview {
    ScrollGeometryPage().frame(width: 900, height: 900)
}
