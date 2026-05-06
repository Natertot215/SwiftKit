import SwiftUI

// Dense SafeArea reference page. Consolidates seven previously-separate leaves:
//   • SafeAreaPage (original — safeAreaInset / ignoresSafeArea / SafeAreaRegions roundup)
//   • View/safeAreaPadding(_:)            (EdgeInsets variant)
//   • View/safeAreaPadding(_:_:)          (Edge.Set + amount variant)
//   • View/safeAreaInset(edge:alignment:spacing:content:)
//   • View/ignoresSafeArea(_:edges:)
//   • View/safeAreaBar(edge:alignment:spacing:content:)   (macOS 26.0+)
//   • SafeAreaRegions                     (describe-only OptionSet selector)
//
// Source docs:
//   Documentation/SwiftUI/layout-adjustments/safearearegions.md
//   Documentation/SwiftUI/layout-adjustments/safeareapadding(_:).md
//   Documentation/SwiftUI/layout-adjustments/safeareapadding(_:_:).md
//   Documentation/SwiftUI/layout-adjustments/safeareainset(edge:alignment:spacing:content:).md
//   Documentation/SwiftUI/layout-adjustments/ignoressafearea(_:edges:).md
//   Documentation/SwiftUI/scroll-views/safeareabar(edge:alignment:spacing:content:).md
//
// Mirrors TypographyPage's dense-page rhythm: one ScrollView, one VStack, one
// PageSection per topic. Reference subsection (SafeAreaRegions describe content)
// is placed ABOVE demo subsections per the describe-track placement rule.
// All demos compose Apple primitives directly — no custom wrapper views.

struct SafeAreaPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                safeAreaRegionsReferenceSection
                safeAreaPaddingInsetsSection
                safeAreaPaddingEdgesSection
                safeAreaInsetSection
                ignoresSafeAreaSection
                safeAreaBarSection
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
            Text("SafeArea")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Safe-area insets, region ignoring, and bar attachment modifiers — the full family of APIs that read or adjust safe area on a view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/ \u{00b7} macOS 11.0+ (safeAreaBar: macOS 26.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".ignoresSafeArea(_:edges:)  \u{00b7}  .safeAreaInset(edge:alignment:spacing:content:)  \u{00b7}  .safeAreaPadding(_:[_:])  \u{00b7}  .safeAreaBar(edge:alignment:spacing:content:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (SafeAreaRegions type)
    //
    // Describe-track content placed above demos per the describe-track placement
    // rule. Open the page, see the type definition first, then scroll into demos.

    private var safeAreaRegionsReferenceSection: some View {
        PageSection("Reference (SafeAreaRegions type)", subtitle: "@frozen struct SafeAreaRegions: OptionSet \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Blurb.
                Text("An OptionSet that names safe-area regions. Pass values to View/ignoresSafeArea(_:edges:) to control which kind of safe area a view should extend into.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                // Cases listing.
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".container")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 110, alignment: .leading)
                        Text("The safe area enforced by the containing scene \u{2014} window chrome, titles, sidebars, navigation, tab bars. Default for most ignoresSafeArea calls.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".keyboard")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 110, alignment: .leading)
                        Text("Software-keyboard safe area. iOS / iPadOS-only behavior \u{2014} on macOS the option resolves but has no effect.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".all")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 110, alignment: .leading)
                        Text("Every safe-area region. Useful with full-bleed gradients / backgrounds.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                // Signatures.
                VStack(alignment: .leading, spacing: 4) {
                    APICallout("@frozen struct SafeAreaRegions: OptionSet")
                    APICallout("static let container: SafeAreaRegions")
                    APICallout("static let keyboard: SafeAreaRegions")
                    APICallout("static let all: SafeAreaRegions")
                    APICallout(".ignoresSafeArea(.container, edges: .all)")
                }

                // Combine via array literal.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Combine via array literal")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea([.container, .keyboard], edges: .bottom)")
                    Text("OptionSet conformance lets you union multiple regions in a single call. Pick `.container` over `.all` when you want to leave the keyboard region intact on iOS.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Conformances.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("OptionSet, SetAlgebra, ExpressibleByArrayLiteral, RawRepresentable, Sendable")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "OptionSet \u{2014} combine cases with array literals.",
                        detail: "Conforms to OptionSet, SetAlgebra, ExpressibleByArrayLiteral, RawRepresentable, Sendable. `[.container, .keyboard]` is the union you actually compose at call sites.",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "On macOS, .keyboard is a no-op.",
                        detail: "Keep it in cross-platform code if you also target iOS \u{2014} the value resolves cleanly but doesn't change layout on the Mac.",
                        symbol: "macbook"
                    )
                    noteRow(
                        title: ".container covers everything except the keyboard.",
                        detail: "Prefer it over .all when you don't want to ignore the keyboard region on iOS. On macOS-only targets the two are functionally identical.",
                        symbol: "info.circle"
                    )
                }
            }
        }
    }

    // MARK: safeAreaPadding(_:) — EdgeInsets variant

    private var safeAreaPaddingInsetsSection: some View {
        PageSection("safeAreaPadding(_:)", subtitle: "View/safeAreaPadding(_:) \u{00b7} EdgeInsets variant \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: leading EdgeInsets.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".safeAreaPadding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))")
                    Text("Adds 24pt of leading safe-area padding \u{2014} a ScrollView inside this view will start its content 24pt further from the leading edge while the scroller itself still spans full width.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(0..<5) { i in
                                Text("Row \(i + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(8)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                    }
                    .safeAreaPadding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                    .frame(height: 180)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }

                // Variant: asymmetric vertical.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Asymmetric vertical")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))")
                    Text("Insets the safe area heavier at the bottom \u{2014} useful when overlay chrome takes more space at the bottom edge than the top.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: all-edge padding.
                VStack(alignment: .leading, spacing: 8) {
                    Text("All-edge padding")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))")
                    Text("Equivalent to inset on every edge \u{2014} use .safeAreaPadding(8) (the CGFloat overload from .safeAreaPadding(_:_:)) for the same effect with a single literal.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: vs. View/padding.
                VStack(alignment: .leading, spacing: 8) {
                    Text("vs. View/padding")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding(20)            // outer frame inset")
                    APICallout(".safeAreaPadding(20)    // safe-area inset, layout-aware")
                    Text("padding shrinks the view's frame; safeAreaPadding leaves the frame alone but tells descendants their safe area is smaller \u{2014} so a ScrollView still scrolls full-width while content stays inset.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Adds to the system safe area, doesn't replace it.",
                        detail: "EdgeInsets are added to whatever safe area the system already provides \u{2014} the modifier composes upward from the existing inset.",
                        symbol: "plus.rectangle"
                    )
                    noteRow(
                        title: "Honors layout direction.",
                        detail: "EdgeInsets.leading and .trailing flip in right-to-left locales \u{2014} the modifier never hard-codes left/right pixels.",
                        symbol: "arrow.left.arrow.right"
                    )
                    noteRow(
                        title: "Use the (_:_:) overload for per-edge amounts via Edge.Set.",
                        detail: "When you want \".horizontal, 24\" or \"[.top, .leading], 16\" without building an EdgeInsets, the Edge.Set + amount overload is more concise.",
                        symbol: "rectangle.split.2x1"
                    )
                }
            }
        }
    }

    // MARK: safeAreaPadding(_:_:) — Edge.Set + amount variant

    private var safeAreaPaddingEdgesSection: some View {
        PageSection("safeAreaPadding(_:_:)", subtitle: "View/safeAreaPadding(_:_:) \u{00b7} Edge.Set + CGFloat? \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: horizontal 24.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".safeAreaPadding(.horizontal, 24)")
                    Text("Horizontal-only safe-area padding \u{2014} the ScrollView still spans full width; rows are inset on leading and trailing.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(0..<5) { i in
                                Text("Row \(i + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(8)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                    }
                    .safeAreaPadding(.horizontal, 24)
                    .frame(height: 180)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }

                // Variant: .vertical / single edge.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".vertical / single edge")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(.vertical, 16)")
                    APICallout(".safeAreaPadding(.top, 24)")
                    APICallout(".safeAreaPadding(.bottom, 32)")
                    Text("Single-axis or single-edge safe-area inset \u{2014} useful for adding breathing room above scroll content without wrapping in safeAreaInset.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: combined Edge.Set.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Combined Edge.Set")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaPadding([.top, .leading], 16)")
                    Text("Edge.Set is an OptionSet \u{2014} array literal syntax combines edges; .horizontal = [.leading, .trailing], .vertical = [.top, .bottom], .all = all four.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: defaults — no length.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Defaults \u{2014} no length")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(.horizontal)   // platform default amount")
                    Text("Pass nil (or omit the amount) to use the platform-default safe-area padding \u{2014} matches what View/padding(.horizontal) would supply.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: vs. View/padding.
                VStack(alignment: .leading, spacing: 8) {
                    Text("vs. View/padding")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding(.horizontal, 24)             // shrinks frame")
                    APICallout(".safeAreaPadding(.horizontal, 24)     // shrinks safe area, frame intact")
                    Text("safeAreaPadding leaves the outer frame alone \u{2014} ScrollViews can still extend beneath, but content positions itself inside the inset safe area.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Edge.Set values: .top / .bottom / .leading / .trailing / .horizontal / .vertical / .all.",
                        detail: "Built-in OptionSet \u{2014} pick the precise combination you want with a single literal.",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "Honors layout direction.",
                        detail: ".leading / .trailing flip in right-to-left locales. Never reach for a literal left/right axis.",
                        symbol: "arrow.left.arrow.right"
                    )
                    noteRow(
                        title: "For an EdgeInsets variant with per-edge amounts in one call, use safeAreaPadding(_:).",
                        detail: "The EdgeInsets overload accepts asymmetric per-edge values directly, without composing with array literals.",
                        symbol: "rectangle.dashed"
                    )
                }
            }
        }
    }

    // MARK: safeAreaInset(edge:alignment:spacing:content:)

    private var safeAreaInsetSection: some View {
        PageSection("safeAreaInset(edge:alignment:spacing:content:)", subtitle: "View/safeAreaInset(edge:alignment:spacing:content:) \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: bottom bar.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".safeAreaInset(edge: .bottom, spacing: 0) { … }")
                    Text("safeAreaInset adds a view that overlays at the specified edge and shrinks the safe area for content beneath it \u{2014} so ScrollView content stops above the bar.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(0..<10) { i in
                                Text("Row \(i + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                Divider().padding(.leading, 12)
                            }
                        }
                    }
                    .safeAreaInset(edge: .bottom, spacing: 0) {
                        Text("Bottom bar \u{2014} content insets above")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(.regularMaterial)
                    }
                    .frame(height: 220)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                    .clipped()
                }

                // Variant: top edge.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Top edge inset")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .top) { Header() }")
                    Rectangle().fill(.fill.tertiary)
                        .frame(height: 100)
                        .safeAreaInset(edge: .top) {
                            Text("Header strip")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 6)
                                .background(.tint.opacity(0.2))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                // Variant: trailing edge with spacing.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Trailing edge with spacing")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .trailing, spacing: 12) { Sidebar() }")
                    Rectangle().fill(.fill.tertiary)
                        .frame(height: 80)
                        .safeAreaInset(edge: .trailing, spacing: 12) {
                            VStack(spacing: 6) {
                                Image(systemName: "star")
                                Image(systemName: "heart")
                                Image(systemName: "bolt")
                            }
                            .font(.callout)
                            .padding(8)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 6))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                // Variant: alignment within the edge stripe.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment within the edge stripe")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .bottom, alignment: .trailing) { … }")
                    Text("alignment is HorizontalAlignment for top/bottom, VerticalAlignment for leading/trailing \u{2014} positions the inset view within the stripe.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: all parameters.
                VStack(alignment: .leading, spacing: 8) {
                    Text("All parameters")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("""
                    .safeAreaInset(
                        edge: .bottom,
                        alignment: .center,
                        spacing: 8,
                        content: { Text("Bar") }
                    )
                    """)
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                    Text("edge: VerticalEdge or HorizontalEdge depending on overload. alignment: optional, defaults to .center. spacing: optional CGFloat between the inset and the underlying content.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Right primitive for persistent toolbars / footer bars over scrollable content.",
                        detail: "ScrollView content insets without manual padding math \u{2014} the system threads the inset through to the descendant scroller automatically.",
                        symbol: "arrow.up.and.down.square"
                    )
                    noteRow(
                        title: "Two overloads \u{2014} VerticalEdge and HorizontalEdge.",
                        detail: "(.top / .bottom) takes a HorizontalAlignment; (.leading / .trailing) takes a VerticalAlignment. The compiler picks the right one based on the edge value.",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "The inset view sits OUTSIDE the new safe area.",
                        detail: "It is not affected by the very inset it creates \u{2014} a bottom bar's own contents stay in their original position.",
                        symbol: "info.circle"
                    )
                }
            }
        }
    }

    // MARK: ignoresSafeArea(_:edges:)

    private var ignoresSafeAreaSection: some View {
        PageSection("ignoresSafeArea(_:edges:)", subtitle: "View/ignoresSafeArea(_:edges:) \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: full bleed gradient.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".ignoresSafeArea(.container, edges: .all)")
                    Text("A colored background extends to the full container, including the title-bar safe area above. Inset content uses padding to stay within the safe area visually.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ZStack(alignment: .topLeading) {
                        LinearGradient(
                            colors: [Color.accentColor.opacity(0.35), Color.accentColor.opacity(0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                            .ignoresSafeArea(.container, edges: .all)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Foreground content")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text("The gradient bleeds beneath chrome. Foreground respects safe area via padding.")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        .padding(20)
                    }
                    .frame(height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }

                // Variant: specific edges.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Specific edges")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.container, edges: .top)")
                    Text("Restricts the bleed to a single edge \u{2014} the leading / trailing / bottom edges keep their safe-area inset.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: .horizontal / .vertical Edge.Set values.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".horizontal / .vertical Edge.Set values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.container, edges: .horizontal)")
                    Text("Edge.Set is an OptionSet \u{2014} use [.top, .bottom] or .vertical to combine.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: SafeAreaRegions selector.
                VStack(alignment: .leading, spacing: 8) {
                    Text("SafeAreaRegions selector")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea(.keyboard, edges: .bottom)")
                    Text("regions selects which safe-area regions to ignore. .container = window chrome, sidebars, navigation. .keyboard = software keyboard region (no effect on macOS). .all = both.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: defaults — no arguments.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Defaults \u{2014} no arguments")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".ignoresSafeArea()    // .all regions, .all edges")
                    Text("Both parameters default to .all, so the bare call ignores every safe-area region on every edge.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: comparison with vs. without.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Comparison \u{2014} with vs. without ignoresSafeArea")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 12) {
                        VStack(spacing: 4) {
                            Color.accentColor.opacity(0.4)
                                .frame(height: 80)
                            Text("Without")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            Color.accentColor.opacity(0.4)
                                .frame(height: 80)
                                .ignoresSafeArea(.container, edges: .all)
                            Text("With ignoresSafeArea")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Text("Inside a small framed container the visual difference is subtle \u{2014} but at the window level the bled view runs under the title bar.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Apply to background views, not interactive content.",
                        detail: "ignoresSafeArea on tappable controls can put them underneath chrome where the user can't reach them. Reserve it for backgrounds, gradients, and decorative surfaces.",
                        symbol: "exclamationmark.triangle"
                    )
                    noteRow(
                        title: ".keyboard region is iOS / iPadOS-only.",
                        detail: "On macOS the value resolves cleanly but has no effect \u{2014} keep it in cross-platform code, drop it in macOS-only paths if you prefer.",
                        symbol: "macbook"
                    )
                    noteRow(
                        title: "For a fixed-size overlay that adjusts the safe area of nested content, use safeAreaInset.",
                        detail: "ignoresSafeArea extends; safeAreaInset adds. Pick by intent: \"this background should bleed\" vs. \"this bar should sit on top.\"",
                        symbol: "arrow.up.and.down.square"
                    )
                }
            }
        }
    }

    // MARK: safeAreaBar(edge:alignment:spacing:content:) — macOS 26.0+

    private var safeAreaBarSection: some View {
        PageSection("safeAreaBar(edge:alignment:spacing:content:)", subtitle: "View/safeAreaBar(edge:alignment:spacing:content:) \u{00b7} HorizontalEdge \u{00b7} macOS 26.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: trailing inspector bar.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".safeAreaBar(edge: .trailing, alignment: .center, spacing: 0) { Inspector() }")
                    Text("Anchors a custom bar to a horizontal edge of the modified view, insetting the safe area for it and extending any scroll edge effects into the bar's region. The bar variant of safeAreaInset on a horizontal axis.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<40) { i in
                                Text("Row \(i)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Divider().padding(.leading, 12)
                            }
                        }
                    }
                    .safeAreaBar(edge: .trailing, alignment: .center, spacing: 0) {
                        VStack(alignment: .leading, spacing: 6) {
                            Label("Inspector", systemImage: "sidebar.right")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.primary)
                            Text("Pinned bar")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                            Divider()
                            Text("trailing edge")
                                .font(.caption2)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.tertiary)
                        }
                        .padding(8)
                        .frame(width: 110)
                        .background(.thinMaterial)
                    }
                    .frame(height: 240)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }

                // Variant: leading edge.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Leading edge")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaBar(edge: .leading) { Sidebar() }")
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<25) { i in
                                Text("Row \(i)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Divider().padding(.leading, 12)
                            }
                        }
                    }
                    .safeAreaBar(edge: .leading) {
                        VStack(alignment: .leading, spacing: 4) {
                            Label("Sidebar", systemImage: "sidebar.left")
                                .font(.caption)
                                .fontWeight(.semibold)
                            Text("leading bar")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                        .padding(8)
                        .frame(width: 110)
                        .background(.thinMaterial)
                    }
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }

                // Variant: vertical alignment.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Vertical alignment")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaBar(edge: .trailing, alignment: .top) { … }")
                    APICallout(".safeAreaBar(edge: .trailing, alignment: .center) { … }")
                    APICallout(".safeAreaBar(edge: .trailing, alignment: .bottom) { … }")
                    Text("alignment positions the bar's content vertically when the bar is shorter than its container. Default is .center.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: spacing.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Spacing")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".safeAreaBar(edge: .trailing, spacing: nil)   // platform default")
                    APICallout(".safeAreaBar(edge: .trailing, spacing: 0)     // flush")
                    APICallout(".safeAreaBar(edge: .trailing, spacing: 16)    // explicit gap")
                    Text("spacing is the gap between the bar and the modified view. Pass nil for the system default, 0 for flush attachment, or an explicit value.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: HorizontalEdge only.
                VStack(alignment: .leading, spacing: 8) {
                    Text("HorizontalEdge only")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("// edge: HorizontalEdge   .leading | .trailing")
                    Text("safeAreaBar takes HorizontalEdge \u{2014} the bar attaches to the leading or trailing side. For top/bottom bars, use safeAreaInset(edge: .top|.bottom).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Bar, not just inset.",
                        detail: "Unlike safeAreaInset, this modifier explicitly extends the scroll edge effect into the bar region \u{2014} so the scroll content fades into the bar instead of stopping at the inset edge.",
                        symbol: "rectangle.split.3x1"
                    )
                    noteRow(
                        title: "Side bars, not bottom bars.",
                        detail: "edge is HorizontalEdge \u{2014} only .leading and .trailing. Use safeAreaInset(edge: .bottom) for a bottom bar.",
                        symbol: "arrow.left.and.right"
                    )
                    noteRow(
                        title: "macOS 26+ only.",
                        detail: "Brand-new API tied to the macOS 26 sidebar / inspector visual language. No equivalent on earlier targets \u{2014} use safeAreaInset there.",
                        symbol: "exclamationmark.circle"
                    )
                    noteRow(
                        title: "Pair with scrollEdgeEffect modifiers.",
                        detail: "Combine .safeAreaBar with .scrollEdgeEffectStyle(.hard, for: edge) or .scrollEdgeEffectHidden(true, for: edge) to coordinate the visual boundary between bar and content.",
                        symbol: "paintbrush"
                    )
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on safe area, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Prefer safeAreaInset for persistent bars over scrollable content.",
                    detail: "It is the right primitive for bottom toolbars, top headers, or trailing inspectors over a ScrollView \u{2014} the system threads the new inset through to the descendant scroller automatically. No manual padding math.",
                    symbol: "arrow.up.and.down.square"
                )
                noteRow(
                    title: "ignoresSafeArea is for full-bleed backgrounds \u{2014} use it with caution.",
                    detail: "Apply to decorative surfaces, gradients, and images that should run beneath window chrome. Don't apply to interactive content, which can become inaccessible under the chrome.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "On macOS, the main safe-area region is the title bar.",
                    detail: "Sidebars introduce additional safe area on the leading edge. Treat the title bar like a permanent top inset \u{2014} content that ignores it bleeds beneath the toolbar.",
                    symbol: "sidebar.left"
                )
                noteRow(
                    title: "The .keyboard region is iOS / iPadOS-only.",
                    detail: "macOS uses a hardware keyboard \u{2014} there is no software keyboard inset to ignore. Cross-platform code can keep .keyboard in the mix; macOS-only code can omit it.",
                    symbol: "keyboard"
                )
                noteRow(
                    title: "macOS 26 introduces safeAreaBar for the new sidebar / inspector language.",
                    detail: "Pair with scroll edge effect modifiers (.scrollEdgeEffectStyle, .scrollEdgeEffectHidden) for the coordinated boundary look. Use safeAreaInset on .leading / .trailing on earlier targets.",
                    symbol: "sidebar.right"
                )
                noteRow(
                    title: "safeAreaPadding adds, doesn't replace.",
                    detail: "Both EdgeInsets and Edge.Set + amount overloads compose with the system safe area \u{2014} the new inset is the union, not a substitution. Layout-direction-aware via .leading / .trailing.",
                    symbol: "plus.rectangle"
                )
                noteRow(
                    title: "padding shrinks the frame; safeAreaPadding shrinks the safe area.",
                    detail: "Pick by intent: ScrollView with content insets => safeAreaPadding (frame intact, scroller still spans full width). Static layout box => padding (smaller frame).",
                    symbol: "rectangle.split.2x1"
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

#Preview {
    SafeAreaPage()
        .frame(width: 1100, height: 1100)
}
