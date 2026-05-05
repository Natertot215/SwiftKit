import SwiftUI

// SwiftUI "Inspecting view layout" article describe page.
// Source: Documentation/SwiftUI/layout-adjustments/inspecting-view-layout.md
// Article — no platform availability stamp.

struct InspectingViewLayoutDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Inspecting view layout",
            docPath: "Documentation/SwiftUI/layout-adjustments/inspecting-view-layout.md",
            availability: "Article \u{2014} guide",
            blurb: """
            Two techniques for figuring out how SwiftUI sizes and positions views.

            Selection in Xcode previews: clicking a view in the canvas highlights its bounds with \
            a blue rectangle. This is the fastest way to see exactly how big a single view is and \
            where its frame lives, without modifying the source.

            Temporary borders: add View/border(_:width:) with a non-blue color to keep the outline \
            visible regardless of selection state, and to compare multiple views in the same \
            preview. Borders draw at the outside edges of a view's reported size, so they double \
            as a visualization of any padding or frame the view received above them in the chain.

            Combine the two: select to inspect one view, add red/gray borders to inspect siblings.
            """,
            signatures: [
                ".border(Color.red)  // outline a child view",
                ".padding().border(Color.gray)  // padded parent + frame visualization",
                "Image(systemName: \"person.circle\"); Text(name).border(.red)  // inside a VStack"
            ],
            notes: [
                "Xcode previews draw their selection border in blue \u{2014} use other colors for temporary diagnostic borders.",
                "Borders sit at the outer edge of the modified view's frame, so .padding().border(...) shows the padded bounds.",
                "Strip diagnostic borders before shipping; they ship as real strokes if left in production code."
            ]
        )
    }
}

#Preview {
    InspectingViewLayoutDescribePage().frame(width: 900, height: 700)
}
