import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSSliderCell — the cell that drives the appearance and behavior
// of an NSSlider. Has no independent renderable surface; you typically
// subclass it to override knobRect / drawBar / drawKnob and assign your
// subclass via NSSlider.cell or NSControl.cellClass.
// Source: Documentation/AppKit/views-and-controls/nsslidercell.md

struct NSSliderCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSliderCell",
            docPath: "Documentation/AppKit/views-and-controls/nsslidercell.md",
            availability: "macOS",
            blurb: """
            The appearance and behavior of an NSSlider object. NSSliderCell \
            draws the bar, knob, and tick marks, and tracks mouse and \
            keyboard input. Most NSSlider methods are cover methods that \
            forward to NSSliderCell.

            You customize an NSSliderCell either by setting its properties \
            (sliderType, isVertical, knobThickness, allowsTickMarkValuesOnly, \
            tickMarkPosition, numberOfTickMarks) or by subclassing and \
            overriding the four documented hook points: knobRect(flipped:), \
            drawBar(inside:flipped:), drawKnob(_:), and \
            prefersTrackingUntilMouseUp.

            Cells aren't independently renderable — they need a hosting \
            NSSlider. See the NSSlider gallery for a live example.
            """,
            signatures: [
                "class NSSliderCell : NSActionCell",
                "var sliderType: NSSlider.SliderType  // .linear / .circular",
                "var isVertical: Bool",
                "var knobThickness: CGFloat",
                "var tickMarkPosition: NSSlider.TickMarkPosition",
                "var numberOfTickMarks: Int",
                "func knobRect(flipped: Bool) -> NSRect  // override hook",
                "func drawBar(inside: NSRect, flipped: Bool)  // override hook",
                "func drawKnob(_ knobRect: NSRect)  // override hook"
            ],
            notes: [
                "Cell, not a view — pair with NSSlider for any visible output.",
                "Subclassing is the documented customization path when properties don't suffice.",
                "trackRect provides the rectangle inside which the knob can move."
            ]
        )
    }
}

#Preview {
    NSSliderCellDescribePage()
        .frame(width: 900, height: 700)
}
