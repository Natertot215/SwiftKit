import SwiftUI
import AppKit

// AppKit Views and Controls / Container views reference page.
// Covers: NSRulerView (class, inherits NSView) — a ruler displayed above or
// beside a scroll view's document view. Hosts measurement units, marker
// objects, and an optional accessory view. Designed to live inside an
// NSScrollView via init(scrollView:orientation:) and is enabled through
// NSScrollView.hasHorizontalRuler / hasVerticalRuler and rulersVisible.
// Source: Documentation/AppKit/views-and-controls/nsrulerview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSScrollView with both
// horizontal and vertical NSRulerViews wrapped around an NSTextView; SwiftUI
// controls drive rulersVisible and the displayed measurement unit.

// MARK: - Bridge

private struct NSRulerViewDemo: NSViewRepresentable {
    var rulersVisible: Bool
    var measurementUnit: NSRulerView.UnitName

    func makeNSView(context: Context) -> NSScrollView {
        // NSRulerView lives inside NSScrollView, so the demo wraps a small
        // NSTextView in a scroll view and turns the rulers on.
        let textView = NSTextView()
        textView.minSize = NSSize(width: 0, height: 0)
        textView.maxSize = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        textView.isVerticallyResizable = true
        textView.isHorizontallyResizable = false
        textView.autoresizingMask = [.width]
        textView.string = "An NSRulerView lives above (or beside) the document view of an NSScrollView. The ruler shows hash marks in the configured unit and can host markers and an accessory view."
        textView.font = NSFont.preferredFont(forTextStyle: .body)

        let scroll = NSScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.hasHorizontalRuler = true
        scroll.hasVerticalRuler = true
        scroll.documentView = textView
        scroll.borderType = .lineBorder
        scroll.hasVerticalScroller = true
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        nsView.rulersVisible = rulersVisible
        nsView.horizontalRulerView?.measurementUnits = measurementUnit
        nsView.verticalRulerView?.measurementUnits = measurementUnit
    }
}

// MARK: - Page

struct NSRulerViewPage: View {
    @State private var rulersVisible: Bool = true
    @State private var unit: NSRulerView.UnitName = .inches

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSRulerView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A ruler and the markers above or to the side of a scroll view's document view.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nsrulerview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "NSScrollView with horizontal + vertical rulers visible") {
            VStack(alignment: .leading, spacing: 12) {
                NSRulerViewDemo(rulersVisible: rulersVisible, measurementUnit: unit)
                    .frame(height: 220)
                    .frame(maxWidth: 480)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Toggle("rulersVisible", isOn: $rulersVisible).toggleStyle(.checkbox)
                }

                HStack(spacing: 12) {
                    Text("measurementUnits").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $unit) {
                        Text(".inches").tag(NSRulerView.UnitName.inches)
                        Text(".centimeters").tag(NSRulerView.UnitName.centimeters)
                        Text(".picas").tag(NSRulerView.UnitName.picas)
                        Text(".points").tag(NSRulerView.UnitName.points)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 360)
                }

                APICallout("scroll.hasHorizontalRuler = true; scroll.hasVerticalRuler = true; scroll.rulersVisible = true")
                APICallout("scroll.horizontalRulerView?.measurementUnits = .inches")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Construction — designated initializer") {
                snippet("""
                let ruler = NSRulerView(scrollView: scroll, orientation: .horizontalRuler)
                """)
                Text("init(scrollView:orientation:) is the designated initializer. Most code never calls it directly — NSScrollView creates rulers automatically when hasHorizontalRuler / hasVerticalRuler is set to true.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Measurement units") {
                snippet("""
                ruler.measurementUnits = .inches              // .inches, .centimeters, .picas, .points
                NSRulerView.registerUnit(
                    withName: "Twips",
                    abbreviation: "tw",
                    unitToPointsConversionFactor: 1.0 / 20.0,
                    stepUpCycle: [2, 5, 10],
                    stepDownCycle: [0.5]
                )
                """)
                Text("Built-in units: .inches, .centimeters, .picas, .points. Register custom units via registerUnit(withName:abbreviation:unitToPointsConversionFactor:stepUpCycle:stepDownCycle:).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Client view, origin offset, and accessory") {
                snippet("""
                ruler.clientView = textView                   // the view the ruler reports for; usually the documentView
                ruler.originOffset = 36                       // shifts the zero mark this many points
                ruler.accessoryView = customControlsView      // tab-style accessory shown alongside the ruler
                ruler.reservedThicknessForAccessoryView       // CGFloat
                """)
            }

            Block(title: "Markers — adding, tracking, drawing") {
                snippet("""
                let m = NSRulerMarker(rulerView: ruler,
                                      markerLocation: 144,
                                      image: NSImage(named: NSImage.Name("TabStop"))!,
                                      imageOrigin: NSPoint(x: 0, y: 0))
                m.isMovable  = true
                m.isRemovable = true
                ruler.addMarker(m)
                ruler.removeMarker(m)
                ruler.trackMarker(m, withMouseEvent: event)   // user-drag a new marker into place
                ruler.markers                                  // [NSRulerMarker]
                """)
            }

            Block(title: "Drawing extension points") {
                snippet("""
                override func drawHashMarksAndLabels(in rect: NSRect) { /* custom hash marks */ }
                override func drawMarkers(in rect: NSRect) { /* custom marker draw */ }
                ruler.invalidateHashMarks()                   // request a redraw of hash marks
                ruler.moveRulerline(fromLocation: 0, toLocation: 144)   // temporary guide line during drag
                """)
            }

            Block(title: "Layout properties") {
                snippet("""
                ruler.scrollView                              // -> NSScrollView?
                ruler.orientation                             // -> NSRulerView.Orientation (.horizontalRuler, .verticalRuler)
                ruler.ruleThickness                           // CGFloat
                ruler.requiredThickness                       // CGFloat (read-only)
                ruler.baselineLocation                        // CGFloat (read-only)
                ruler.reservedThicknessForMarkers             // CGFloat
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Show / hide via NSScrollView") {
                snippet("""
                scroll.rulersVisible = false                  // toggles all attached rulers off
                scroll.hasHorizontalRuler = false             // also tears down the horizontal ruler
                """)
                Text("rulersVisible toggles visibility without dropping the ruler objects. hasHorizontalRuler / hasVerticalRuler control whether the rulers exist at all.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Client-view delegation") {
                snippet("""
                final class TextDelegate: NSObject, NSRulerMarkerClientViewDelegation {
                    func rulerView(_ ruler: NSRulerView, locationFor point: NSPoint) -> CGFloat { ... }
                    func rulerView(_ ruler: NSRulerView, pointFor location: CGFloat) -> NSPoint { ... }
                }
                """)
                Text("Client views (NSTextView and friends) implement NSRulerMarkerClientViewDelegation to bridge ruler coordinates to document coordinates.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. Designed to live inside an NSScrollView; init(scrollView:orientation:) is the designated initializer.")
            noteRow("ruler", "Built-in units: .inches, .centimeters, .picas, .points. Register custom units with NSRulerView.registerUnit(...) class method.")
            noteRow("link", "NSTextView is the canonical client — its rulers render tab stops and indent markers. Other client views implement NSRulerMarkerClientViewDelegation.")
            noteRow("info.circle", "rulersVisible toggles visibility; hasHorizontalRuler / hasVerticalRuler create and destroy the ruler objects.")
            noteRow("hand.point.up.left", "Markers (NSRulerMarker) draw on top of the ruler — used for tab stops, margin guides, and similar bound-to-document markers.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSRulerViewPage().frame(width: 1100, height: 900)
}
