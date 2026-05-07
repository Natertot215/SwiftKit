import SwiftUI

struct LayoutGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension LayoutGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.layout",
        title: "Layout",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Layout",
            "CustomLayout",
            "LayoutSubviews",
            "LayoutSubview",
            "LayoutProperties",
            "ProposedViewSize",
            "ViewSpacing",
            "LayoutValueKey",
            "View/layoutValue(key:value:)",
            "LayoutRotationUnaryLayout",
            "Composing custom layouts with SwiftUI",
            "swiftui.layout-adjustments.layoutrotationunarylayout",
        ],
        blurb: "A protocol for defining a custom layout container. Implementing sizeThatFits and placeSubviews lets you publish a layout that participates in animation, measurement, and AnyLayout substitution alongside the built-in stacks.",
        signature: "@preconcurrency protocol Layout : Sendable, Animatable",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/custom-layout/layout.md",
        page: { AnyView(LayoutGalleryPage()) }
    )
}

#Preview {
    LayoutGalleryPage()
        .frame(width: 900, height: 700)
}
