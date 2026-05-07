import SwiftUI

struct KeyframeAnimatorGalleryPage: View {
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

extension KeyframeAnimatorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.keyframeAnimator",
        title: "KeyframeAnimator",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "KeyframeAnimator",
            "View/keyframeAnimator(initialValue:repeating:content:keyframes:)",
            "View/keyframeAnimator(initialValue:trigger:content:keyframes:)",
            "Keyframes",
            "KeyframeTimeline",
            "KeyframeTrack",
            "KeyframeTrackContent",
            "KeyframeTrackContentBuilder",
            "KeyframesBuilder",
            "CubicKeyframe",
            "LinearKeyframe",
            "MoveKeyframe",
            "SpringKeyframe"
        ],
        blurb: "A container that animates its content with keyframes, each describing a target value reached at a specific time. Use built-in keyframe types — Cubic, Linear, Move, Spring — to author per-track timelines.",
        signature: "struct KeyframeAnimator<Value, KeyframePath, Content> where Value == KeyframePath.Value, KeyframePath : Keyframes, Content : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/keyframeanimator.md",
        page: { AnyView(KeyframeAnimatorGalleryPage()) }
    )
}

#Preview {
    KeyframeAnimatorGalleryPage()
        .frame(width: 900, height: 700)
}
