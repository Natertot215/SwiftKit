import SwiftUI

// Dense SwiftUI Gradient family reference page — consolidates 8 absorbed leaves:
//   Gradient                  (struct Gradient)           macOS 10.15+
//   LinearGradient            (struct LinearGradient)     macOS 10.15+
//   RadialGradient            (struct RadialGradient)     macOS 10.15+
//   AngularGradient           (struct AngularGradient)    macOS 10.15+
//   EllipticalGradient        (struct EllipticalGradient) macOS 12.0+
//   Gradient.Stop             (typealias Gradient.Stop)   macOS 10.15+
//   MeshGradient              (struct MeshGradient)       macOS 15.0+
//   AnyGradient               (struct AnyGradient)        macOS 13.0+
//
// Source docs:
//   Documentation/SwiftUI/drawing-and-graphics/gradient.md
//   Documentation/SwiftUI/drawing-and-graphics/meshgradient.md
//   Documentation/SwiftUI/drawing-and-graphics/anygradient.md
//
// Mirrors TypographyPage / ShapesGalleryPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

struct GradientPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                referenceSection
                linearGradientSection
                radialGradientSection
                angularGradientSection
                ellipticalGradientSection
                gradientStopSection
                meshGradientSection
                anyGradientSection
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
            Text("Gradient \u{00b7} MeshGradient \u{00b7} AnyGradient")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Linear, radial, angular, elliptical, and mesh gradient fills. Includes AnyGradient (type-erased) and Gradient.Stop (custom positions).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/gradient.md \u{00b7} macOS 10.15+ (MeshGradient: 15.0+; AnyGradient: 13.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Gradient  \u{00b7}  LinearGradient  \u{00b7}  RadialGradient  \u{00b7}  AngularGradient  \u{00b7}  EllipticalGradient  \u{00b7}  Gradient.Stop  \u{00b7}  MeshGradient  \u{00b7}  AnyGradient")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (AnyGradient type signatures + blurb)

    private var referenceSection: some View {
        PageSection("Reference", subtitle: "AnyGradient \u{00b7} struct AnyGradient \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("AnyGradient is a type-erased gradient. It is what you get from Color.gradient and from .gradient on hierarchical / semantic styles \u{2014} a richer, system-tuned gradient that adapts to context. When used as a ShapeStyle, AnyGradient draws a vertical linear gradient (start [0.5, 0] \u{2192} end [0.5, 1]).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("You\u{2019}ll most often see AnyGradient through the .gradient extension on Color: .blue.gradient, .accentColor.gradient. Apple uses these to add subtle dimensionality to flat colors throughout system UI.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("AnyGradient has no visible appearance in isolation \u{2014} it is consumed by shape fills, foregroundStyle, and backgroundStyle. See Gradient for the value-type representation with explicit color stops.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    APICallout("Color.accentColor.gradient // returns AnyGradient")
                    APICallout("shape.fill(.accentColor.gradient)")
                    APICallout(".foregroundStyle(.blue.gradient)")
                    APICallout(".backgroundStyle(.purple.gradient)")
                }

                VStack(alignment: .leading, spacing: 4) {
                    gradNoteRow(title: "Type-erased \u{2014} the underlying gradient construction is opaque to callers.",
                                detail: "Use AnyGradient when you need to pass a gradient without leaking the concrete gradient type into the signature.",
                                symbol: "square.3.layers.3d")
                    gradNoteRow(title: "As a ShapeStyle, draws a vertical linear gradient (top\u{2192}bottom by default).",
                                detail: "The direction is fixed. If you need a custom direction, construct an explicit LinearGradient.",
                                symbol: "arrow.down")
                    gradNoteRow(title: "Returned by .gradient on Color and several semantic styles.",
                                detail: "Color.accentColor.gradient, Color.blue.gradient, Color.primary.gradient, etc.",
                                symbol: "paintpalette")
                }
            }
        }
    }

    // MARK: LinearGradient

    private var linearGradientSection: some View {
        PageSection("LinearGradient", subtitle: "struct LinearGradient : ShapeStyle, View \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(LinearGradient(colors: [.blue, .purple, .pink],
                                                  startPoint: .leading, endPoint: .trailing))
                            .frame(width: 280, height: 100)
                        APICallout("LinearGradient(colors: [.blue, .purple, .pink], startPoint: .leading, endPoint: .trailing)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Direction variants (\u{2192} \u{2193} \u{2198})")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    let configs: [(String, UnitPoint, UnitPoint)] = [
                        ("\u{2192} leading\u{2192}trailing", .leading, .trailing),
                        ("\u{2193} top\u{2192}bottom", .top, .bottom),
                        ("\u{2198} topLeading\u{2192}bottomTrailing", .topLeading, .bottomTrailing)
                    ]
                    HStack(spacing: 16) {
                        ForEach(configs, id: \.0) { label, start, end in
                            VStack(spacing: 6) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(colors: [.blue, .pink], startPoint: start, endPoint: end))
                                    .frame(width: 100, height: 70)
                                Text(label)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 110)
                            }
                        }
                    }
                    APICallout("LinearGradient(colors:startPoint:endPoint:)  \u{00b7}  also init(stops:startPoint:endPoint:)")
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "LinearGradient conforms to both ShapeStyle and View.",
                                detail: "You can use it directly as a view (with a .frame) or inside .fill() / .foregroundStyle().",
                                symbol: "paintbrush")
                }
            }
        }
    }

    // MARK: RadialGradient

    private var radialGradientSection: some View {
        PageSection("RadialGradient", subtitle: "struct RadialGradient : ShapeStyle, View \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Center and offset variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(RadialGradient(colors: [.yellow, .orange, .red],
                                                      center: .center, startRadius: 0, endRadius: 70))
                                .frame(width: 140, height: 100)
                            APICallout("center: .center, startRadius: 0, endRadius: 70")
                        }
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(RadialGradient(colors: [Color.accentColor.opacity(0.1), Color.accentColor],
                                                      center: .topLeading, startRadius: 0, endRadius: 130))
                                .frame(width: 140, height: 100)
                            APICallout("center: .topLeading, endRadius: 130")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "startRadius and endRadius control the gradient band.",
                                detail: "Colors are constant inside startRadius and outside endRadius; the transition occurs between the two values.",
                                symbol: "circle.dotted")
                }
            }
        }
    }

    // MARK: AngularGradient

    private var angularGradientSection: some View {
        PageSection("AngularGradient", subtitle: "struct AngularGradient : ShapeStyle, View \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Full wheel and angle-bounded variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Circle()
                                .fill(AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                                                       center: .center))
                                .frame(width: 100, height: 100)
                            APICallout("AngularGradient(colors: [...], center: .center)")
                        }
                        VStack(spacing: 6) {
                            Circle()
                                .fill(AngularGradient(gradient: Gradient(colors: [.blue, .accentColor, .blue]),
                                                       center: .center, startAngle: .degrees(0), endAngle: .degrees(180)))
                                .frame(width: 100, height: 100)
                            APICallout("startAngle: .degrees(0), endAngle: .degrees(180)")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "AngularGradient for conic effects.",
                                detail: "AngularGradient sweeps around a center point. Use it for color wheels, pie-chart backgrounds, and loading spinners.",
                                symbol: "circle.dotted")
                }
            }
        }
    }

    // MARK: EllipticalGradient

    private var ellipticalGradientSection: some View {
        PageSection("EllipticalGradient", subtitle: "struct EllipticalGradient : ShapeStyle, View \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Centered demo")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(EllipticalGradient(colors: [Color.accentColor, Color.accentColor.opacity(0)],
                                                          center: .center))
                                .frame(width: 140, height: 90)
                            APICallout("EllipticalGradient(colors: [.tint, .tint.opacity(0)])")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "EllipticalGradient for radial on non-square frames.",
                                detail: "Unlike RadialGradient, EllipticalGradient automatically adapts its aspect ratio to the frame \u{2014} no manual radius tuning needed.",
                                symbol: "oval")
                }
            }
        }
    }

    // MARK: Gradient.Stop

    private var gradientStopSection: some View {
        PageSection("Gradient.Stop \u{2014} Custom Stop Positions", subtitle: "typealias Gradient.Stop  \u{00b7}  init(color:location:) \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Discrete color bands via stop positions")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(stops: [
                                .init(color: .blue, location: 0),
                                .init(color: .blue, location: 0.4),
                                .init(color: .pink, location: 0.6),
                                .init(color: .pink, location: 1)
                            ], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 280, height: 60)
                        APICallout("LinearGradient(stops: [.init(color: .blue, location: 0), .init(color: .blue, location: 0.4), .init(color: .pink, location: 0.6), .init(color: .pink, location: 1)])")
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "Location is normalized in the [0, 1] range.",
                                detail: "0 = gradient start; 1 = gradient end. Placing two stops at the same location creates a hard edge. Placing them close together creates a sharp transition.",
                                symbol: "slider.horizontal.3")
                    gradNoteRow(title: "Gradient colors take any ShapeStyle.",
                                detail: "Pass Color, AnyGradient, or other ShapeStyles as stop colors. Gradient.Stop lets you place color transitions at precise normalized positions.",
                                symbol: "paintpalette")
                }
            }
        }
    }

    // MARK: MeshGradient

    private var meshGradientSection: some View {
        PageSection("MeshGradient", subtitle: "struct MeshGradient : View, ShapeStyle \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} 3\u{00d7}3 rainbow grid")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        if #available(macOS 15, *) {
                            MeshGradient(
                                width: 3,
                                height: 3,
                                points: [
                                    [0, 0], [0.5, 0], [1, 0],
                                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                                    [0, 1], [0.5, 1], [1, 1]
                                ],
                                colors: [
                                    .red, .purple, .indigo,
                                    .orange, .white, .blue,
                                    .yellow, .green, .mint
                                ]
                            )
                            .frame(width: 320, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        } else {
                            Text("MeshGradient requires macOS 15+")
                                .foregroundStyle(.secondary)
                        }
                        APICallout("MeshGradient(width: 3, height: 3, points: [...], colors: [...])")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Grid variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    if #available(macOS 15, *) {
                        HStack(alignment: .top, spacing: 16) {
                            VStack(spacing: 6) {
                                MeshGradient(
                                    width: 2,
                                    height: 2,
                                    points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                                    colors: [.blue, .purple, .orange, .pink]
                                )
                                .frame(width: 180, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                Text("2\u{00d7}2 corner colors")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            VStack(spacing: 6) {
                                MeshGradient(
                                    width: 3,
                                    height: 3,
                                    points: [
                                        [0, 0], [0.5, 0], [1, 0],
                                        [0, 0.5], [0.5, 0.5], [1, 0.5],
                                        [0, 1], [0.5, 1], [1, 1]
                                    ],
                                    colors: [
                                        .indigo, .blue, .cyan,
                                        .blue, .teal, .mint,
                                        .purple, .indigo, .blue
                                    ]
                                )
                                .frame(width: 180, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                Text("3\u{00d7}3 cool palette")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    } else {
                        Text("MeshGradient requires macOS 15+")
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Distorted control points \u{2014} bowed mesh")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    if #available(macOS 15, *) {
                        VStack(spacing: 6) {
                            MeshGradient(
                                width: 3,
                                height: 3,
                                points: [
                                    [0, 0],     [0.5, 0.1], [1, 0],
                                    [0.1, 0.5], [0.6, 0.6], [0.9, 0.5],
                                    [0, 1],     [0.5, 0.9], [1, 1]
                                ],
                                colors: [
                                    .pink, .orange, .yellow,
                                    .red, .white, .green,
                                    .purple, .blue, .teal
                                ]
                            )
                            .frame(width: 280, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            APICallout("Move grid points inward/outward to bow or warp the mesh")
                        }
                    } else {
                        Text("MeshGradient requires macOS 15+")
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Use as ShapeStyle \u{2014} fill any Shape")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    if #available(macOS 15, *) {
                        HStack(spacing: 16) {
                            Circle()
                                .fill(MeshGradient(
                                    width: 2, height: 2,
                                    points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                                    colors: [.purple, .pink, .orange, .yellow]
                                ))
                                .frame(width: 120, height: 120)
                            RoundedRectangle(cornerRadius: 16)
                                .fill(MeshGradient(
                                    width: 2, height: 2,
                                    points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                                    colors: [.blue, .indigo, .teal, .mint]
                                ))
                                .frame(width: 160, height: 120)
                        }
                    } else {
                        Text("MeshGradient requires macOS 15+")
                            .foregroundStyle(.secondary)
                    }
                    APICallout("shape.fill(MeshGradient(width:height:points:colors:))")
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "MeshGradient is both a View and a ShapeStyle.",
                                detail: "It can stand alone as a view (in a frame) or fill a Shape via shape.fill(meshGradient).",
                                symbol: "square.grid.3x3.fill")
                    gradNoteRow(title: "Width \u{00d7} height defines the grid.",
                                detail: "Provide width\u{00d7}height entries for both points and colors. SIMD2<Float> is the typical point literal \u{2014} [x, y] in [0, 1] coordinates.",
                                symbol: "grid")
                    gradNoteRow(title: "Colors interpolate via B\u{00e9}zier patches.",
                                detail: "By default, colors interpolate linearly. Set smoothsColors: true to interpolate via cubic curves derived from neighbor colors for softer transitions.",
                                symbol: "wand.and.stars")
                    gradNoteRow(title: "Distort control points to bend the mesh.",
                                detail: "Move grid points inward/outward to bow or warp the mesh. Each interior vertex has four implicit B\u{00e9}zier tangents the framework derives from its neighbors.",
                                symbol: "scribble")
                    gradNoteRow(title: "macOS 15+ only \u{2014} guard with #available if targeting older systems.",
                                detail: "MeshGradient was introduced in macOS 15 / iOS 18. SwiftKit\u{2019}s macOS 26 target means it is always available here.",
                                symbol: "calendar")
                }
            }
        }
    }

    // MARK: AnyGradient

    private var anyGradientSection: some View {
        PageSection("AnyGradient", subtitle: "struct AnyGradient : ShapeStyle \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Color.accentColor.gradient and Color.blue.gradient")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            let g: AnyGradient = Color.accentColor.gradient
                            Circle().fill(g).frame(width: 80, height: 80)
                            APICallout("Color.accentColor.gradient")
                        }
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.gradient)
                                .frame(width: 120, height: 70)
                            APICallout("Color.blue.gradient")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Fills and style modifiers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.purple.gradient)
                                .frame(width: 140, height: 70)
                            APICallout(".fill(.purple.gradient)")
                        }
                        VStack(spacing: 6) {
                            Text("Styled")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.orange.gradient)
                                .frame(width: 140, height: 70)
                                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 12))
                            APICallout(".foregroundStyle(.orange.gradient)")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    gradNoteRow(title: "System-tuned \u{2014} adapts to context automatically.",
                                detail: "AnyGradient from Color.gradient is system-tuned: Apple adjusts its rendering for dark/light mode and other environmental factors.",
                                symbol: "sparkles")
                    gradNoteRow(title: "Color.tint.gradient \u{2014} one-line gradient fill.",
                                detail: "Any Color exposes a .gradient property returning an AnyGradient suitable for use directly in .fill or .foregroundStyle.",
                                symbol: "paintbrush")
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Guidance on gradient usage from Apple\u{2019}s docs and HIG.") {
            VStack(alignment: .leading, spacing: 16) {
                gradNoteRow(title: "LinearGradient / RadialGradient / AngularGradient conform to both View and ShapeStyle.",
                            detail: "All three can appear standalone in a frame or inside .fill(). EllipticalGradient also conforms to both.",
                            symbol: "square.2.layers.3d")
                gradNoteRow(title: "Gradient.Stop enables hard-edge transitions.",
                            detail: "Placing two adjacent stops with identical locations (or very small delta) produces a near-hard-edge between colors \u{2014} useful for flag or band patterns.",
                            symbol: "slider.horizontal.3")
                gradNoteRow(title: "MeshGradient macOS 15+ guard.",
                            detail: "Guard with if #available(macOS 15, *) when targeting older systems. SwiftKit\u{2019}s macOS 26 target means the guard is informational here.",
                            symbol: "calendar")
                gradNoteRow(title: "AnyGradient type-erasure semantics.",
                            detail: "AnyGradient hides the concrete gradient type behind a protocol-boxed wrapper. The underlying construction is opaque; callers cannot cast back to a specific gradient type.",
                            symbol: "square.3.layers.3d")
                gradNoteRow(title: "EllipticalGradient vs RadialGradient.",
                            detail: "EllipticalGradient scales its aspect ratio automatically with the frame; RadialGradient uses explicit startRadius/endRadius and clips differently. Prefer EllipticalGradient for non-square frames.",
                            symbol: "oval")
                gradNoteRow(title: "AngularGradient for pie charts, spinners, and color wheels.",
                            detail: "AngularGradient sweeps a full or partial arc around its center point. Combine startAngle/endAngle to confine the sweep to a pie segment.",
                            symbol: "circle.dotted")
            }
        }
    }

    // MARK: Helpers

    private func gradNoteRow(title: String, detail: String, symbol: String) -> some View {
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
    GradientPage()
        .frame(width: 1100, height: 1600)
}
