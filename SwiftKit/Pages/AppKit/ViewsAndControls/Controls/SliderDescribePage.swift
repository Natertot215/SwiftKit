import SwiftUI

// Article-style describe page for the "Slider" doc collection.
// Source: Documentation/AppKit/views-and-controls/slider.md
// The collectionGroup page itself isn't a renderable type — it's an index
// over NSSlider + NSSliderCell + the NSSliderAccessory family. Each member
// gets its own page; this one summarizes the group.

struct SliderDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Slider",
            docPath: "Documentation/AppKit/views-and-controls/slider.md",
            availability: "macOS",
            blurb: """
            Display a range of values from which the user selects a single \
            value. Apple groups the AppKit slider APIs under this collection — \
            the rendered control NSSlider, the underlying NSSliderCell, and \
            the slider-accessory family for additional knob-side affordances.

            Pick the right entry point:

              \u{2022} NSSlider — the NSControl subclass you embed in a window \
            or a SwiftUI hierarchy via NSViewRepresentable. Linear or circular, \
            horizontal or vertical, with optional tick marks.
              \u{2022} NSSliderCell — the cell that draws the slider and \
            implements its tracking. Subclass to override knobRect / drawBar / \
            drawKnob / prefersTrackingUntilMouseUp.
              \u{2022} NSSliderAccessory — small image-based affordance for \
            the slider track (most commonly used in Touch Bar contexts via \
            NSSliderTouchBarItem). Pair with NSSliderAccessoryBehavior to \
            handle taps and NSSliderAccessory.Width to control its size.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/slider (collection)",
                "View: NSSlider",
                "Cell: NSSliderCell",
                "Accessories: NSSliderAccessory, NSSliderAccessoryBehavior, NSSliderAccessory.Width"
            ],
            notes: [
                "NSSlider inherits NSControl. Most slider methods are NSSliderCell methods reflected up to the control.",
                "The renderable example lives on the NSSlider page — that's the concrete view you instantiate.",
                "Slider accessories (NSSliderAccessory, .Behavior, .Width) primarily attach to NSSliderTouchBarItem on macOS; see Touch Bar / NSSliderTouchBarItem for live placement."
            ]
        )
    }
}

#Preview {
    SliderDescribePage()
        .frame(width: 900, height: 700)
}
