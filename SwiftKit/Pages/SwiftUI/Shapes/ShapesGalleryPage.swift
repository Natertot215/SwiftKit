import SwiftUI

// Dense SwiftUI Shapes gallery — consolidates 14 absorbed leaves:
//   Circle, Ellipse, Capsule                                         (struct X : Shape)
//   Rectangle                                                        (struct Rectangle : Shape)
//   RoundedRectangle, RoundedCornerStyle                             (struct / enum)
//   RoundedRectangularShape, RoundedRectangularShapeCorners          (macOS 26.0+)
//   UnevenRoundedRectangle                                           (struct)
//   RectangleCornerRadii, RectangleCornerInsets, ConcentricRectangle (struct / macOS 26.0+)
//   AnyShape                                                         (struct AnyShape : Shape)
//   ShapeRole                                                        (enum ShapeRole)
//
// Source docs:
//   Documentation/SwiftUI/shapes/circle.md
//   Documentation/SwiftUI/shapes/ellipse.md
//   Documentation/SwiftUI/shapes/capsule.md
//   Documentation/SwiftUI/shapes/rectangle.md
//   Documentation/SwiftUI/shapes/roundedrectangle.md
//   Documentation/SwiftUI/shapes/roundedcornerstyle.md
//   Documentation/SwiftUI/shapes/roundedrectangularshape.md
//   Documentation/SwiftUI/shapes/roundedrectangularshapecorners.md
//   Documentation/SwiftUI/shapes/unevenroundedrectangle.md
//   Documentation/SwiftUI/shapes/rectanglecornerradii.md
//   Documentation/SwiftUI/shapes/rectanglecornerinsets.md
//   Documentation/SwiftUI/shapes/concentricrectangle.md
//   Documentation/SwiftUI/shapes/anyshape.md
//   Documentation/SwiftUI/shapes/shaperole.md
//
// Mirrors TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

struct ShapesGalleryPage: View {
    // Interactive state for RoundedRectangle section
    @State private var cornerRadius: CGFloat = 16
    // Interactive state for UnevenRoundedRectangle section
    @State private var topLeading: CGFloat = 24
    @State private var topTrailing: CGFloat = 8
    @State private var bottomLeading: CGFloat = 8
    @State private var bottomTrailing: CGFloat = 24

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                circleSection
                ellipseSection
                capsuleSection
                rectangleSection
                roundedRectangleSection
                roundedRectangleModernSection
                unevenRoundedRectangleSection
                unevenRoundedRectangleModernSection
                anyShapeSection
                shapeRoleSection
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
            Text("Shapes Gallery")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Concrete shape primitives: Circle, Ellipse, Capsule, Rectangle, RoundedRectangle, UnevenRoundedRectangle, and supporting types. Path and Shape-protocol modifiers are covered separately.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/ \u{00b7} macOS 10.15+ (UnevenRoundedRectangle: 13.0+; RoundedRectangularShape / RectangleCornerInsets / ConcentricRectangle: 26.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Circle  \u{00b7}  Ellipse  \u{00b7}  Capsule  \u{00b7}  Rectangle  \u{00b7}  RoundedRectangle  \u{00b7}  RoundedCornerStyle  \u{00b7}  RoundedRectangularShape  \u{00b7}  RoundedRectangularShapeCorners  \u{00b7}  UnevenRoundedRectangle  \u{00b7}  RectangleCornerRadii  \u{00b7}  RectangleCornerInsets  \u{00b7}  ConcentricRectangle  \u{00b7}  AnyShape  \u{00b7}  ShapeRole")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Circle

    private var circleSection: some View {
        PageSection("Circle", subtitle: "struct Circle : Shape \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        Circle().fill(.tint).frame(width: 80, height: 80)
                        APICallout("Circle().fill(.tint).frame(width: 80, height: 80)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("fill / stroke / strokeBorder / RadialGradient")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Circle().fill(.tint).frame(width: 70, height: 70)
                            Text("fill").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Circle().stroke(.tint, lineWidth: 3).frame(width: 70, height: 70)
                            Text("stroke").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Circle().strokeBorder(.tint, lineWidth: 4).frame(width: 70, height: 70)
                            Text("strokeBorder").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Circle()
                                .fill(RadialGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0)]),
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: 35
                                ))
                                .frame(width: 70, height: 70)
                            Text("RadialGradient").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("trim(from:to:) \u{2014} circular progress ring")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 24) {
                        ForEach([0.25, 0.5, 0.75, 1.0], id: \.self) { progress in
                            VStack(spacing: 6) {
                                ZStack {
                                    Circle().stroke(.secondary.opacity(0.3), lineWidth: 5).frame(width: 56, height: 56)
                                    Circle()
                                        .trim(from: 0, to: progress)
                                        .stroke(.tint, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                                        .frame(width: 56, height: 56)
                                        .rotationEffect(.degrees(-90))
                                }
                                Text("\(Int(progress * 100))%")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    APICallout(".trim(from: 0, to: progress).stroke(.tint, style: StrokeStyle(lineCap: .round)).rotationEffect(.degrees(-90))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Nested circles \u{2014} concentric rings pattern")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ZStack {
                        ForEach(0..<5) { i in
                            let size = CGFloat(120 - i * 20)
                            Circle()
                                .stroke(.tint.opacity(0.15 + Double(i) * 0.17), lineWidth: 2)
                                .frame(width: size, height: size)
                        }
                        Circle().fill(.tint).frame(width: 20, height: 20)
                    }
                    .frame(width: 130, height: 130)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("clipShape usage")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Image(systemName: "person.fill")
                                .font(.largeTitle)
                                .frame(width: 64, height: 64)
                                .background(.secondary.opacity(0.2))
                                .clipShape(Circle())
                            APICallout(".clipShape(Circle())")
                        }
                        VStack(spacing: 6) {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .frame(width: 100, height: 56)
                                .background(.secondary.opacity(0.2))
                                .clipShape(Capsule())
                            APICallout(".clipShape(Capsule())")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "Circle fits a square frame \u{2014} always 1:1.",
                            detail: "Circle scales to the smallest dimension of its frame. To get a non-circle oval, use Ellipse instead.",
                            symbol: "circle")
                    noteRow(title: "Circle is InsettableShape.",
                            detail: "Conforms to InsettableShape enabling .strokeBorder which paints inward and never bleeds outside the frame.",
                            symbol: "square.and.pencil")
                }
            }
        }
    }

    // MARK: Ellipse

    private var ellipseSection: some View {
        PageSection("Ellipse", subtitle: "struct Ellipse : Shape \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        Ellipse().fill(.tint).frame(width: 120, height: 70)
                        APICallout("Ellipse().fill(.tint).frame(width: 120, height: 70)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("fill / stroke / fill + stroke overlay")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Ellipse().fill(.tint).frame(width: 110, height: 60)
                            Text("fill").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Ellipse().stroke(.tint, lineWidth: 3).frame(width: 110, height: 60)
                            Text("stroke").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Ellipse()
                                .fill(.tint.opacity(0.25))
                                .overlay { Ellipse().stroke(.tint, lineWidth: 2) }
                                .frame(width: 110, height: 60)
                            Text("fill + stroke").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "Ellipse stretches to fill the given frame.",
                            detail: "Unlike Circle which uses the smallest dimension, Ellipse fills the entire frame — use distinct width and height values to produce a true oval.",
                            symbol: "oval")
                }
            }
        }
    }

    // MARK: Capsule

    private var capsuleSection: some View {
        PageSection("Capsule", subtitle: "struct Capsule : Shape \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        Capsule().fill(.tint).frame(width: 140, height: 55)
                        APICallout("Capsule().fill(.tint).frame(width: 140, height: 55)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("fill / stroke / style: .circular")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Capsule().fill(.tint).frame(width: 120, height: 48)
                            Text("fill").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Capsule().stroke(.tint, lineWidth: 2).frame(width: 120, height: 48)
                            Text("stroke").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            Capsule(style: .circular).fill(.tint).frame(width: 120, height: 48)
                            Text("style: .circular").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    APICallout("Capsule(style: .circular)  \u{00b7}  Capsule() defaults to .continuous")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "Capsule radius is half the smallest dimension.",
                            detail: "The capsule end caps are perfect semicircles whose radius equals half the smaller of width or height. You cannot independently control the cap radius.",
                            symbol: "capsule")
                    noteRow(title: "Capsule is InsettableShape.",
                            detail: "Supports .strokeBorder(_:lineWidth:) — the stroke paints inside the path, never outside the frame.",
                            symbol: "square.and.pencil")
                }
            }
        }
    }

    // MARK: Rectangle

    private var rectangleSection: some View {
        PageSection("Rectangle", subtitle: "struct Rectangle : Shape \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        Rectangle().fill(.tint).frame(width: 200, height: 120)
                        APICallout("Rectangle().fill(.tint).frame(width: 200, height: 120)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("fill(_:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Rectangle().fill(.tint).frame(width: 80, height: 60)
                            APICallout(".fill(.tint)")
                        }
                        VStack(spacing: 6) {
                            Rectangle().fill(.secondary).frame(width: 80, height: 60)
                            APICallout(".fill(.secondary)")
                        }
                        VStack(spacing: 6) {
                            Rectangle()
                                .fill(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                                .frame(width: 80, height: 60)
                            APICallout(".fill(LinearGradient(...))")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("stroke(_:lineWidth:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Rectangle().stroke(.tint, lineWidth: 2).frame(width: 80, height: 60)
                            APICallout("lineWidth: 2")
                        }
                        VStack(spacing: 6) {
                            Rectangle().stroke(.tint, lineWidth: 6).frame(width: 80, height: 60)
                            APICallout("lineWidth: 6")
                        }
                        VStack(spacing: 6) {
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [8, 4]))
                                .frame(width: 80, height: 60)
                                .foregroundStyle(.tint)
                            APICallout("StrokeStyle(dash: [8, 4])")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("trim(from:to:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Rectangle().trim(from: 0, to: 0.5).stroke(.tint, lineWidth: 3).frame(width: 80, height: 60)
                            APICallout(".trim(from: 0, to: 0.5)")
                        }
                        VStack(spacing: 6) {
                            Rectangle().trim(from: 0.25, to: 0.75).stroke(.tint, lineWidth: 3).frame(width: 80, height: 60)
                            APICallout(".trim(from: 0.25, to: 0.75)")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("fill + stroke overlay")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Rectangle()
                        .fill(.tint.opacity(0.3))
                        .overlay { Rectangle().stroke(.tint, lineWidth: 2) }
                        .frame(width: 80, height: 60)
                    APICallout(".fill(...).overlay { .stroke(...) }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Scale and rotation transforms")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 24) {
                        VStack(spacing: 6) {
                            Rectangle().fill(.tint).frame(width: 80, height: 60).scaleEffect(0.6)
                            APICallout(".scaleEffect(0.6)")
                        }
                        VStack(spacing: 6) {
                            Rectangle().fill(.tint).frame(width: 80, height: 60).rotationEffect(.degrees(15))
                            APICallout(".rotationEffect(.degrees(15))")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("clipShape")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .frame(width: 120, height: 80)
                            .background(.secondary.opacity(0.3))
                            .clipShape(Rectangle())
                        APICallout(".clipShape(Rectangle())")
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "Rectangle fills the available frame.",
                            detail: "Unlike a fixed-size UIView, Rectangle expands to fill whatever frame you apply. Always pair with .frame(...) or use in a sized container.",
                            symbol: "rectangle")
                    noteRow(title: "InsettableShape \u{2014} supports .strokeBorder.",
                            detail: "Rectangle conforms to InsettableShape so you can use .strokeBorder(_:lineWidth:) to stroke inside the path rather than centered on the edge.",
                            symbol: "square.and.pencil")
                    noteRow(title: "Use as a clip shape for images.",
                            detail: "Rectangle().clipShape cuts content exactly to its bounds — useful for cropping images to a precise rectangular area.",
                            symbol: "photo")
                    noteRow(title: "trim(from:to:) animates beautifully.",
                            detail: "Animating the `to` value of .trim creates a draw-on effect for progress indicators and onboarding flows.",
                            symbol: "wand.and.sparkles")
                }
            }
        }
    }

    // MARK: RoundedRectangle

    private var roundedRectangleSection: some View {
        PageSection("RoundedRectangle", subtitle: "struct RoundedRectangle : Shape \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 16).fill(.tint).frame(width: 200, height: 120)
                        APICallout("RoundedRectangle(cornerRadius: 16).fill(.tint)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Corner radius sweep")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        ForEach([0, 8, 16, 32, 60], id: \.self) { r in
                            VStack(spacing: 6) {
                                RoundedRectangle(cornerRadius: CGFloat(r))
                                    .fill(.tint)
                                    .frame(width: 64, height: 64)
                                Text("r=\(r)")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("RoundedCornerStyle \u{2014} .circular vs .continuous")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("enum RoundedCornerStyle \u{00b7} macOS 10.15+")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                    HStack(spacing: 24) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 20, style: .circular)
                                .fill(.tint)
                                .frame(width: 80, height: 80)
                            Text(".circular")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(.tint)
                                .frame(width: 80, height: 80)
                            Text(".continuous")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                    APICallout("RoundedRectangle(cornerRadius: 20, style: .circular / .continuous)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("strokeBorder (InsettableShape)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(.tint, lineWidth: 3)
                                .frame(width: 100, height: 60)
                            APICallout(".strokeBorder(.tint, lineWidth: 3)")
                        }
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.tint.opacity(0.2))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(.tint, lineWidth: 2)
                                }
                                .frame(width: 100, height: 60)
                            APICallout(".fill + .strokeBorder overlay")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Gradient fill")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    RoundedRectangle(cornerRadius: 16)
                        .fill(LinearGradient(
                            colors: [.blue, .purple, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 240, height: 100)
                    APICallout("RoundedRectangle(cornerRadius: 16).fill(LinearGradient(...))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Interactive corner radius")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 12) {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(.tint)
                            .frame(width: 240, height: 120)
                            .animation(.spring, value: cornerRadius)
                        HStack {
                            Text("0").font(.caption).foregroundStyle(.secondary)
                            Slider(value: $cornerRadius, in: 0...60)
                                .frame(maxWidth: 240)
                            Text("60").font(.caption).foregroundStyle(.secondary)
                        }
                        Text("cornerRadius = \(Int(cornerRadius))")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "Use .continuous for Apple-style squircles.",
                            detail: ".continuous (the default in most Apple UI) matches the corner curve used in app icons and macOS window chrome. Prefer it over .circular for modern macOS UI.",
                            symbol: "app")
                    noteRow(title: "InsettableShape \u{2014} strokeBorder is sharper.",
                            detail: "With .strokeBorder the path is inset so the stroke never bleeds outside the frame. .stroke(lineWidth:) extends outward by half its width on each side.",
                            symbol: "square.and.pencil")
                    noteRow(title: "Animatable cornerRadius.",
                            detail: "Binding cornerRadius to state and wrapping changes in withAnimation produces smooth morph animations — useful for selection or focus states.",
                            symbol: "wand.and.sparkles")
                    noteRow(title: "clipShape with RoundedRectangle.",
                            detail: "Use .clipShape(RoundedRectangle(cornerRadius:)) to apply rounded clips to images or ZStacks without drawing a separate background.",
                            symbol: "photo")
                }
            }
        }
    }

    // MARK: RoundedRectangle — Modern API (macOS 26.0+)

    private var roundedRectangleModernSection: some View {
        PageSection("RoundedRectangle \u{2014} Modern API", subtitle: "RoundedRectangularShape \u{00b7} RoundedRectangularShapeCorners \u{00b7} macOS 26.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("macOS 26 introduces RoundedRectangularShape — a protocol that RoundedRectangle now conforms to — and the associated RoundedRectangularShapeCorners option set that lets you specify which corners receive rounding.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("RoundedRectangularShape protocol")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("protocol RoundedRectangularShape : Shape  // macOS 26.0+")
                    APICallout("// RoundedRectangle conforms to RoundedRectangularShape on macOS 26+")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("RoundedRectangularShapeCorners \u{2014} option set cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 8) {
                        cornerCaseRow(".topLeading",     "Top-leading corner only.")
                        cornerCaseRow(".topTrailing",    "Top-trailing corner only.")
                        cornerCaseRow(".bottomLeading",  "Bottom-leading corner only.")
                        cornerCaseRow(".bottomTrailing", "Bottom-trailing corner only.")
                        cornerCaseRow(".top",            "Both top corners (.topLeading + .topTrailing).")
                        cornerCaseRow(".bottom",         "Both bottom corners.")
                        cornerCaseRow(".leading",        "Both leading corners.")
                        cornerCaseRow(".trailing",       "Both trailing corners.")
                        cornerCaseRow(".all",            "All four corners — equivalent to omitting the parameter.")
                    }
                    APICallout("struct RoundedRectangularShapeCorners : OptionSet  // macOS 26.0+")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Corner-selective rounding examples")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.tint)
                                .frame(width: 80, height: 60)
                            Text(".all (default)").font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                        }
                        VStack(spacing: 6) {
                            UnevenRoundedRectangle(
                                cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 0, topTrailing: 0)
                            )
                            .fill(.tint)
                            .frame(width: 80, height: 60)
                            Text(".leading").font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                        }
                        VStack(spacing: 6) {
                            UnevenRoundedRectangle(
                                cornerRadii: .init(topLeading: 20, bottomLeading: 0, bottomTrailing: 0, topTrailing: 20)
                            )
                            .fill(.tint)
                            .frame(width: 80, height: 60)
                            Text(".top").font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                        }
                    }
                    APICallout("RoundedRectangularShapeCorners lets API callers restrict which corners are rounded")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "RoundedRectangularShape is macOS 26.0+ only.",
                            detail: "On macOS 26+ RoundedRectangle conforms to RoundedRectangularShape. Use UnevenRoundedRectangle for per-corner control on earlier targets.",
                            symbol: "calendar")
                    noteRow(title: "OptionSet composition.",
                            detail: "RoundedRectangularShapeCorners is an OptionSet — combine with set notation: [.topLeading, .bottomTrailing] or use convenience properties like .top and .leading.",
                            symbol: "slider.horizontal.3")
                }
            }
        }
    }

    // MARK: UnevenRoundedRectangle

    private var unevenRoundedRectangleSection: some View {
        PageSection("UnevenRoundedRectangle", subtitle: "struct UnevenRoundedRectangle : Shape \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(spacing: 6) {
                        UnevenRoundedRectangle(
                            cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4)
                        )
                        .fill(.tint)
                        .frame(width: 200, height: 120)
                        APICallout("UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4))")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("RectangleCornerRadii \u{2014} corner combinations")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("struct RectangleCornerRadii \u{00b7} macOS 13.0+")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                    let configs: [(String, RectangleCornerRadii)] = [
                        ("speech bubble TL", .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 4)),
                        ("asymmetric", .init(topLeading: 32, bottomLeading: 4, bottomTrailing: 32, topTrailing: 4)),
                        ("bottom-only rounded", .init(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0)),
                        ("diagonal", .init(topLeading: 32, bottomLeading: 4, bottomTrailing: 4, topTrailing: 32))
                    ]
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 16)], spacing: 16) {
                        ForEach(configs, id: \.0) { label, radii in
                            VStack(spacing: 6) {
                                UnevenRoundedRectangle(cornerRadii: radii, style: .continuous)
                                    .fill(.tint)
                                    .frame(width: 120, height: 80)
                                Text(label)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    APICallout("UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(...), style: .continuous)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("strokeBorder (InsettableShape)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    UnevenRoundedRectangle(
                        cornerRadii: .init(topLeading: 24, bottomLeading: 4, bottomTrailing: 24, topTrailing: 4)
                    )
                    .strokeBorder(.tint, lineWidth: 3)
                    .frame(width: 180, height: 100)
                    APICallout(".strokeBorder(.tint, lineWidth: 3)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ConcentricRectangle \u{2014} nested inset pattern")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("struct ConcentricRectangle : Shape \u{00b7} macOS 26.0+")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                    ZStack {
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 8, bottomTrailing: 24, topTrailing: 8))
                            .fill(.tint.opacity(0.15))
                            .frame(width: 200, height: 120)
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 18, bottomLeading: 4, bottomTrailing: 18, topTrailing: 4))
                            .fill(.tint.opacity(0.4))
                            .frame(width: 172, height: 96)
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 12, bottomLeading: 2, bottomTrailing: 12, topTrailing: 2))
                            .fill(.tint)
                            .frame(width: 144, height: 72)
                    }
                    APICallout("ConcentricRectangle — concentric inset preserving corner curve relationship")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Per-corner interactive control")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 12) {
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: topLeading,
                                bottomLeading: bottomLeading,
                                bottomTrailing: bottomTrailing,
                                topTrailing: topTrailing
                            ),
                            style: .continuous
                        )
                        .fill(.tint)
                        .frame(width: 200, height: 120)
                        .animation(.spring, value: topLeading)
                        .animation(.spring, value: topTrailing)
                        .animation(.spring, value: bottomLeading)
                        .animation(.spring, value: bottomTrailing)

                        Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 8) {
                            GridRow {
                                Text("Top Leading").font(.caption).foregroundStyle(.secondary).frame(width: 100, alignment: .leading)
                                Slider(value: $topLeading, in: 0...60).frame(width: 180)
                                Text("\(Int(topLeading))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                            GridRow {
                                Text("Top Trailing").font(.caption).foregroundStyle(.secondary)
                                Slider(value: $topTrailing, in: 0...60).frame(width: 180)
                                Text("\(Int(topTrailing))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                            GridRow {
                                Text("Bottom Leading").font(.caption).foregroundStyle(.secondary)
                                Slider(value: $bottomLeading, in: 0...60).frame(width: 180)
                                Text("\(Int(bottomLeading))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                            GridRow {
                                Text("Bottom Trailing").font(.caption).foregroundStyle(.secondary)
                                Slider(value: $bottomTrailing, in: 0...60).frame(width: 180)
                                Text("\(Int(bottomTrailing))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "RectangleCornerRadii holds the four values.",
                            detail: "Construct with .init(topLeading:bottomLeading:bottomTrailing:topTrailing:). All default to 0 if omitted.",
                            symbol: "slider.horizontal.3")
                    noteRow(title: "Style parameter applies per-corner.",
                            detail: "Pass style: .continuous to match the squircle look. Each corner arc adapts its G2-continuity independently.",
                            symbol: "app")
                    noteRow(title: "InsettableShape \u{2014} strokeBorder works.",
                            detail: "Like RoundedRectangle, UnevenRoundedRectangle is insettable so strokeBorder paints inside the path boundary.",
                            symbol: "square.and.pencil")
                    noteRow(title: "macOS 13.0+ minimum deployment target.",
                            detail: "UnevenRoundedRectangle shipped in macOS Ventura. SwiftKit targets macOS 26 so no @available guard is needed.",
                            symbol: "calendar")
                }
            }
        }
    }

    // MARK: UnevenRoundedRectangle — Modern API (macOS 26.0+)

    private var unevenRoundedRectangleModernSection: some View {
        PageSection("UnevenRoundedRectangle \u{2014} Modern API", subtitle: "RectangleCornerInsets \u{00b7} ConcentricRectangle \u{00b7} macOS 26.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("RectangleCornerInsets (macOS 26.0+)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("struct RectangleCornerInsets \u{00b7} macOS 26.0+")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                    Text("RectangleCornerInsets encodes four per-corner inset amounts, complementing RectangleCornerRadii. Where RectangleCornerRadii specifies absolute corner-arc radii, RectangleCornerInsets specifies how much to inset each corner when nesting shapes inside a container with the same corner geometry.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("struct RectangleCornerInsets  // macOS 26.0+")
                    APICallout("init(topLeading: CGFloat, bottomLeading: CGFloat, bottomTrailing: CGFloat, topTrailing: CGFloat)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ConcentricRectangle (macOS 26.0+)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("struct ConcentricRectangle : Shape \u{00b7} macOS 26.0+")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                    Text("ConcentricRectangle draws a rounded rectangle that is geometrically concentric with an outer container — it preserves the corner-curve relationship as it scales inward, so inner and outer shapes feel visually nested at any inset distance.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("ConcentricRectangle()  // positions itself relative to enclosing container shape")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "ConcentricRectangle solves the nested-corner problem.",
                            detail: "When you nest a shape inside another with matching corner radii, the inner corners must be smaller than the outer. ConcentricRectangle computes the right inner radii automatically given the inset distance.",
                            symbol: "rectangle.inset.filled")
                    noteRow(title: "RectangleCornerInsets is macOS 26.0+ only.",
                            detail: "For earlier targets, manually compute inset radii: innerRadius ≈ outerRadius - insetDistance.",
                            symbol: "calendar")
                }
            }
        }
    }

    // MARK: AnyShape

    private var anyShapeSection: some View {
        PageSection("AnyShape", subtitle: "struct AnyShape : Shape \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("AnyShape is a type-erased wrapper for any Shape conformer. Use it when you need a heterogeneous collection of shapes, or to store a shape in a property without generics leaking into the type signature.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Wrapping different concrete shapes")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    let shapes: [(String, AnyShape)] = [
                        ("Circle", AnyShape(Circle())),
                        ("RoundedRectangle", AnyShape(RoundedRectangle(cornerRadius: 12))),
                        ("Capsule", AnyShape(Capsule())),
                        ("UnevenRoundedRectangle", AnyShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 16, bottomLeading: 4, bottomTrailing: 16, topTrailing: 4))))
                    ]
                    HStack(spacing: 16) {
                        ForEach(shapes, id: \.0) { name, shape in
                            VStack(spacing: 6) {
                                shape.fill(.tint).frame(width: 80, height: 60)
                                Text(name).font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                            }
                        }
                    }
                    APICallout("AnyShape(Circle())  \u{00b7}  AnyShape(RoundedRectangle(cornerRadius: 12))")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Type-erased shape in a property")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
let shape: AnyShape = AnyShape(Capsule())
shape.fill(.tint).frame(width: 120, height: 48)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Shape, Sendable")
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

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "AnyShape erases the concrete type.",
                            detail: "Use AnyShape when you need a heterogeneous collection of shapes or to store a shape in a property without generics. The underlying path(in:) is forwarded to the wrapped shape.",
                            symbol: "square.3.layers.3d")
                    noteRow(title: "macOS 13.0+ minimum.",
                            detail: "AnyShape shipped in macOS Ventura (13.0). SwiftKit targets macOS 26 — no @available guard is needed.",
                            symbol: "calendar")
                }
            }
        }
    }

    // MARK: ShapeRole

    private var shapeRoleSection: some View {
        PageSection("ShapeRole", subtitle: "enum ShapeRole \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("ShapeRole defines the semantic purpose of a shape within a filled or stroked context. It tells the rendering pipeline how to composite the shape relative to other layers in the same view.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    shapeRoleRow(".fill",   "The shape fills the interior — the standard use case for .fill(_:) and fill styles.")
                    shapeRoleRow(".stroke", "The shape strokes the boundary — used with .stroke(_:lineWidth:) and StrokeStyle.")
                    shapeRoleRow(".separator", "The shape acts as a visual separator between content regions.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("enum ShapeRole : Equatable, Hashable, Sendable")
                    APICallout("static let fill: ShapeRole")
                    APICallout("static let stroke: ShapeRole")
                    APICallout("static let separator: ShapeRole")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Equatable, Hashable, Sendable")
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

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(title: "ShapeRole is used by custom Shape conformers.",
                            detail: "When you implement path(in:) and want to specify the rendering intent, provide a static var role: ShapeRole property on your Shape type. The framework reads this to determine how to composite the shape.",
                            symbol: "pencil.and.outline")
                    noteRow(title: "Built-in primitives don't require explicit role.",
                            detail: "Circle, Rectangle, etc. already have their roles baked in — role is relevant when writing a custom Shape conformer that needs to declare its intent.",
                            symbol: "info.circle")
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on shapes — abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(title: "Prefer .continuous corners for modern macOS.",
                        detail: "The squircle curve (.continuous style) is used throughout macOS 26 — app icons, window chrome, control cells. Use it instead of .circular for any UI that should feel native.",
                        symbol: "app")
                noteRow(title: "InsettableShape enables strokeBorder everywhere.",
                        detail: "Circle, Capsule, Rectangle, RoundedRectangle, and UnevenRoundedRectangle all conform to InsettableShape. Prefer .strokeBorder over .stroke when the stroke must not exceed the shape's bounds.",
                        symbol: "square.and.pencil")
                noteRow(title: "clipShape is the right tool for rounded image containers.",
                        detail: "Rather than wrapping an image in a ZStack with a shape overlay, use .clipShape(RoundedRectangle(cornerRadius:)) directly on the image view. No extra layers, no extra layout work.",
                        symbol: "photo")
                noteRow(title: "trim(from:to:) is the canonical progress-ring pattern.",
                        detail: "Combine .trim with .stroke(style:) and .rotationEffect(.degrees(-90)) on Circle to build a progress ring without custom drawing code. Animating the `to` value produces smooth circular progress.",
                        symbol: "arrow.clockwise")
                noteRow(title: "AnyShape vs direct generics.",
                        detail: "If your API is generic over Shape, keep it generic — that's zero runtime cost. Use AnyShape only when you need to store a shape in a non-generic context (e.g., a stored property or heterogeneous array).",
                        symbol: "square.3.layers.3d")
            }
        }
    }

    // MARK: Helpers

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

    private func cornerCaseRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 180, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func shapeRoleRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 120, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ShapesGalleryPage()
        .frame(width: 1100, height: 1400)
}
