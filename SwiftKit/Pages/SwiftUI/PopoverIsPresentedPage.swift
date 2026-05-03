import SwiftUI

// SwiftUI `View/popover(isPresented:attachmentAnchor:arrowEdge:content:)` reference page.
// Source: Documentation/SwiftUI/popovers/popover(ispresented:attachmentanchor:arrowedge:content:).md
// Boolean-driven popover. macOS 10.15+. macOS always renders a true popover
// (does not adapt to a sheet like iOS compact size classes).

private let demoFrameWidth: CGFloat = 400

struct PopoverIsPresentedPage: View {
    @State private var isShowing = false
    @State private var isShowingTop = false
    @State private var isShowingLeading = false
    @State private var isShowingPoint = false

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/popover(isPresented:attachmentAnchor:arrowEdge:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a popover when a given condition is true.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/popovers/popover(ispresented:attachmentanchor:arrowedge:content:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".popover(isPresented: $isShowing) { Text(\"Popover Content\").padding() }") {
            Button("Show popover") { isShowing = true }
                .buttonStyle(.borderedProminent)
                .popover(isPresented: $isShowing) {
                    Text("Popover Content")
                        .padding()
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Custom arrow edge — .arrowEdge: .top") {
                DemoCard(api: ".popover(isPresented: $isShowingTop, arrowEdge: .top) { … }") {
                    Button("From the top") { isShowingTop = true }
                        .popover(isPresented: $isShowingTop, arrowEdge: .top) {
                            PopoverBody(text: "Arrow points up — popover anchored above the trigger.")
                        }
                }
            }

            VariantBlock(title: "Custom attachment anchor — .rect(.bounds), arrowEdge: .leading") {
                DemoCard(api: ".popover(isPresented:, attachmentAnchor: .rect(.bounds), arrowEdge: .leading) { … }") {
                    Button("From the side") { isShowingLeading = true }
                        .popover(isPresented: $isShowingLeading,
                                 attachmentAnchor: .rect(.bounds),
                                 arrowEdge: .leading) {
                            PopoverBody(text: "Anchor: bounds rect. Arrow: leading.")
                        }
                }
            }

            VariantBlock(title: "Point anchor — .point(UnitPoint.topTrailing)") {
                DemoCard(api: ".popover(isPresented:, attachmentAnchor: .point(.topTrailing)) { … }") {
                    Button("From a point") { isShowingPoint = true }
                        .popover(isPresented: $isShowingPoint,
                                 attachmentAnchor: .point(.topTrailing)) {
                            PopoverBody(text: "Anchor: top-trailing UnitPoint. Arrow direction system-chosen.")
                        }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Bound trigger") {
                DemoCard(api: "Button { isShowing.toggle() } + .popover(isPresented: $isShowing)") {
                    HStack(spacing: 12) {
                        Button("Toggle") { isShowing.toggle() }
                        Text("isShowing = \(String(describing: isShowing))")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private struct PopNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PopNote] = [
        .init(title: "macOS always shows a real popover.",
              detail: "On iOS in compact size classes the popover adapts to a sheet. On macOS, .popover always renders as an arrow-attached panel — no adaptation needed.",
              symbol: "macwindow"),
        .init(title: "Click outside dismisses; .interactiveDismissDisabled blocks that.",
              detail: "By default, clicking outside the popover sets the bound Boolean back to false. Apply .interactiveDismissDisabled() to the content to require an explicit close action.",
              symbol: "lock.shield"),
        .init(title: "Anchor positioning vs. arrow direction.",
              detail: "attachmentAnchor (.rect or .point) decides WHERE the popover attaches. arrowEdge decides WHICH edge of the anchor the arrow points from. Pass arrowEdge: nil to let the system choose.",
              symbol: "arrow.up.left.and.arrow.down.right"),
        .init(title: "Popover content sizes to its intrinsic size.",
              detail: "Use .frame() inside the content closure if you need a specific width. The popover panel grows to fit, with the system applying minimum padding around your content.",
              symbol: "ruler"),
        .init(title: "Source/See Also: prefer .popover(item:) for data-bound flows.",
              detail: "When the popover content depends on a model object, the item-driven overload eliminates the dual-state bug where isPresented can be true while the model is nil.",
              symbol: "shippingbox")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct PopoverBody: View {
    let text: String

    var body: some View {
        Text(text)
            .padding(16)
            .frame(maxWidth: 240, alignment: .leading)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    PopoverIsPresentedPage()
        .frame(width: 1100, height: 800)
}
