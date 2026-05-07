import SwiftUI

// Label — title + icon. Adapts to LabelStyle in context (toolbar collapses
// to icon, list shows both, etc.).

struct LabelGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Initializer variants

            VariantTile(
                name: "Label(_:systemImage:)",
                api: "Label(\"Settings\", systemImage: \"gear\")"
            ) {
                Label("Settings", systemImage: "gear")
            }

            VariantTile(
                name: "Label(_:image:)",
                api: "Label(\"Mail\", image: \"envelope\")"
            ) {
                // Use SF Symbol so the asset exists; semantically equivalent shape.
                Label("Mail", systemImage: "envelope")
            }

            VariantTile(
                name: "Label { title } icon: { icon }",
                api: "Label { Text(\"Heart\") } icon: { Image(systemName: \"heart.fill\").foregroundStyle(.pink) }"
            ) {
                Label {
                    Text("Heart")
                } icon: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.pink)
                }
            }

            // MARK: LabelStyle gallery

            VariantTile(
                name: ".labelStyle(.automatic)",
                api: ".labelStyle(.automatic)"
            ) {
                Label("Star", systemImage: "star.fill")
                    .labelStyle(.automatic)
            }

            VariantTile(
                name: ".labelStyle(.titleAndIcon)",
                api: ".labelStyle(.titleAndIcon)"
            ) {
                Label("Star", systemImage: "star.fill")
                    .labelStyle(.titleAndIcon)
            }

            VariantTile(
                name: ".labelStyle(.titleOnly)",
                api: ".labelStyle(.titleOnly)"
            ) {
                Label("Star", systemImage: "star.fill")
                    .labelStyle(.titleOnly)
            }

            VariantTile(
                name: ".labelStyle(.iconOnly)",
                api: ".labelStyle(.iconOnly)"
            ) {
                Label("Star", systemImage: "star.fill")
                    .labelStyle(.iconOnly)
            }

            // MARK: Reference

            ReferenceTile(
                name: "Label",
                signature: "struct Label<Title, Icon> where Title : View, Icon : View",
                note: "A standard label for user-interface items, consisting of an icon paired with a title. Renders differently depending on the active LabelStyle in the environment."
            )

            ReferenceTile(
                name: "LabelStyle",
                signature: "protocol LabelStyle",
                note: "Built-in conformers: .automatic (context-driven), .titleAndIcon, .titleOnly, .iconOnly. Conform your own type to author a fully-custom layout."
            )
        }
    }
}

extension LabelGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.label",
        title: "Label",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.label", "Label"],
        blurb: "A standard label for user interface items, consisting of an icon with a title.",
        signature: "struct Label<Title, Icon> where Title : View, Icon : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/label.md",
        page: { AnyView(LabelGalleryPage()) }
    )
}

#Preview {
    LabelGalleryPage()
        .frame(width: 900, height: 700)
}
