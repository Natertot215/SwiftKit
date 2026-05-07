import SwiftUI

// Dense SwiftUI Popover gallery — consolidates the entire family:
//   View/popover(isPresented:attachmentAnchor:arrowEdge:content:)
//   View/popover(item:attachmentAnchor:arrowEdge:content:)
//   PopoverAttachmentAnchor                  (.rect(_:) / .point(_:))
//
// Source docs:
//   Documentation/SwiftUI/popovers/popover(ispresented:attachmentanchor:arrowedge:content:).md
//   Documentation/SwiftUI/popovers/popover(item:attachmentanchor:arrowedge:content:).md
//   Documentation/SwiftUI/popovers/popoverattachmentanchor.md

private let demoFrameWidth: CGFloat = 400

private struct PopoverItemModel: Identifiable, Hashable {
    let id = UUID()
    let message: String
}

private let popoverItems: [PopoverItemModel] = [
    .init(message: "First option"),
    .init(message: "Second option"),
    .init(message: "Third option")
]

struct PopoverGalleryPage: View {
    // .popover(isPresented:) demos
    @State private var isShowing = false
    @State private var isShowingTop = false
    @State private var isShowingLeading = false
    @State private var isShowingPoint = false

    // .popover(item:) demos
    @State private var current: PopoverItemModel?

    // PopoverAttachmentAnchor demos
    @State private var bounds = false
    @State private var pointTopLeading = false
    @State private var pointBottomTrailing = false
    @State private var pointCenter = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                isPresentedSection
                itemSection
                attachmentAnchorSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Popover")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a popover anchored to a source view. Configure attachment anchor and arrow edge to control direction and origin. Two overloads (Boolean and item) plus the PopoverAttachmentAnchor enum cover the full surface.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/popovers/  \u{00b7}  macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".popover(isPresented:attachmentAnchor:arrowEdge:content:)  \u{00b7}  .popover(item:attachmentAnchor:arrowEdge:content:)  \u{00b7}  PopoverAttachmentAnchor")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: .popover(isPresented:) (absorbed from PopoverIsPresentedPage)

    private var isPresentedSection: some View {
        PageSection("View/popover(isPresented:attachmentAnchor:arrowEdge:content:)",
                    subtitle: "Boolean-driven popover \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Bind a Boolean to drive presentation. macOS always renders a true popover (does not adapt to a sheet like iOS compact size classes).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".popover(isPresented: $isShowing) { Text(\"Popover Content\").padding() }") {
                    Button("Show popover") { isShowing = true }
                        .buttonStyle(.borderedProminent)
                        .popover(isPresented: $isShowing) {
                            Text("Popover Content")
                                .padding()
                        }
                }

                VariantBlock(title: "Custom arrow edge — arrowEdge: .top") {
                    DemoCard(api: ".popover(isPresented: $isShowingTop, arrowEdge: .top) { … }") {
                        Button("From the top") { isShowingTop = true }
                            .popover(isPresented: $isShowingTop, arrowEdge: .top) {
                                PopoverBody(text: "Arrow points up — popover anchored above the trigger.")
                            }
                    }
                }

                VariantBlock(title: "Bounds rect anchor + leading arrow") {
                    DemoCard(api: ".popover(isPresented:, attachmentAnchor: .rect(.bounds), arrowEdge: .leading) { … }") {
                        Button("From the side") { isShowingLeading = true }
                            .popover(isPresented: $isShowingLeading,
                                     attachmentAnchor: .rect(.bounds),
                                     arrowEdge: .leading) {
                                PopoverBody(text: "Anchor: bounds rect. Arrow: leading.")
                            }
                    }
                }

                VariantBlock(title: "Point anchor — .point(.topTrailing)") {
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
    }

    // MARK: .popover(item:) (absorbed from PopoverItemPage)

    private var itemSection: some View {
        PageSection("View/popover(item:attachmentAnchor:arrowEdge:content:)",
                    subtitle: "Item-driven popover \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Bind an Optional<Identifiable> — non-nil presents, nil dismisses, replacing with a different id swaps the content.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".popover(item: $current) { item in Text(item.message) }") {
                    HStack(spacing: 8) {
                        ForEach(popoverItems) { entry in
                            Button(entry.message) { current = entry }
                        }
                    }
                    .popover(item: $current) { item in
                        Text(item.message)
                            .padding(16)
                            .frame(maxWidth: 220, alignment: .leading)
                    }
                }

                VariantBlock(title: "Bound state inspection") {
                    HStack(spacing: 12) {
                        Button("Clear (current = nil)") { current = nil }
                        Text("current = \(current.map { "PopoverItemModel(\($0.message))" } ?? "nil")")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    // MARK: PopoverAttachmentAnchor (absorbed from PopoverAttachmentAnchorPage)

    private var attachmentAnchorSection: some View {
        PageSection("PopoverAttachmentAnchor — .rect / .point",
                    subtitle: "Two cases drive every popover anchor.") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("PopoverAttachmentAnchor has exactly two cases:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("case rect(Anchor<CGRect>.Source)")
                    APICallout("case point(UnitPoint)")
                    Text("Use .rect when the popover should attach relative to a sub-rectangle of the source view. Use .point when a single coordinate is enough.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                DemoCard(api: ".popover(isPresented: $bounds, attachmentAnchor: .rect(.bounds)) { … }") {
                    Button("Anchor: .rect(.bounds)") { bounds = true }
                        .buttonStyle(.borderedProminent)
                        .popover(isPresented: $bounds,
                                 attachmentAnchor: .rect(.bounds)) {
                            PopoverBody(text: "Anchored to the trigger button's bounds rect — the default.")
                        }
                }

                VariantBlock(title: ".point(.topLeading)") {
                    DemoCard(api: ".popover(attachmentAnchor: .point(.topLeading))") {
                        Button("Top-leading point") { pointTopLeading = true }
                            .popover(isPresented: $pointTopLeading,
                                     attachmentAnchor: .point(.topLeading)) {
                                PopoverBody(text: "Attached to the top-leading UnitPoint of the trigger.")
                            }
                    }
                }

                VariantBlock(title: ".point(.bottomTrailing)") {
                    DemoCard(api: ".popover(attachmentAnchor: .point(.bottomTrailing))") {
                        Button("Bottom-trailing point") { pointBottomTrailing = true }
                            .popover(isPresented: $pointBottomTrailing,
                                     attachmentAnchor: .point(.bottomTrailing)) {
                                PopoverBody(text: "Attached to the bottom-trailing UnitPoint of the trigger.")
                            }
                    }
                }

                VariantBlock(title: ".point(.center)") {
                    DemoCard(api: ".popover(attachmentAnchor: .point(.center))") {
                        Button("Center point") { pointCenter = true }
                            .popover(isPresented: $pointCenter,
                                     attachmentAnchor: .point(.center)) {
                                PopoverBody(text: "Attached to the center UnitPoint — the popover surrounds the trigger's middle.")
                            }
                    }
                }
            }
        }
    }

    // MARK: Notes

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
        .init(title: "Item must conform to Identifiable.",
              detail: "Replacing the bound item with a different id dismisses the current popover and presents a new one — useful when navigating between rows. Inside the closure the item is non-optional.",
              symbol: "barcode"),
        .init(title: ".rect can target a sub-region.",
              detail: "Anchor<CGRect>.Source includes .bounds (the default) and custom values, allowing the popover to attach to any sub-rectangle defined inside the trigger.",
              symbol: "rectangle.dashed"),
        .init(title: "Prefer .popover(item:) for data-bound flows.",
              detail: "When the popover content depends on a model object, the item-driven overload eliminates the dual-state bug where isPresented can be true while the model is nil.",
              symbol: "shippingbox")
    ]

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
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
}

// MARK: - Page-local helpers

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

extension PopoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.popover",
        title: "Popover",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/popover(isPresented:attachmentAnchor:arrowEdge:content:)",
            "View/popover(item:attachmentAnchor:arrowEdge:content:)",
            "PopoverAttachmentAnchor"
        ],
        blurb: "Presents a popover anchored to a source view. Configure attachment anchor and arrow edge to control direction and origin.",
        signature: "func popover<Content>(isPresented: Binding<Bool>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge? = nil, @ViewBuilder content: @escaping () -> Content) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/popovers/popover(ispresented:attachmentanchor:arrowedge:content:).md",
        page: { AnyView(PopoverGalleryPage()) }
    )
}

#Preview {
    PopoverGalleryPage()
        .frame(width: 1100, height: 1400)
}
