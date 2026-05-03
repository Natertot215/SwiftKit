import SwiftUI

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
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
