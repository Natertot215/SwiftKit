import SwiftUI

// Dense Padding reference page. Consolidates eight previously-separate leaves:
//   • View/padding(_:)                  (EdgeInsets variant)
//   • View/padding(_:_:)                (Edge.Set + amount variant)
//   • View/scenePadding(_:)             (Edge.Set only)
//   • View/scenePadding(_:edges:)       (ScenePadding + Edge.Set)
//   • ScenePadding                      (describe-only struct: .minimum, .navigationBar)
//   • View/contentMargins(_:for:)       (CGFloat + ContentMarginPlacement)
//   • View/contentMargins(_:_:for:)     (Edge.Set + CGFloat? + ContentMarginPlacement)
//   • View/contentMargins(_:_:for:)     (EdgeInsets variant — surfaced as reference callout)
//
// Source docs:
//   Documentation/SwiftUI/layout-adjustments/padding(_:).md
//   Documentation/SwiftUI/layout-adjustments/padding(_:_:).md
//   Documentation/SwiftUI/layout-adjustments/scenepadding(_:).md
//   Documentation/SwiftUI/layout-adjustments/scenepadding(_:edges:).md
//   Documentation/SwiftUI/layout-adjustments/scenepadding.md
//   Documentation/SwiftUI/layout-adjustments/contentmargins(_:for:).md
//   Documentation/SwiftUI/layout-adjustments/contentmargins(_:_:for:).md
//
// Mirrors TypographyPage / SafeAreaPage's dense rhythm: one ScrollView, one
// VStack, one PageSection per topic. Reference subsection (ScenePadding describe
// content) is placed ABOVE demo subsections per the describe-track placement
// rule. All demos compose Apple primitives directly — no custom wrapper views.

struct PaddingPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                scenePaddingReferenceSection
                paddingInsetsSection
                paddingEdgesAmountSection
                scenePaddingEdgesSection
                scenePaddingKindEdgesSection
                contentMarginsForSection
                contentMarginsEdgesForSection
                edgeInsetsReferenceSection
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
            Text("Padding & Scene Padding")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Padding modifiers and scene-aware spacing — every overload that adds inset around a view, aligns it with window-content margins, or sets margins inside scroll containers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/ \u{00b7} macOS 10.15+ (scenePadding: 12.0+; scenePadding(_:edges:): 13.0+; contentMargins: 14.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".padding(_:)  \u{00b7}  .padding(_:_:)  \u{00b7}  .scenePadding(_:[edges:])  \u{00b7}  .contentMargins(_:[_:]for:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (ScenePadding type)
    //
    // Describe-track content placed above demos per the describe-track placement
    // rule. Open the page, see the type definition first, then scroll into demos.

    private var scenePaddingReferenceSection: some View {
        PageSection("Reference (ScenePadding type)", subtitle: "struct ScenePadding \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Blurb.
                Text("A struct describing the padding amount appropriate for spacing a view from its containing scene. Pass values of this type to View/scenePadding(_:edges:) to align content with the scene's structural metrics rather than picking a literal CGFloat.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                // Cases listing.
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".minimum")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 130, alignment: .leading)
                        Text("The smallest scene-appropriate amount. Available on macOS, iOS, watchOS, tvOS. On macOS this matches the recommended minimum window content margin.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".navigationBar")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 130, alignment: .leading)
                        Text("The amount needed to align with the watchOS navigation title bar. UNAVAILABLE on macOS \u{2014} the symbol exists but is marked unavailable; passing it to scenePadding(_:edges:) is a compile-time error.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                // Signatures.
                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct ScenePadding")
                    APICallout("static let minimum: ScenePadding")
                    APICallout("static let navigationBar: ScenePadding   // unavailable on macOS")
                    APICallout(".scenePadding(.minimum, edges: .all)")
                }

                // Conformances.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Equatable, Sendable, SendableMetatype")
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
                        title: "On macOS the resolved amount matches the recommended scene margin.",
                        detail: "The framework picks a value tuned for window content; on watchOS it also accounts for curved screen edges. Don't try to substitute a literal CGFloat.",
                        symbol: "macwindow"
                    )
                    noteRow(
                        title: ".navigationBar is watchOS-only.",
                        detail: "Defined for cross-platform source compatibility but marked unavailable on macOS \u{2014} a compile-time error if you pass it to scenePadding(_:edges:) on a Mac target.",
                        symbol: "applewatch.watchface"
                    )
                    noteRow(
                        title: "Pre-macOS 13: not available.",
                        detail: "Earlier macOS used the View/scenePadding(_:) modifier (macOS 12+) without the kind parameter. ScenePadding (the struct) and scenePadding(_:edges:) both ship with macOS 13.",
                        symbol: "calendar.badge.clock"
                    )
                }
            }
        }
    }

    // MARK: padding(_:) — EdgeInsets variant

    private var paddingInsetsSection: some View {
        PageSection("padding(_:)", subtitle: "View/padding(_:) \u{00b7} EdgeInsets variant \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".padding(EdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 0))")
                    Text("Each edge inset independently \u{2014} use this overload when each edge needs a distinct amount.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("Each edge inset independently.")
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 0))
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: asymmetric horizontal.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Asymmetric horizontal")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 8))")
                    Text("Heavier leading inset")
                        .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 8))
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: asymmetric vertical.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Asymmetric vertical")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding(EdgeInsets(top: 24, leading: 0, bottom: 4, trailing: 0))")
                    Text("Heavier top inset")
                        .padding(EdgeInsets(top: 24, leading: 0, bottom: 4, trailing: 0))
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // States: stored EdgeInsets value.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Stored EdgeInsets value")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("let insets = EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)\n.padding(insets)")
                    Text("EdgeInsets is Equatable and Sendable \u{2014} store, mix, and pass around as a value.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use when each edge needs a distinct amount.",
                        detail: "Reach for .padding(_:_:) (the Edge.Set + amount overload) when one amount across one or more edges suffices.",
                        symbol: "rectangle.split.3x1"
                    )
                    noteRow(
                        title: "Apply padding before .border or .background.",
                        detail: "Modifier order matters \u{2014} put .padding before chrome modifiers so the chrome encompasses the padded region.",
                        symbol: "square.dashed.inset.filled"
                    )
                    noteRow(
                        title: "EdgeInsets honors layout direction.",
                        detail: "leading and trailing flip in right-to-left locales \u{2014} the modifier never hard-codes left/right pixels.",
                        symbol: "arrow.left.arrow.right"
                    )
                }
            }
        }
    }

    // MARK: padding(_:_:) — Edge.Set + amount variant

    private var paddingEdgesAmountSection: some View {
        PageSection("padding(_:_:)", subtitle: "View/padding(_:_:) \u{00b7} Edge.Set + CGFloat? \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".padding([.bottom, .trailing], 20)")
                    Text("Padded on the bottom and trailing edges \u{2014} both parameters are optional, so omit them for default padding on all edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("Padded on the bottom and trailing edges.")
                        .padding([.bottom, .trailing], 20)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: Edge.Set values.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Edge.Set values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ForEach([
                        (".padding(.top, 20)", Edge.Set.top, CGFloat(20)),
                        (".padding(.bottom, 20)", .bottom, 20),
                        (".padding(.leading, 32)", .leading, 32),
                        (".padding(.trailing, 32)", .trailing, 32),
                        (".padding(.horizontal, 24)", .horizontal, 24),
                        (".padding(.vertical, 16)", .vertical, 16),
                        (".padding(.all, 12)", .all, 12)
                    ], id: \.0) { label, edges, amount in
                        VStack(alignment: .leading, spacing: 4) {
                            APICallout(label)
                            Text("Content")
                                .padding(edges, amount)
                                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
                        }
                    }
                }

                // Variant: combined edges via OptionSet.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Combined edges via OptionSet")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding([.top, .leading], 16)")
                    Text("Top + leading only")
                        .padding([.top, .leading], 16)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // States: defaults — no length.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Defaults \u{2014} no length")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding(.horizontal)   // platform-default amount")
                    Text("Default horizontal padding")
                        .padding(.horizontal)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                }

                // States: defaults — no edges.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Defaults \u{2014} no edges")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".padding()   // .all + system default")
                    Text("Default all-edge padding")
                        .padding()
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Edge.Set is an OptionSet.",
                        detail: "Combine cases with array literal syntax: [.top, .trailing]. Built-in values cover every common combination.",
                        symbol: "square.grid.2x2"
                    )
                    noteRow(
                        title: ".horizontal / .vertical / .all are unions of the four cardinal edges.",
                        detail: ".horizontal = [.leading, .trailing]; .vertical = [.top, .bottom]; .all = [.top, .bottom, .leading, .trailing].",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "Length nil (or omitted) yields the platform default.",
                        detail: "On macOS that's typically the same value padding(_:) uses without arguments \u{2014} the system-appropriate amount.",
                        symbol: "ruler"
                    )
                }
            }
        }
    }

    // MARK: scenePadding(_:) — Edge.Set only

    private var scenePaddingEdgesSection: some View {
        PageSection("scenePadding(_:)", subtitle: "View/scenePadding(_:) \u{00b7} Edge.Set only \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".scenePadding(.horizontal)")
                    Text("Adds padding to the specified edges using an amount appropriate for the current scene. On macOS this matches the recommended window-content margin.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("Scene padding aligns content with scene metrics.")
                        .scenePadding(.horizontal)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: Edge.Set values.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Edge.Set values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ForEach([
                        (".scenePadding(.all)", Edge.Set.all),
                        (".scenePadding(.horizontal)", .horizontal),
                        (".scenePadding(.vertical)", .vertical),
                        (".scenePadding(.top)", .top),
                        (".scenePadding(.leading)", .leading)
                    ], id: \.0) { label, edges in
                        VStack(alignment: .leading, spacing: 4) {
                            APICallout(label)
                            Text("Content")
                                .scenePadding(edges)
                                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                                .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
                        }
                    }
                }

                // States: default — all edges.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} all edges")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".scenePadding()   // edges parameter defaults to .all")
                    Text("All-edge scene padding")
                        .scenePadding()
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use as the outermost padding for window root content.",
                        detail: "On macOS, scenePadding produces the recommended spacing around the root view of a window \u{2014} reach for it instead of a literal padding amount.",
                        symbol: "macwindow"
                    )
                    noteRow(
                        title: "Non-macOS platforms resolve to the same default as padding(_:_:) without a length.",
                        detail: "Cross-platform code that wants scene-aware spacing on macOS without a literal value should use scenePadding rather than padding.",
                        symbol: "rectangle.compress.vertical"
                    )
                    noteRow(
                        title: "For axis-specific kinds (.minimum vs .navigationBar) reach for scenePadding(_:edges:).",
                        detail: "The kind overload accepts a ScenePadding value plus an Edge.Set. The kind-less overload always uses the scene's default amount.",
                        symbol: "arrow.right.circle"
                    )
                }
            }
        }
    }

    // MARK: scenePadding(_:edges:) — ScenePadding + Edge.Set variant

    private var scenePaddingKindEdgesSection: some View {
        PageSection("scenePadding(_:edges:)", subtitle: "View/scenePadding(_:edges:) \u{00b7} ScenePadding + Edge.Set \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".scenePadding(.minimum, edges: .horizontal)")
                    Text("Adds a specified kind of scene padding (.minimum or .navigationBar) to the specified edges, with an amount appropriate for the current scene.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("Minimum scene padding on horizontal edges.")
                        .scenePadding(.minimum, edges: .horizontal)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Variant: ScenePadding kinds.
                VStack(alignment: .leading, spacing: 8) {
                    Text("ScenePadding kinds")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".scenePadding(.minimum, edges: .all)")
                    Text("Minimum on all edges")
                        .scenePadding(.minimum, edges: .all)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))

                    APICallout(".scenePadding(.navigationBar, edges: .horizontal)   // unavailable on macOS")
                    Label("ScenePadding.navigationBar is marked unavailable on macOS \u{2014} it's a watchOS-targeted kind that aligns watch-face content with the navigation title bar. The signature exists, but compile-time use of it on macOS errors.", systemImage: "exclamationmark.triangle")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: edge subsets.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Edge subsets")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".scenePadding(.minimum, edges: .top)")
                    Text("Minimum on top only")
                        .scenePadding(.minimum, edges: .top)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
                }

                // States: default edges.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default edges \u{2014} .all")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".scenePadding(.minimum)   // edges defaults to .all")
                    Text("Minimum scene padding on all edges")
                        .scenePadding(.minimum)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".minimum vs .navigationBar — pick by intent.",
                        detail: ".minimum is the smallest scene-appropriate amount. .navigationBar aligns content with the navigation chrome above it (watchOS only).",
                        symbol: "arrow.up.and.line.horizontal.and.arrow.down"
                    )
                    noteRow(
                        title: "Non-watchOS platforms fall back to the scene default.",
                        detail: "The .navigationBar variant is most distinctive on watchOS. macOS resolves both kinds to the recommended scene margin.",
                        symbol: "applewatch.watchface"
                    )
                    noteRow(
                        title: "If the kind doesn't matter, use scenePadding(_:).",
                        detail: "The kind-less overload always uses the scene-appropriate default \u{2014} simpler call site, same result on macOS.",
                        symbol: "arrow.left.circle"
                    )
                }
            }
        }
    }

    // MARK: contentMargins(_:for:) — uniform CGFloat variant

    private var contentMarginsForSection: some View {
        PageSection("contentMargins(_:for:)", subtitle: "View/contentMargins(_:for:) \u{00b7} CGFloat + ContentMarginPlacement \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".contentMargins(24, for: .scrollContent)")
                    Text("Configures the content margins for a particular ContentMarginPlacement, applying a uniform amount on all edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(0..<8) { i in
                                Text("Row \(i + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(8)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                    }
                    .contentMargins(24, for: .scrollContent)
                    .frame(height: 200)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("A 24-point margin on the scroll content \u{2014} indicators stay flush with the trailing edge.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: .scrollContent placement.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".scrollContent placement")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(16, for: .scrollContent)")
                    Text("Insets the scrollable content while leaving scroll indicators at the container edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: .scrollIndicators placement.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".scrollIndicators placement")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(8, for: .scrollIndicators)")
                    Text("Pushes the scroll indicators inward without changing where the content sits \u{2014} useful when content runs to the very edge of a chrome-less window.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: .automatic placement.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".automatic placement")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(20, for: .automatic)")
                    Text("Lets SwiftUI decide which placements receive the margins based on the container.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: CGFloat-only overload.
                VStack(alignment: .leading, spacing: 8) {
                    Text("CGFloat-only overload")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(.zero, for: .scrollContent)   // remove margins")
                    Text("Use a CGFloat literal \u{2014} per-edge values are the contentMargins(_:_:for:) overload below.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Same amount on all four edges.",
                        detail: "For per-edge insets, use the Edge.Set + amount overload (View/contentMargins(_:_:for:)).",
                        symbol: "rectangle.dashed"
                    )
                    noteRow(
                        title: "Pair with .scrollContent for chrome-less inset content.",
                        detail: "Insets the scrollable content while keeping indicators visually flush with the container.",
                        symbol: "scroll"
                    )
                    noteRow(
                        title: "Replaces older patterns of wrapping a ScrollView in .padding.",
                        detail: "Unlike .padding around a scroller, contentMargins doesn't shrink the indicator hit area or push scroll bars off the visible edge.",
                        symbol: "arrow.up.and.down"
                    )
                }
            }
        }
    }

    // MARK: contentMargins(_:_:for:) — Edge.Set + amount variant

    private var contentMarginsEdgesForSection: some View {
        PageSection("contentMargins(_:_:for:)", subtitle: "View/contentMargins(_:_:for:) \u{00b7} Edge.Set + CGFloat? + ContentMarginPlacement \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default.
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".contentMargins(.horizontal, 24, for: .scrollContent)")
                    Text("Configures content margins for a particular ContentMarginPlacement, restricted to the edges in an Edge.Set.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(0..<6) { i in
                                Text("Row \(i + 1)")
                                    .font(.callout)
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(8)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                    }
                    .contentMargins(.horizontal, 24, for: .scrollContent)
                    .frame(height: 200)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Horizontal-only margin \u{2014} content sits 24pt in from leading and trailing, top and bottom unchanged.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }

                // Variant: .vertical only.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".vertical only")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(.vertical, 16, for: .scrollContent)")
                    Text("Top + bottom margins, leaving leading/trailing flush with the container edge.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: single edge.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Single edge")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(.top, 32, for: .scrollContent)")
                    Text("Useful for keeping the first row clear of overlapping toolbar chrome.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: combined Edge.Set.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Combined Edge.Set")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins([.top, .bottom], 12, for: .scrollIndicators)")
                    Text("Edge.Set is an OptionSet \u{2014} array literal syntax combines edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Variant: different placements.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Different placements")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(.horizontal, 24, for: .scrollContent)\n.contentMargins(.horizontal,  4, for: .scrollIndicators)")
                    Text("Stack two calls to inset content and indicators by different amounts on the same edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // States: optional length parameter.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Optional length parameter")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".contentMargins(.horizontal, nil, for: .scrollContent)   // platform default")
                    Text("Pass nil to use the system-default amount for the platform on those edges.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                // Notes.
                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Edge.Set values.",
                        detail: ".top / .bottom / .leading / .trailing / .horizontal / .vertical / .all \u{2014} the same OptionSet used by .padding(_:_:).",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "Honors layout direction.",
                        detail: ".leading / .trailing flip in right-to-left locales \u{2014} never reach for a literal left/right axis.",
                        symbol: "arrow.left.arrow.right"
                    )
                    noteRow(
                        title: "Multiple calls with different placements stack.",
                        detail: "They don't override each other \u{2014} a contentMargins for .scrollContent and another for .scrollIndicators compose into a single configuration.",
                        symbol: "square.stack"
                    )
                }
            }
        }
    }

    // MARK: EdgeInsets reference

    private var edgeInsetsReferenceSection: some View {
        PageSection("EdgeInsets reference", subtitle: "struct EdgeInsets \u{00b7} top / leading / bottom / trailing \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("EdgeInsets is the value type passed to .padding(_:) and to the EdgeInsets-shaped contentMargins overload. Each edge is a CGFloat. The .leading and .trailing edges are layout-direction-aware \u{2014} the modifier flips them in right-to-left locales.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)")
                APICallout("init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)")
                APICallout("init()   // .zero on every edge")

                // Conformances.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Equatable, Sendable, Animatable")
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

                Text("Used by .padding(EdgeInsets) and the EdgeInsets-shaped contentMargins overload. Also surfaces in safeAreaPadding(EdgeInsets) \u{2014} see SafeArea page.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on padding, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "padding shrinks the frame; safeAreaPadding shrinks safe area only.",
                    detail: "padding makes the view smaller. safeAreaPadding leaves the frame alone but tells descendants their safe area is smaller \u{2014} so a ScrollView still scrolls full-width while content stays inset. See the SafeArea page for safeAreaPadding.",
                    symbol: "rectangle.split.2x1"
                )
                noteRow(
                    title: "Use scenePadding for window-edge alignment on macOS.",
                    detail: "scenePadding produces the recommended spacing around window content \u{2014} reach for it as the outermost padding on the root view of a window instead of a literal CGFloat.",
                    symbol: "macwindow"
                )
                noteRow(
                    title: "Use contentMargins for ScrollView insets.",
                    detail: "Replaces wrapping a ScrollView in .padding(...). The system threads margins through to the scroller's content and indicators independently \u{2014} no shrunk indicator hit area, no scroll bars pushed off the edge.",
                    symbol: "scroll"
                )
                noteRow(
                    title: "Edge.Set / EdgeInsets honor layout direction.",
                    detail: ".leading and .trailing flip in right-to-left locales. Never reach for literal left/right \u{2014} every padding API in SwiftUI is layout-direction-aware.",
                    symbol: "arrow.left.arrow.right"
                )
                noteRow(
                    title: "All overloads compose additively.",
                    detail: "Multiple .padding / .scenePadding / .contentMargins calls stack \u{2014} each adds to whatever was already in place. Order matters when interleaving with .border or .background.",
                    symbol: "plus.rectangle"
                )
                noteRow(
                    title: "Pick the smallest semantic overload for the call site.",
                    detail: ".padding() for default all-edge inset; .padding(.horizontal, 24) for one axis; EdgeInsets when each edge needs a distinct amount. Don't reach for the EdgeInsets overload when a single Edge.Set + amount call would suffice.",
                    symbol: "ruler"
                )
                noteRow(
                    title: "Apple changes the resolved scene amount between OS versions.",
                    detail: "scenePadding is intentionally not a literal CGFloat \u{2014} the framework owns the value so the look stays current. Hardcoded literals don't track macOS evolution.",
                    symbol: "calendar.badge.clock"
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
    PaddingPage()
        .frame(width: 1100, height: 1100)
}
