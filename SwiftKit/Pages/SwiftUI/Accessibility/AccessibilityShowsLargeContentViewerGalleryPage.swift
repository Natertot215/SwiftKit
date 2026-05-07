import SwiftUI

struct AccessibilityShowsLargeContentViewerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demos

            VariantTile(
                name: "default large content",
                api: ".accessibilityShowsLargeContentViewer()"
            ) {
                Button {
                } label: {
                    Image(systemName: "star.fill")
                        .font(.title2)
                }
                .buttonStyle(.borderless)
                .accessibilityShowsLargeContentViewer()
            }

            VariantTile(
                name: "custom large content view",
                api: ".accessibilityShowsLargeContentViewer { Label … }",
                height: 110
            ) {
                Button {
                } label: {
                    Image(systemName: "envelope.fill")
                        .font(.title2)
                }
                .buttonStyle(.borderless)
                .accessibilityShowsLargeContentViewer {
                    Label("Inbox", systemImage: "envelope.fill")
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "When to apply",
                signature: "Toolbar items, tab bar icons, status badges that don't scale with Dynamic Type.",
                note: "Required by the App Store review guidelines for fixed-size icon controls. Long-press shows the icon and label at large size for users who need it."
            )

            ReferenceTile(
                name: "Default vs custom",
                signature: "Default form: uses the visible content. Custom: provide a labelled large variant.",
                note: "Provide a custom large content view when the iconography alone is ambiguous at native size — pair the symbol with a `Label` text for clarity."
            )

            ReferenceTile(
                name: "Pair with .largeContentViewerInteraction()",
                signature: "View.largeContentViewerInteraction()",
                note: "Some interactive scenarios require explicitly opting into the long-press gesture. Apply on the parent container that hosts the content viewer trigger."
            )
        }
    }
}

extension AccessibilityShowsLargeContentViewerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityShowsLargeContentViewer",
        title: "AccessibilityShowsLargeContentViewer",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityShowsLargeContentViewer()",
            "View/accessibilityShowsLargeContentViewer(_:)",
            "swiftui.accessible-appearance.accessibilityshowslargecontentviewer()",
            "swiftui.accessible-appearance.accessibilityshowslargecontentviewer(_:)"
        ],
        blurb: "Adds a default or custom large content view shown by the Large Content Viewer when users long-press fixed-size controls. Required for toolbar items and tab icons that can't scale with Dynamic Type.",
        signature: "func accessibilityShowsLargeContentViewer<V>(@ViewBuilder _ largeContentView: () -> V) -> some View where V : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-appearance/accessibilityshowslargecontentviewer().md",
        page: { AnyView(AccessibilityShowsLargeContentViewerGalleryPage()) }
    )
}

#Preview {
    AccessibilityShowsLargeContentViewerGalleryPage()
        .frame(width: 900, height: 700)
}
