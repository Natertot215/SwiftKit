import SwiftUI

struct ImmersiveSpacesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Immersive Space APIs",
            docPath: "Documentation/SwiftUI/immersive-spaces/",
            availability: "visionOS 1.0+",
            blurb: """
            The immersive-space cluster is visionOS's mechanism for presenting a fully spatial environment that replaces or overlays the user's surroundings. ImmersiveSpace is a Scene-level type added to App.body alongside WindowGroup. ImmersionStyle (cases .full, .mixed, .progressive) controls how much of the physical world is occluded, set via immersionStyle(selection:in:). OpenImmersiveSpaceAction and DismissImmersiveSpaceAction are environment actions that trigger scene transitions from any view. ImmersiveContentBrightness and ImmersiveEnvironmentBehavior configure the lighting environment inside the space. UpperLimbVisibility / upperlimbvisibility(_:) shows or hides the user's hands. ImmersionChangeContext delivers phase information to onImmersionChange. RemoteImmersiveSpace and ImmersiveSpaceDisplacement support remote/collaborative spatial experiences. Everything here is visionOS-only or Scene-scoped; none renders in a macOS child view.
            """,
            signatures: [
                "ImmersiveSpace(id: \"…\") { … }",
                "ImmersionStyle — .full, .mixed, .progressive",
                "immersionStyle(selection:in:)",
                "OpenImmersiveSpaceAction / openImmersiveSpace",
                "DismissImmersiveSpaceAction / dismissImmersiveSpace",
                "onImmersionChange(initial:_:)",
                "ImmersiveContentBrightness, ImmersiveEnvironmentBehavior",
                "UpperLimbVisibility, upperlimbvisibility(_:)",
                "RemoteImmersiveSpace, ImmersiveSpaceDisplacement"
            ],
            notes: [
                "All APIs are visionOS 1.0+ only — no macOS equivalent exists.",
                "ImmersiveSpace is a Scene type, not a View — it lives at App.body scope.",
                "ImmersiveSpaceContentBuilder is the result builder for composing content inside the space."
            ]
        )
    }
}

#Preview {
    ImmersiveSpacesDescribePage()
        .frame(width: 900, height: 700)
}
