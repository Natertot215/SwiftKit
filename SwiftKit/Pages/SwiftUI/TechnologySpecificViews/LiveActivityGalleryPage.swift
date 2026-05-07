import SwiftUI

struct LiveActivityGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "activityBackgroundTint(_:)",
                signature: "func activityBackgroundTint(_ color: Color?) -> some View",
                note: "Tints the background of the Live Activity (Lock Screen banner / Dynamic Island expanded layout). Pass nil to use the system default.",
                badge: "iOS only"
            )

            ReferenceTile(
                name: "activitySystemActionForegroundColor(_:)",
                signature: "func activitySystemActionForegroundColor(_ color: Color?) -> some View",
                note: "Foreground color for system-supplied controls inside the activity — for example, the dismiss affordance. Helps maintain contrast against your background tint."
            )

            ReferenceTile(
                name: "Required import & entitlement",
                signature: "import ActivityKit  //  Info.plist: NSSupportsLiveActivities = YES",
                note: "ActivityKit framework. The Info.plist switch turns on Live Activity scheduling for the bundle. Live Activities run in a Widget extension that imports WidgetKit + ActivityKit."
            )

            ReferenceTile(
                name: "Use inside an ActivityConfiguration",
                signature: "ActivityConfiguration(for:) { context in … }",
                note: "These modifiers apply to the SwiftUI view returned for the activity's content/dynamicIsland builders. Place them inside the closure that returns the Lock Screen/Dynamic Island UI."
            )
        }
    }
}

extension LiveActivityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.liveActivity",
        title: "LiveActivity",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/activitySystemActionForegroundColor(_:)",
            "View/activityBackgroundTint(_:)"
        ],
        blurb: "ActivityKit modifiers for styling Live Activities — system-action foreground color and background tint of the activity surface.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/activitybackgroundtint(_:).md",
        page: { AnyView(LiveActivityGalleryPage()) }
    )
}

#Preview {
    LiveActivityGalleryPage()
        .frame(width: 900, height: 700)
}
