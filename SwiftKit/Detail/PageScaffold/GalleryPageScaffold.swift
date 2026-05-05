import SwiftUI

// Cap the gallery content column at a readable width. Below this width the
// content fills naturally; at or above it the column stops growing so wide
// windows don't sprawl. Measured against the existing 32pt horizontal padding;
// the inner cap defines the column, the outer .infinity frame keeps the
// ScrollView itself filling the detail pane (so the scrollbar lives at the
// pane's right edge). Exposed module-internal so custom-scaffolded pages
// (e.g. TypographyPage) can apply the identical cap.
let galleryReadableContentWidth: CGFloat = 880

struct GalleryPageScaffold<Header: View, Default: View, Variants: View, States: View, Notes: View>: View {
    @ViewBuilder var header: () -> Header
    @ViewBuilder var defaultRender: () -> Default
    @ViewBuilder var variants: () -> Variants
    @ViewBuilder var states: () -> States
    @ViewBuilder var notes: () -> Notes

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header()
                PageSection("Default") { defaultRender() }
                PageSection("Variants") { variants() }
                PageSection("States") { states() }
                PageSection("Notes") { notes() }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
