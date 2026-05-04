import SwiftUI
import TipKit

// SwiftUI TipKit modifiers reference page.
// Covers: popoverTip, tipBackground, tipCornerRadius, tipImageSize,
//         tipImageStyle (3 overloads), tipViewStyle
// Source: Documentation/SwiftUI/technology-specific-views/

struct TipKitPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("TipKit SwiftUI Modifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("popoverTip, TipView styling — tipBackground, tipCornerRadius, tipImageSize, tipImageStyle.")
                .font(.callout).foregroundStyle(.secondary)
            Text("TipKit macOS 14.0+ · styling modifiers macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "TipKit overview — core types") {
            snippet("""
            // 1. Define a Tip:
            struct NewFeatureTip: Tip {
                var title: Text { Text("Try the new feature") }
                var message: Text? { Text("Swipe right to reveal actions") }
                var image: Image? { Image(systemName: "sparkles") }

                // Optional rules:
                @Parameter static var hasOpenedApp: Bool = false
                var rules: [Rule] {
                    [#Rule(Self.$hasOpenedApp) { $0 == true }]
                }
            }

            // 2. Configure at app start:
            // Tips.configure([.displayFrequency(.daily), .datastoreLocation(.applicationDefault)])

            // 3. Show it:
            TipView(NewFeatureTip())             // inline view
            button.popoverTip(NewFeatureTip())   // popover
            """)
            APICallout("TipView(tip) / button.popoverTip(tip)")
            Text("TipKit manages display frequency, eligibility rules, and dismissal persistence automatically.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "popoverTip(_:arrowEdge:action:)") {
                snippet("""
                Button("New Feature") { useFeature() }
                    .popoverTip(NewFeatureTip(), arrowEdge: .bottom) { action in
                        if action.id == "learnMore" { showGuide() }
                    }
                // arrowEdge: .top, .bottom, .leading, .trailing
                // action: fires when a TipAction button in the tip is tapped
                """)
                Text("The action closure receives the TipAction that was tapped — wire it to navigation or tutorial flows.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "tipBackground(_:) — custom background") {
                snippet("""
                TipView(myTip)
                    .tipBackground(Color.accentColor.opacity(0.15))
                // or:
                TipView(myTip)
                    .tipBackground(.thinMaterial)
                """)
            }

            Block(title: "tipCornerRadius(_:antialiased:)") {
                snippet("""
                TipView(myTip)
                    .tipCornerRadius(16, antialiased: true)
                // Default: system-defined corner radius
                """)
            }

            Block(title: "tipImageSize(_:)") {
                snippet("""
                TipView(myTip)
                    .tipImageSize(CGSize(width: 48, height: 48))
                // Overrides the default tip icon size.
                """)
            }

            Block(title: "tipImageStyle — foreground style overloads") {
                snippet("""
                // Single style:
                TipView(myTip)
                    .tipImageStyle(.tint)

                // Two-level hierarchy:
                TipView(myTip)
                    .tipImageStyle(.primary, .secondary)

                // Three-level hierarchy:
                TipView(myTip)
                    .tipImageStyle(.primary, .secondary, .tertiary)
                """)
                Text("tipImageStyle maps to the foreground style hierarchy of the tip's Image — useful when the image uses multiple fill colors (like a multicolor SF Symbol).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "tipViewStyle(_:)") {
                snippet("""
                TipView(myTip)
                    .tipViewStyle(.automatic)  // system default
                    // No custom style protocol yet — .automatic is the only value.
                """)
            }

            Block(title: "Tip actions — buttons inside TipView") {
                snippet("""
                struct GuidedTip: Tip {
                    var title: Text { Text("Getting Started") }
                    var actions: [Action] {
                        [
                            Action(id: "show-guide", title: "Show Guide"),
                            Action(id: "dismiss",    title: "Not Now", isDestructive: true)
                        ]
                    }
                }
                // TipView renders these as buttons automatically.
                // popoverTip(tip) { action in … } receives taps on them.
                """)
            }

            Block(title: "Invalidating a tip") {
                snippet("""
                // Programmatically dismiss and remember dismissal:
                tip.invalidate(reason: .actionPerformed)
                tip.invalidate(reason: .tipClosed)
                tip.invalidate(reason: .displayCountExceeded)

                // Or within TipView action handler — pass .hidden to dismiss:
                TipView(tip, arrowEdge: .top) { _ in }
                    .onAppear { tip.invalidate(reason: .actionPerformed) }
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("lightbulb.fill", "TipKit manages its own datastore. Call Tips.configure([…]) once at app launch — typically in @main App.init() — before any tips are displayed.")
            noteRow("clock", ".displayFrequency(.daily) limits each tip to once per day. Use .immediate for testing. Reset with Tips.resetDatastore() in previews/tests.")
            noteRow("checkmark.circle", "Tips must satisfy all their rules before becoming eligible. Use @Parameter for rule parameters and #Rule(…) for predicates.")
            noteRow("hand.point.up", "popoverTip(tip, arrowEdge:) is the correct choice for toolbar buttons and small controls. Use TipView(tip) for inline educational content in a settings or onboarding flow.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    TipKitPage().frame(width: 1100, height: 800)
}
