import SwiftUI

// Dense Background & Overlay reference page. Consolidates twelve previously-separate leaves:
//   • View/background(alignment:content:)                               (modifier)
//   • View/background(_:ignoresSafeAreaEdges:)                          (modifier)
//   • View/background(ignoresSafeAreaEdges:)                            (modifier)
//   • View/background(_:in:fillStyle:)                                  (modifier)
//   • View/background(in:fillStyle:)                                    (modifier)
//   • View/overlay(alignment:content:)                                  (modifier)
//   • View/overlay(_:ignoresSafeAreaEdges:)                             (modifier)
//   • View/overlay(_:in:fillStyle:)                                     (modifier)
//   • View/containerBackground(_:for:)                                  (modifier)
//   • View/containerBackground(for:alignment:content:)                  (modifier)
//   • ContainerBackgroundPlacement                                      (enum)
//   • Adding a background to your view                                  (guide)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/background.md
//   Documentation/SwiftUI/layout-fundamentals/containerbackground.md
//   macOS 12.0+ (background/overlay variants); macOS 14.0+ (containerBackground)

struct BackgroundOverlayGalleryPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                backgroundShapeStyleSection
                backgroundShapeSection
                backgroundViewSection
                overlayShapeStyleSection
                overlayShapeSection
                overlayViewSection
                containerBackgroundSection
                notesSection
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
            Text("Background & Overlay")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Add layers behind (background) or in front (overlay) of a view using ShapeStyles, shapes, or arbitrary views. containerBackground applies behind entire container scenes like navigation stacks and tab views.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/background.md \u{00b7} background/overlay: macOS 12.0+  \u{00b7}  containerBackground: macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("background(_:ignoresSafeAreaEdges:)  \u{00b7}  background(ignoresSafeAreaEdges:)  \u{00b7}  background(_:in:fillStyle:)  \u{00b7}  background(in:fillStyle:)  \u{00b7}  background(alignment:content:)  \u{00b7}  overlay variants  \u{00b7}  containerBackground(_:for:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: background(_:ignoresSafeAreaEdges:) and background(ignoresSafeAreaEdges:)

    private var backgroundShapeStyleSection: some View {
        PageSection("background(_:ignoresSafeAreaEdges:) and background(ignoresSafeAreaEdges:)", subtitle: "macOS 12.0+ — apply a ShapeStyle behind a view") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The primary background modifier variants. The first accepts any ShapeStyle; the second defaults to the hierarchical .background token. Both accept an optional ignoresSafeAreaEdges parameter.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("func background<S: ShapeStyle>(_ style: S, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View")
                    APICallout("func background(ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View  // uses .background token")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".background(.tint.opacity(0.15))")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Hello, background")
                        .font(.callout).foregroundStyle(.primary)
                        .padding()
                        .background(.tint.opacity(0.15))
                    APICallout(".background(.tint.opacity(0.15))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".background(.fill.secondary)")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Secondary fill background")
                        .font(.callout).foregroundStyle(.primary)
                        .padding()
                        .background(.fill.secondary)
                    APICallout(".background(.fill.secondary)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".background(.ultraThinMaterial)")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Material background")
                        .font(.callout).foregroundStyle(.primary)
                        .padding()
                        .background(.ultraThinMaterial)
                    APICallout(".background(.ultraThinMaterial)  // blurs content beneath")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ignoresSafeAreaEdges: .all (default)")
                        .font(.headline).foregroundStyle(.primary)
                    Text("The background extends through safe areas by default. Pass an empty set to confine it to the view's own frame.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout(".background(.tint.opacity(0.15), ignoresSafeAreaEdges: .all)  // default")
                    APICallout(".background(.tint.opacity(0.15), ignoresSafeAreaEdges: [])    // no bleed")
                }

                noteRow(
                    title: "background() grows to match the view's frame — it does not clip.",
                    detail: "The background layer shares the view's layout footprint. Add .clipShape or .cornerRadius to clip both the content and background together.",
                    symbol: "square.dashed"
                )
            }
        }
    }

    // MARK: background(_:in:fillStyle:) and background(in:fillStyle:)

    private var backgroundShapeSection: some View {
        PageSection("background(_:in:fillStyle:) and background(in:fillStyle:)", subtitle: "macOS 12.0+ — apply a ShapeStyle inside a specific shape") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Fills a shape with a ShapeStyle and places it behind the view. The shape clips the background rendering. The second variant omits the style argument and uses the semantic .background token.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("func background<S: ShapeStyle, T: Shape>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View")
                    APICallout("func background<T: Shape>(in shape: T, fillStyle: FillStyle = FillStyle()) -> some View")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".background(.fill.secondary, in: RoundedRectangle(cornerRadius: 10))")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Shaped background")
                        .font(.callout).foregroundStyle(.primary)
                        .padding(.horizontal, 16).padding(.vertical, 8)
                        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 10))
                    APICallout(".background(.fill.secondary, in: RoundedRectangle(cornerRadius: 10))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".background(.tint.opacity(0.18), in: Capsule())")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Capsule chip")
                        .font(.callout).foregroundStyle(.tint)
                        .padding(.horizontal, 14).padding(.vertical, 6)
                        .background(.tint.opacity(0.18), in: Capsule())
                    APICallout(".background(.tint.opacity(0.18), in: Capsule())")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".background(.background.secondary, in: Circle())")
                        .font(.headline).foregroundStyle(.primary)
                    Image(systemName: "star.fill")
                        .font(.title)
                        .foregroundStyle(.yellow)
                        .padding(14)
                        .background(.background.secondary, in: Circle())
                    APICallout("Image(systemName: \"star.fill\").background(.background.secondary, in: Circle())")
                }

                noteRow(
                    title: "The shape form is the preferred pattern for badge/chip views.",
                    detail: "background(_:in:) avoids the need for a separate .clipShape — the shape both draws the background and clips to its bounds.",
                    symbol: "paintbrush"
                )
            }
        }
    }

    // MARK: background(alignment:content:)

    private var backgroundViewSection: some View {
        PageSection("background(alignment:content:)", subtitle: "macOS 12.0+ — place an arbitrary view behind") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Places an arbitrary view behind the primary view. The background view is aligned within the primary view's frame according to the alignment parameter. The background view does not influence layout.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("func background<V: View>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Decorative circle offset to bottom-trailing")
                        .font(.headline).foregroundStyle(.primary)
                    Text("View with custom background")
                        .font(.callout).foregroundStyle(.primary)
                        .padding()
                        .frame(width: 220, height: 80)
                        .background(alignment: .bottomTrailing) {
                            Circle()
                                .fill(.tint.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .offset(x: 10, y: 10)
                        }
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout(".background(alignment: .bottomTrailing) { Circle()\u{2026} }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Full bleed gradient behind text")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Gradient background")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(alignment: .center) {
                            LinearGradient(
                                gradient: Gradient(colors: [Color.accentColor.opacity(0.6), Color.accentColor.opacity(0.2)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    APICallout(".background(alignment: .center) { LinearGradient(\u{2026}) }.clipShape(\u{2026})")
                }

                noteRow(
                    title: "background(alignment:content:) does not clip the background view.",
                    detail: "The background view can extend beyond the primary view's bounds. Apply .clipShape if clipping is needed.",
                    symbol: "square.dashed"
                )
            }
        }
    }

    // MARK: overlay(_:ignoresSafeAreaEdges:) and overlay(_:in:fillStyle:)

    private var overlayShapeStyleSection: some View {
        PageSection("overlay(_:ignoresSafeAreaEdges:)", subtitle: "macOS 12.0+ — place a ShapeStyle in front") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Layers a ShapeStyle on top of the view. The overlay does not affect layout — it sits on top of the view's frame. Useful for tint washes, disabled dimming, and focus ring effects.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("func overlay<S: ShapeStyle>(_ style: S, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Tint wash overlay")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Overlay tint wash")
                        .font(.title2).fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .padding()
                        .frame(width: 220, height: 80)
                        .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 10))
                        .overlay(.tint.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    APICallout(".overlay(.tint.opacity(0.15))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled dimming overlay")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Dimmed view")
                        .font(.callout).foregroundStyle(.primary)
                        .padding()
                        .frame(width: 160, height: 60)
                        .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(.background.opacity(0.5))
                    APICallout(".overlay(.background.opacity(0.5))  // semantic disabled treatment")
                }
            }
        }
    }

    private var overlayShapeSection: some View {
        PageSection("overlay(_:in:fillStyle:)", subtitle: "macOS 12.0+ — place a ShapeStyle inside a shape in front") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Fills a shape with a ShapeStyle and places it on top of the view. The canonical use is drawing a border via .overlay(.separator, in: shape.stroke()).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("func overlay<S: ShapeStyle, T: Shape>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Border via overlay")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Border via overlay")
                        .font(.callout).foregroundStyle(.primary)
                        .padding()
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(.separator, in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
                    APICallout(".overlay(.separator, in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Tinted stroke border")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Tinted border")
                        .font(.callout).foregroundStyle(.tint)
                        .padding()
                        .background(.tint.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                        .overlay(.tint.opacity(0.6), in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1.5))
                    APICallout(".overlay(.tint.opacity(0.6), in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1.5))")
                }

                noteRow(
                    title: "Use .overlay for borders — strokeBorder vs overlay semantics.",
                    detail: "strokeBorder draws inside the shape bounds. .overlay with .stroke draws on the center line. For non-Shape views (any arbitrary view), .overlay is the only option.",
                    symbol: "rectangle.on.rectangle"
                )
            }
        }
    }

    // MARK: overlay(alignment:content:)

    private var overlayViewSection: some View {
        PageSection("overlay(alignment:content:)", subtitle: "macOS 12.0+ — place an arbitrary view in front") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Places an arbitrary view on top of the primary view, aligned within the primary view's frame. The overlay does not affect layout. The canonical use is badges, count indicators, and selection checkmarks.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("func overlay<V: View>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Notification badge — .topTrailing")
                        .font(.headline).foregroundStyle(.primary)
                    Image(systemName: "envelope.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                        .padding()
                        .overlay(alignment: .topTrailing) {
                            Text("3")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .frame(width: 18, height: 18)
                                .background(.red, in: Circle())
                                .foregroundStyle(.white)
                                .offset(x: 4, y: -4)
                        }
                    APICallout(".overlay(alignment: .topTrailing) { badgeView }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Loading indicator — .center")
                        .font(.headline).foregroundStyle(.primary)
                    Text("Content loading\u{2026}")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding()
                        .frame(width: 200, height: 80)
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(alignment: .bottomTrailing) {
                            ProgressView()
                                .scaleEffect(0.8)
                                .padding(8)
                        }
                    APICallout(".overlay(alignment: .bottomTrailing) { ProgressView() }")
                }

                noteRow(
                    title: "overlay(alignment:content:) does not affect layout.",
                    detail: "The primary view determines the layout footprint. The overlay is decorative. If the overlay must grow the layout, use ZStack or parent HStack/VStack instead.",
                    symbol: "square.on.square"
                )
            }
        }
    }

    // MARK: containerBackground

    private var containerBackgroundSection: some View {
        PageSection("containerBackground(_:for:) and containerBackground(for:alignment:content:)", subtitle: "macOS 14.0+ — background for entire container scenes") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Applies a background behind an entire container — navigation stack, TabView, widget, etc. — using a ContainerBackgroundPlacement to identify the target container type.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("func containerBackground<S: ShapeStyle>(_ style: S, for container: ContainerBackgroundPlacement) -> some View")
                    APICallout("func containerBackground<V: View>(for container: ContainerBackgroundPlacement, alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ContainerBackgroundPlacement cases")
                        .font(.headline).foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        placementRow(".navigation",         "Behind a NavigationStack or NavigationSplitView.")
                        placementRow(".tabView",            "Behind a TabView (fills the tab view's full frame).")
                        placementRow(".widget",             "Behind a widget extension's timeline entry view.")
                        placementRow(".contentUnavailableView", "Behind a ContentUnavailableView.")
                    }
                    APICallout("enum ContainerBackgroundPlacement: Sendable, Hashable")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Usage — apply at the container's child, not the container itself")
                        .font(.headline).foregroundStyle(.primary)
                    APICallout("""
ContentView()
    .containerBackground(.tint.opacity(0.08), for: .navigation)
""")
                    APICallout("""
ContentView()
    .containerBackground(for: .navigation) {
        LinearGradient(colors: [.tint.opacity(0.1), .clear],
                       startPoint: .top, endPoint: .bottom)
    }
""")
                }

                noteRow(
                    title: "containerBackground is not .background.",
                    detail: ".background applies to one view's frame. containerBackground paints behind the entire container (NavigationStack, TabView, etc.) using the system's container-background rendering layer.",
                    symbol: "info.circle"
                )
                noteRow(
                    title: "Apply containerBackground on the child view, not the container.",
                    detail: "The modifier is declared on the child view that is placed inside the container. The system routes it to the correct container type via the ContainerBackgroundPlacement argument.",
                    symbol: "arrow.up"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: "background() grows to match the view's frame — overlay() doesn't affect it.",
                    detail: "The background is sized to the view's layout frame and does not clip by default. The overlay sits on top within the same frame without changing layout.",
                    symbol: "square.on.square"
                )
                noteRow(
                    title: "Prefer the shape form for chip/badge patterns.",
                    detail: ".background(.tint.opacity(0.18), in: Capsule()) is the idiomatic way to produce a chip — it fills the shape and clips simultaneously without a separate .clipShape call.",
                    symbol: "paintbrush"
                )
                noteRow(
                    title: "Semantic colors only.",
                    detail: "Background and overlay styles should use semantic tokens (.background, .fill, .tint, .separator, .primary, etc.). Never use sampled RGB/hex values for system UI surfaces. See Guidelines/visual-rules.md L-012.",
                    symbol: "lock"
                )
                noteRow(
                    title: "Safe area bleed is the default.",
                    detail: "By default, background and overlay styles extend beyond safe areas. Pass ignoresSafeAreaEdges: [] to confine the style to the view's own frame.",
                    symbol: "arrow.up.backward.and.arrow.down.forward"
                )
            }
        }
    }

    // MARK: Helpers

    private func placementRow(_ name: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(name)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 220, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

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

extension BackgroundOverlayGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.backgroundOverlay",
        title: "BackgroundOverlay",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/background(alignment:content:)",
            "View/background(_:ignoresSafeAreaEdges:)",
            "View/background(_:in:fillStyle:)",
            "View/background(in:fillStyle:)",
            "View/background(ignoresSafeAreaEdges:)",
            "View/overlay(alignment:content:)",
            "View/overlay(_:ignoresSafeAreaEdges:)",
            "View/overlay(_:in:fillStyle:)",
            "View/containerBackground(_:for:)",
            "View/containerBackground(for:alignment:content:)",
            "ContainerBackgroundPlacement",
            "BackgroundMaterial",
            "Adding a background to your view",
        ],
        blurb: "Layer a fill, image, or arbitrary view behind or in front of another view. background and overlay accept either a ShapeStyle in a clipping shape or a fully custom @ViewBuilder content closure; containerBackground attaches a fill to the enclosing scene.",
        signature: "func background<S>(_ style: S, ignoresSafeAreaEdges: Edge.Set = .all) -> some View where S : ShapeStyle",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/background.md",
        page: { AnyView(BackgroundOverlayGalleryPage()) }
    )
}

#Preview {
    BackgroundOverlayGalleryPage()
        .frame(width: 1000, height: 1300)
}
