import SwiftUI

/// Gallery page scaffold for State and Bindings. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct StateAndBindingsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "State", api: nil) { Color.clear }
            VariantTile(name: "Binding", api: nil) { Color.clear }
            VariantTile(name: "Bindable", api: nil) { Color.clear }
            VariantTile(name: "ObservedObject", api: nil) { Color.clear }
            VariantTile(name: "StateObject", api: nil) { Color.clear }
            VariantTile(name: "EnvironmentObject", api: nil) { Color.clear }
            VariantTile(name: "DynamicProperty", api: nil) { Color.clear }
            VariantTile(name: "Environment", api: nil) { Color.clear }
            VariantTile(name: "environmentObject(_:)", api: nil) { Color.clear }
            VariantTile(name: "onChange(of:initial:_:)", api: nil) { Color.clear }
            VariantTile(name: "onReceive(_:perform:)", api: nil) { Color.clear }
        }
    }
}

extension StateAndBindingsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.stateAndBindings",
        title: "State and Bindings",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["Bindable", "Binding", "State", "StateandBindings"],
        blurb: "State and Bindings — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(StateAndBindingsGalleryPage()) }
    )
}
