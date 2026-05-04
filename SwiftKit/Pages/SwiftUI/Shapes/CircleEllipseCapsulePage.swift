import SwiftUI

// SwiftUI `Circle`, `Ellipse`, `Capsule` reference page.
// Source: Documentation/SwiftUI/shapes/circle.md, ellipse.md, capsule.md
// macOS 10.15+. Three core rounded/curved shapes.

struct CircleEllipseCapsulePage: View {
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
            Text("Circle · Ellipse · Capsule")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Core curved shapes: Circle, Ellipse, and Capsule.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        HStack(spacing: 32) {
            VStack(spacing: 6) {
                Circle().fill(.tint).frame(width: 80, height: 80)
                APICallout("Circle()")
            }
            VStack(spacing: 6) {
                Ellipse().fill(.tint).frame(width: 120, height: 70)
                APICallout("Ellipse()")
            }
            VStack(spacing: 6) {
                Capsule().fill(.tint).frame(width: 140, height: 55)
                APICallout("Capsule()")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CECVariantRow(title: "Circle variants") {
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
                            .fill(RadialGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0)]), center: .center, startRadius: 0, endRadius: 35))
                            .frame(width: 70, height: 70)
                        Text("RadialGradient").font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            CECVariantRow(title: "Ellipse variants") {
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

            CECVariantRow(title: "Capsule variants") {
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
            }

            CECVariantRow(title: "trim(from:to:) on Circle — progress ring") {
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
            }

            CECVariantRow(title: "clipShape usage") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 36))
                            .frame(width: 64, height: 64)
                            .background(.secondary.opacity(0.2))
                            .clipShape(Circle())
                        APICallout(".clipShape(Circle())")
                    }
                    VStack(spacing: 6) {
                        Image(systemName: "photo")
                            .font(.system(size: 36))
                            .frame(width: 100, height: 56)
                            .background(.secondary.opacity(0.2))
                            .clipShape(Capsule())
                        APICallout(".clipShape(Capsule())")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            CECVariantRow(title: "Nested circles — concentric rings pattern") {
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
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Circle fits a square frame — always 1:1.", "Circle scales to the smallest dimension of its frame. To get a non-circle oval, use Ellipse instead.", "circle"),
        ("Capsule follows the smallest dimension for its radius.", "The capsule radius is half the smaller of its width/height. You can pass style: .circular or .continuous.", "capsule"),
        ("trim(from:to:) — circular progress indicators.", "Combining .trim with .stroke and .rotationEffect(.degrees(-90)) creates clean progress rings without third-party code.", "arrow.clockwise"),
        ("All three are InsettableShape.", "Circle, Ellipse, and Capsule conform to InsettableShape enabling .strokeBorder which paints inward and never bleeds outside the frame.", "square.and.pencil")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct CECVariantRow<Content: View>: View {
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
    CircleEllipseCapsulePage()
        .frame(width: 1100, height: 1000)
}
