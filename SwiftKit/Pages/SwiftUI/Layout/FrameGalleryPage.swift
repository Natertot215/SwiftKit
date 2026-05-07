import SwiftUI

// Dense Frame reference page. Consolidates five previously-separate leaves:
//   • View/frame(width:height:alignment:)                                            (fixed frame)
//   • View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)  (flexible frame)
//   • View/containerRelativeFrame(_:alignment:)                                      (axes variant)
//   • View/containerRelativeFrame(_:alignment:_:)                                    (closure variant)
//   • View/containerRelativeFrame(_:count:span:spacing:alignment:)                   (grid variant)
//
// Source docs:
//   Documentation/SwiftUI/layout-adjustments/frame(width:height:alignment:).md
//   Documentation/SwiftUI/layout-adjustments/frame(minwidth:idealwidth:maxwidth:minheight:idealheight:maxheight:alignment:).md
//   Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:).md
//   Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:_:).md
//   Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:count:span:spacing:alignment:).md
//
// Mirrors TypographyPage / PaddingPage's dense rhythm: one ScrollView, one
// VStack, one PageSection per topic. Frame consolidation has no describe-only
// type leaves — purely modifier-family overload grouping. All demos compose
// Apple primitives directly — no custom wrapper views.

struct FrameGalleryPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                frameFixedSection
                frameFlexibleSection
                containerRelativeFrameAxesSection
                containerRelativeFrameClosureSection
                containerRelativeFrameGridSection
                higNotesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Frame")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Fixed and flexible frame sizing, plus container-relative frames with axes/closure/grid variants — every overload that wraps a view in an invisible sized frame.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/ \u{00b7} macOS 10.15+ (containerRelativeFrame: macOS 14.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".frame(width:height:[alignment:])  \u{00b7}  .frame(minWidth:\u{2026}maxHeight:[alignment:])  \u{00b7}  .containerRelativeFrame(_:[alignment:])  \u{00b7}  .containerRelativeFrame(_:alignment:_:)  \u{00b7}  .containerRelativeFrame(_:count:span:spacing:alignment:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: frame(width:height:alignment:) — fixed frame

    private var frameFixedSection: some View {
        PageSection("frame(width:height:alignment:)", subtitle: "View/frame(width:height:alignment:) \u{00b7} fixed-size invisible frame \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".frame(width: 200, height: 60, alignment: .center)")
                    Text("Positions this view within an invisible frame with the specified size. Either dimension may be omitted (nil) \u{2014} the wrapped view keeps its natural sizing on that axis.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("Hello world")
                        .frame(width: 200, height: 60, alignment: .center)
                        .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: alignment values.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(width: 120, height: 50, alignment: .topLeading)")
                    HStack(spacing: 12) {
                        ForEach([
                            (Alignment.topLeading, "topLeading"),
                            (.center, "center"),
                            (.bottomTrailing, "bottomTrailing")
                        ], id: \.1) { alignment, label in
                            VStack(spacing: 4) {
                                Text("Hello")
                                    .frame(width: 120, height: 50, alignment: alignment)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                                Text(label)
                                    .font(.caption2)
                                    .foregroundStyle(.tertiary)
                            }
                        }
                    }
                }

                // Variant: width-only.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Width-only")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(width: 200)   // height stays natural")
                    Text("Wrapped text keeps its content-driven height.")
                        .frame(width: 200)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: height-only.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Height-only")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(height: 80)   // width stays natural")
                    Text("Tall slot, natural width")
                        .frame(height: 80)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: shape filling the frame.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Shape filling the frame")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("Ellipse().fill(.tint).frame(width: 240, height: 80)")
                    Ellipse()
                        .fill(.tint)
                        .frame(width: 240, height: 80)
                }

                // States: both nil — a no-op frame.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Both nil \u{2014} a no-op frame")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame()   // both dimensions nil; alignment ignored")
                    Text("With both width and height nil, the modifier passes through; the wrapped view keeps the parent's full proposal.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "frame() wraps the child but does not clip.",
                        detail: "A child can draw outside the resulting frame if it ignores the proposal \u{2014} use .clipped() or a clip shape if you need hard bounds.",
                        symbol: "square.dashed"
                    )
                    noteRow(
                        title: "Alignment positions the child INSIDE the resulting frame.",
                        detail: "If the frame size matches the child size, alignment has no visible effect. Difference between frame size and child size is what alignment fills.",
                        symbol: "align.horizontal.center"
                    )
                    noteRow(
                        title: "Shapes always fill their proposed size.",
                        detail: "Circle, Rectangle, Ellipse, and other Shape conformers always fill the proposal \u{2014} so a frame fixes their visible bounds exactly.",
                        symbol: "circle.dashed"
                    )
                }
            }
        }
    }

    // MARK: frame(minWidth:…maxHeight:alignment:) — flexible frame

    private var frameFlexibleSection: some View {
        PageSection("frame(minWidth:\u{2026}maxHeight:alignment:)", subtitle: "View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:) \u{00b7} flexible frame \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".frame(maxWidth: .infinity, minHeight: 40)")
                    Text("Positions a view within an invisible frame whose size is constrained by min, ideal, and max bounds. Any parameter may be nil \u{2014} the unconstrained dimensions follow the wrapped view's natural sizing.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Rectangle()
                        .fill(Color.accentColor.opacity(0.2))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .overlay(Text("maxWidth: .infinity").font(.caption).foregroundStyle(Color.accentColor))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                // Variant: min/max bounded text.
                VStack(alignment: .leading, spacing: 8) {
                    Text("min/max bounded text")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(minWidth: 80, maxWidth: 300)")
                    Text("Constrained text that stays within an 80\u{2013}300 width window")
                        .frame(minWidth: 80, maxWidth: 300)
                        .padding(8)
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                }

                // Variant: fill horizontal, fixed height.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Fill horizontal, fixed height")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(maxWidth: .infinity, alignment: .leading)")
                    Text("Leading-aligned content fills horizontal space")
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 8))
                }

                // Variant: both axes flexible.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Both axes flexible")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(maxWidth: .infinity, maxHeight: 120)")
                    Rectangle()
                        .fill(.tint.opacity(0.15))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                // Variant: idealWidth + fixedSize.
                VStack(alignment: .leading, spacing: 8) {
                    Text("idealWidth + fixedSize")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(idealWidth: 240).fixedSize(horizontal: true, vertical: false)")
                    Text("When idealWidth is paired with fixedSize() horizontally, SwiftUI uses the ideal value as the proposal regardless of the parent's offer.")
                        .frame(idealWidth: 240)
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(8)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                }

                // States: single-bound shorthand.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Single-bound shorthand")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".frame(maxHeight: .infinity)   // expand vertically; width natural")
                    Rectangle()
                        .fill(.fill.tertiary)
                        .frame(width: 240, height: 80)
                        .overlay(Text("Used inside a vertically-greedy container").font(.caption).foregroundStyle(.secondary))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Pass .infinity to maxWidth/maxHeight to consume all offered space.",
                        detail: "The canonical 'fill the available area' pattern \u{2014} maxWidth: .infinity claims as much horizontal as the parent offers; pair with alignment to position the actual content inside.",
                        symbol: "arrow.left.and.right"
                    )
                    noteRow(
                        title: "idealWidth/idealHeight only matter under fixedSize().",
                        detail: "The wrapper that places this view has to ask for the ideal size for ideal* parameters to take effect \u{2014} typically via .fixedSize(). Without that, ideal values are reported but not used.",
                        symbol: "lightbulb"
                    )
                    noteRow(
                        title: "All six size parameters are optional.",
                        detail: "Omit the ones you don't constrain. Alignment positions the wrapped view inside whatever resolved frame you produced.",
                        symbol: "rectangle.dashed"
                    )
                }
            }
        }
    }

    // MARK: containerRelativeFrame(_:alignment:) — axes variant

    private var containerRelativeFrameAxesSection: some View {
        PageSection("containerRelativeFrame(_:alignment:)", subtitle: "View/containerRelativeFrame(_:alignment:) \u{00b7} axes variant \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".containerRelativeFrame([.horizontal, .vertical])")
                    Text("Positions this view inside an invisible frame whose size is relative to the nearest container \u{2014} the window, a NavigationSplitView column, a TabView tab, or a scroll view. The size is the container's size minus its safe-area insets.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(0..<3) { i in
                                Rectangle()
                                    .fill(Color.accentColor.opacity(Double(i + 1) * 0.18 + 0.18))
                                    .containerRelativeFrame([.horizontal, .vertical])
                                    .overlay(Text("Page \(i + 1)").foregroundStyle(.white).fontWeight(.semibold))
                            }
                        }
                    }
                    .frame(height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Each rectangle fills the ScrollView's full container size on both axes \u{2014} a paged layout pattern.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: horizontal-only.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Horizontal-only")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal)")
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(0..<3) { i in
                                Rectangle()
                                    .fill(.tint.opacity(0.25))
                                    .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                    .containerRelativeFrame(.horizontal)
                                    .overlay(Text("Slide \(i + 1)").foregroundStyle(.tint))
                            }
                        }
                    }
                    .frame(height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Width tracks the container; height comes from .aspectRatio.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: alignment parameter.
                VStack(alignment: .leading, spacing: 8) {
                    Text("alignment parameter")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal, alignment: .leading)")
                    Text("Alignment positions the wrapped child INSIDE the container-sized frame \u{2014} useful when the child is smaller than the proposed container dimensions.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: defaults to .center alignment.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} alignment is .center")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal)   // alignment defaults to .center")
                    Text("Alignment defaults to .center \u{2014} the modifier centers the wrapped child within the resolved container frame.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "'Container' is the nearest enclosing layout host.",
                        detail: "Resolves to the nearest enclosing scrollable view, NavigationSplitView column, TabView tab, NavigationStack, or the window/screen \u{2014} whichever is closest in the view hierarchy.",
                        symbol: "rectangle.3.group"
                    )
                    noteRow(
                        title: "Reported size subtracts safe-area insets.",
                        detail: "The size matches the visible content area, not raw window dimensions \u{2014} so a paged carousel using this modifier respects toolbars and inspector chrome.",
                        symbol: "rectangle.inset.filled"
                    )
                    noteRow(
                        title: "Reach for the closure or grid overload for custom math.",
                        detail: "Use containerRelativeFrame(_:alignment:_:) when you need a derived size; reach for the count/span overload for grid-style sizing.",
                        symbol: "function"
                    )
                }
            }
        }
    }

    // MARK: containerRelativeFrame(_:alignment:_:) — closure variant

    private var containerRelativeFrameClosureSection: some View {
        PageSection("containerRelativeFrame(_:alignment:_:)", subtitle: "View/containerRelativeFrame(_:alignment:_:) \u{00b7} closure variant (custom sizing math) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".containerRelativeFrame(.horizontal, alignment: .topLeading) { length, axis in length / 3 }")
                    Text("Positions a view inside an invisible container-relative frame, deriving the resolved size with a closure that receives the container length and axis. Use this overload to apply your own sizing math \u{2014} divisions, fractions, or custom curves.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Rectangle()
                        .fill(.tint.opacity(0.4))
                        .aspectRatio(1.0, contentMode: .fill)
                        .containerRelativeFrame(.horizontal, alignment: .topLeading) { length, _ in
                            length / 3
                        }
                        .overlay(Text("\u{2153} container width").font(.caption).foregroundStyle(.white))
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                // Variant: per-axis math.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Per-axis math")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame([.horizontal, .vertical]) { length, axis in axis == .horizontal ? length / 2 : length / 4 }")
                    Rectangle()
                        .fill(.tint.opacity(0.3))
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            axis == .horizontal ? length / 2 : length / 4
                        }
                        .overlay(Text("Width / 2, height / 4").font(.caption).foregroundStyle(.tint))
                        .frame(maxHeight: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                // Variant: aspect ratio + container width.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Aspect ratio + container width")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".aspectRatio(3.0/2.0, contentMode: .fit).containerRelativeFrame(.horizontal) { length, _ in length * 0.6 }")
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 12) {
                            ForEach(0..<4) { i in
                                Rectangle()
                                    .fill(.tint.opacity(0.25))
                                    .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                    .containerRelativeFrame(.horizontal) { length, _ in
                                        length * 0.6
                                    }
                                    .overlay(Text("60% width #\(i + 1)").font(.caption).foregroundStyle(.tint))
                            }
                        }
                    }
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                // States: alignment parameter.
                VStack(alignment: .leading, spacing: 8) {
                    Text("alignment parameter")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal, alignment: .center) { \u{2026} }")
                    Text("Alignment positions the wrapped child inside the resolved frame; defaults to .center.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Closure receives length post safe-area subtraction.",
                        detail: "The closure runs with the container's length on the given axis (after safe-area insets) and returns the size the wrapped view should claim.",
                        symbol: "function"
                    )
                    noteRow(
                        title: "Use this overload for custom proportional sizing.",
                        detail: "Reach for the count/span overload when you want a fixed grid mathematically; reach for this one when the math is derived (fractions, curves, branching).",
                        symbol: "ruler"
                    )
                    noteRow(
                        title: "Closure is called per axis specified in Axis.Set.",
                        detail: "For [.horizontal, .vertical] it runs twice \u{2014} once for each direction. Branch on the `axis` parameter to return different math per axis.",
                        symbol: "arrow.up.left.and.down.right.magnifyingglass"
                    )
                }
            }
        }
    }

    // MARK: containerRelativeFrame(_:count:span:spacing:alignment:) — grid variant

    private var containerRelativeFrameGridSection: some View {
        PageSection("containerRelativeFrame(_:count:span:spacing:alignment:)", subtitle: "View/containerRelativeFrame(_:count:span:spacing:alignment:) \u{00b7} grid variant (count/span slots) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".containerRelativeFrame(.horizontal, count: 4, span: 1, spacing: 10)")
                    Text("Sizes a view as a fraction of the nearest container's length: divide the container into `count` equal slots minus the inter-slot spacing, then take `span` adjacent slots. Standard pattern for a horizontal carousel that shows N slides at once.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(0..<6) { i in
                                Rectangle()
                                    .fill(.tint.opacity(0.25))
                                    .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                    .containerRelativeFrame(.horizontal, count: 4, span: 1, spacing: 10)
                                    .overlay(Text("#\(i + 1)").foregroundStyle(.tint).fontWeight(.semibold))
                            }
                        }
                    }
                    .frame(height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Container width is split into 4 columns; each card claims 1 column. Four cards visible at a time.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: span > 1 — wide tiles.
                VStack(alignment: .leading, spacing: 8) {
                    Text("span > 1 \u{2014} wide tiles")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 10)")
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(0..<4) { i in
                                Rectangle()
                                    .fill(.tint.opacity(0.25))
                                    .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                    .containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 10)
                                    .overlay(Text("Wide tile \(i + 1)").foregroundStyle(.tint))
                            }
                        }
                    }
                    .frame(height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Each card spans 3 of 4 columns \u{2014} ~75% of container width.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: single-card paged layout equivalent.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Single-card paged layout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)")
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(0..<3) { i in
                                Rectangle()
                                    .fill(Color.accentColor.opacity(0.18 + Double(i) * 0.18))
                                    .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)
                                    .overlay(Text("Page \(i + 1)").foregroundStyle(.white).fontWeight(.semibold))
                            }
                        }
                    }
                    .frame(height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("count=1, span=1 produces a one-page-at-a-time layout equivalent to .containerRelativeFrame(.horizontal).")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // States: sizing formula.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sizing formula")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("availableWidth = containerWidth - (spacing * (count - 1))\ncolumnWidth   = availableWidth / count\nitemWidth     = (columnWidth * span) + ((span - 1) * spacing)")
                    Text("count divides the container into equal columns minus inter-column spacing; span chooses how many of those columns the wrapped view occupies (and adds the spacing back between spanned columns).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Pair with .safeAreaPadding for outer gutters.",
                        detail: "Wrap the carousel in an outer .safeAreaPadding(.horizontal, \u{2026}) when you want gutters around the carousel without affecting the slot math.",
                        symbol: "rectangle.compress.vertical"
                    )
                    noteRow(
                        title: ".aspectRatio(_:contentMode:) before containerRelativeFrame.",
                        detail: "Putting aspectRatio first keeps the cross-axis controlled by ratio while the main axis follows the count/span container math.",
                        symbol: "rectangle.split.2x2"
                    )
                    noteRow(
                        title: "Same axis-set semantics as the other overloads.",
                        detail: "Pass .horizontal, .vertical, or both. The grid math runs on whichever axes you specify; unspecified axes use the wrapped view's natural sizing.",
                        symbol: "arrow.up.and.down.and.arrow.left.and.right"
                    )
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on frame sizing, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "frame() wraps without clipping.",
                    detail: "The modifier produces an invisible frame around the child but does not crop overflow. A child can ignore the proposal and draw outside; reach for .clipped() or a clip shape when you need hard bounds.",
                    symbol: "square.dashed"
                )
                noteRow(
                    title: "Alignment only matters when frame size differs from child size.",
                    detail: "If the resolved frame matches the wrapped view's intrinsic size, alignment has no visible effect. The alignment parameter fills the gap between the proposed frame and the actual content.",
                    symbol: "align.horizontal.center"
                )
                noteRow(
                    title: "Shapes always fill their proposed frame.",
                    detail: "Circle, Rectangle, Ellipse, Capsule \u{2014} every Shape conformer fills the proposal exactly. So .frame on a shape both sizes the shape and bounds it visibly.",
                    symbol: "circle.dashed"
                )
                noteRow(
                    title: "containerRelativeFrame subtracts safe-area insets.",
                    detail: "The reported container length is the visible content area, not raw window dimensions \u{2014} so paged carousels respect toolbars, inspector chrome, and sidebar splits automatically.",
                    symbol: "rectangle.inset.filled"
                )
                noteRow(
                    title: "Use the closure overload for custom math; the grid overload for slot math.",
                    detail: "The axes overload always claims the full container length on the chosen axes. Reach for the closure overload (containerRelativeFrame(_:alignment:_:)) when you need fractions, curves, or per-axis branching; reach for count/span when you want a paged carousel that shows N slides.",
                    symbol: "function"
                )
                noteRow(
                    title: "Sizing precedence \u{2014} frame composes with parent and child.",
                    detail: "frame(width:height:) imposes a fixed proposal regardless of the parent's offer; frame(maxWidth: .infinity) consumes the parent's offer; idealWidth/idealHeight take effect under fixedSize(). Order modifiers carefully \u{2014} layout flows top-down, sizing bottom-up.",
                    symbol: "rectangle.split.3x1"
                )
                noteRow(
                    title: "Pair frame() with semantic background and overlay modifiers.",
                    detail: "Apply .background and .overlay AFTER .frame so the chrome wraps the resolved frame, not the natural child size. Inverting the order paints chrome around the unsized child and lets it overflow visually.",
                    symbol: "square.stack"
                )
            }
        }
    }

    // MARK: Note row helper

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

extension FrameGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.frame",
        title: "Frame",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Frame",
            "View/frame(width:height:alignment:)",
            "View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)",
            "View/frame(depth:alignment:)",
            "View/frame(minDepth:idealDepth:maxDepth:alignment:)",
            "View/containerRelativeFrame(_:alignment:)",
            "View/containerRelativeFrame(_:alignment:_:)",
            "View/containerRelativeFrame(_:count:span:spacing:alignment:)",
            "Laying out a simple view",
            "swiftui.layout-adjustments.laying-out-a-simple-view",
            "swiftui.layout-adjustments.frame(depth:alignment:)",
            "swiftui.layout-adjustments.frame(mindepth:idealdepth:maxdepth:alignment:)",
        ],
        blurb: "Constrain a view to a fixed size, a flexible range, or a container-relative size. frame accepts width/height (and depth on visionOS); containerRelativeFrame ties size to the nearest scrollable container.",
        signature: "func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/frame(width:height:alignment:).md",
        page: { AnyView(FrameGalleryPage()) }
    )
}

#Preview {
    FrameGalleryPage()
        .frame(width: 1100, height: 1100)
}
