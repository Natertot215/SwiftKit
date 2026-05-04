import SwiftUI

// SwiftUI scroll modifier collection:
// scrollIndicators, scrollBounceBehavior, scrollClipDisabled, scrollContentBackground,
// scrollDisabled, scrollEdgeEffectHidden/Style, scrollTransition,
// scrollIndicatorsFlash, scrollInputBehavior
// macOS 13.0+

struct ScrollModifiersPage: View {
    @State private var flashTrigger = false

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Scroll View Modifiers")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A collection of modifiers that control scroll indicator visibility, bounce behavior, content clipping, scroll transitions, and more.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/scroll-views/ · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 20) {
                scrollModifierDemo(
                    title: "scrollIndicators(_:axes:)",
                    api: ".scrollIndicators(.visible)"
                ) {
                    ScrollView {
                        VStack(spacing: 4) {
                            ForEach(0..<15) { i in Text("Row \(i)").font(.callout).foregroundStyle(.primary).padding(.horizontal, 8) }
                        }.padding(4)
                    }
                    .scrollIndicators(.visible)
                }

                scrollModifierDemo(
                    title: "scrollBounceBehavior(_:axes:)",
                    api: ".scrollBounceBehavior(.basedOnSize)"
                ) {
                    ScrollView {
                        VStack(spacing: 4) {
                            ForEach(0..<4) { i in Text("Item \(i)").font(.callout).foregroundStyle(.primary).padding(.horizontal, 8) }
                        }.padding(4)
                    }
                    .scrollBounceBehavior(.basedOnSize)
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollClipDisabled(_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollClipDisabled(true)")
                    Text("Allows scroll content to render outside the scroll view's frame — useful for cards with shadows that would otherwise be clipped.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollContentBackground(_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollContentBackground(.hidden)  //  or .visible")
                    Text("Hides or shows the system background behind scroll content. Most commonly used with List to reveal a custom background.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollDisabled(_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollDisabled(true)")
                    Text("Prevents the view from scrolling. Content is still visible but user-initiated scrolling is blocked.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollEdgeEffectStyle(_:for:) / scrollEdgeEffectHidden(_:for:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollEdgeEffectStyle(.hard, for: .bottom)")
                    APICallout(".scrollEdgeEffectHidden(true, for: .top)")
                    APICallout("ScrollEdgeEffectStyle: .soft  //  .hard  //  .automatic")
                    Text("Controls the fade/shadow effect at scroll edges. macOS 26.0+.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollTransition(_:axis:transition:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollTransition { content, phase in content.opacity(phase.isIdentity ? 1 : 0.3) }")
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(0..<8) { i in
                                scrollTransitionItem(index: i)
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 92)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollIndicatorsFlash(onAppear:) / flash(trigger:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollIndicatorsFlash(onAppear: true)")
                    APICallout(".scrollIndicatorsFlash(trigger: value)")
                    Text("Briefly shows scroll indicators when the view appears or a trigger value changes.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scrollInputBehavior(_:for:) — ScrollInputBehavior").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollInputBehavior(.enabled, for: .trackpad)")
                    APICallout("ScrollInputKind: .trackpad  //  .mouse  //  .all")
                    APICallout("ScrollInputBehavior: .enabled  //  .disabled")
                    Text("Fine-grained control over which input devices (trackpad vs mouse wheel) can scroll. macOS 26.0+.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollBounceBehavior cases").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollBounceBehavior: .automatic  //  .always  //  .basedOnSize")
                    Text(".basedOnSize disables bounce when content fits the container. .always always allows bounce. .automatic follows the platform default.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ScrollIndicatorVisibility cases").font(.headline).foregroundStyle(.primary)
                    APICallout("ScrollIndicatorVisibility: .automatic  //  .visible  //  .hidden  //  .never")
                    Text(".never suppresses indicators even on scroll, whereas .hidden only hides them while stationary.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("ScrollContentOffsetAdjustmentBehavior (macOS 26.0+)").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollContentOffsetAdjustmentBehavior: .automatic  //  .disabled")
                Text("Controls whether the scroll view automatically adjusts the offset when content is inserted at the top — used for chat-style feeds that need anchor-at-bottom behavior.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("scrollTransition fires for each item as it enters/exits the scroll view's visible bounds.", systemImage: "wand.and.sparkles")
                    .font(.callout).foregroundStyle(.secondary)
                Label("scrollBounceBehavior(.basedOnSize) is the recommended default for most uses — prevents empty-list bounce.", systemImage: "arrow.up.and.down")
                    .font(.callout).foregroundStyle(.secondary)
                Label("scrollEdgeEffectStyle requires macOS 26.0+.", systemImage: "exclamationmark.circle")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func scrollTransitionItem(index: Int) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.accentColor.opacity(0.3))
            .frame(width: 72, height: 72)
            .overlay(Text("\(index + 1)").font(.caption).foregroundStyle(.tint))
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0.4)
                    .scaleEffect(phase.isIdentity ? 1 : 0.85)
            }
    }

    private func scrollModifierDemo<V: View>(
        title: String,
        api: String,
        @ViewBuilder content: () -> V
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            APICallout(api)
            content()
                .frame(height: 100)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }
}

#Preview {
    ScrollModifiersPage().frame(width: 900, height: 1000)
}
