import SwiftUI

struct VisionOSPlayPauseDescribePage: View {
    var body: some View {
        DescribePage(
            title: "tvOS / visionOS Remote Commands",
            docPath: "Documentation/SwiftUI/input-events/",
            availability: "tvOS 14.3+ / visionOS 1.0+",
            blurb: """
            pageCommand(value:in:step:) drives a paging value from the visionOS Digital Crown \
            or tvOS Siri Remote — effectively the digitalCrownRotation equivalent for visionOS. \
            The value binding advances by step on each crown tick or remote swipe within the in: \
            range. onPlayPauseCommand(perform:) responds to the play/pause button on the Siri \
            Remote (tvOS 14.3+) or the equivalent control in visionOS (visionOS 1.0+). Common \
            use: media playback apps that toggle play/pause state from the remote without \
            requiring the user to tap a button on screen. Neither has a macOS equivalent — \
            macOS media key handling uses NSEvent or MediaPlayer framework hooks.
            """,
            signatures: [
                ".pageCommand(value: $page, in: 0...10, step: 1) — visionOS crown/remote paging",
                ".onPlayPauseCommand(perform: { … }) — Siri Remote play/pause button"
            ],
            notes: [
                "pageCommand is visionOS-only despite shipping in the tvOS 14.3 release notes.",
                "For macOS media key support, use NSEvent.addLocalMonitorForEvents(matching:) with .systemDefined events."
            ]
        )
    }
}

#Preview {
    VisionOSPlayPauseDescribePage()
        .frame(width: 900, height: 700)
}
