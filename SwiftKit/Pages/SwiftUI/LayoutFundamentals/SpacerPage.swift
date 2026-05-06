import SwiftUI

// Dense Spacer reference page.
//   • Spacer                                                            (struct)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/spacer.md
//   macOS 10.15+

struct SpacerPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                defaultSection
                minLengthSection
                hstackContextSection
                vstackContextSection
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
            Text("Spacer")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A flexible space that expands along the major axis of its containing stack, pushing sibling views apart. Has no visual representation — it's purely layout.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/spacer.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Spacer  \u{00b7}  Spacer(minLength:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Spacer \u{2014} default", subtitle: "init(minLength: CGFloat? = nil) \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A Spacer with no arguments expands to fill all available space along the major axis, using a system minimum of 8pt. Use it to push sibling views to opposite ends of a stack.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("Spacer()                          // flexible, minimum 8pt")
                APICallout("struct Spacer { init(minLength: CGFloat? = nil) }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Leading + Spacer + Trailing in HStack")
                        .font(.headline).foregroundStyle(.primary)
                    HStack {
                        Text("Leading")
                            .padding(.horizontal, 10).padding(.vertical, 6)
                            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            .foregroundStyle(.primary)
                            .font(.callout)
                        Spacer()
                        Text("Trailing")
                            .padding(.horizontal, 10).padding(.vertical, 6)
                            .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 6))
                            .foregroundStyle(.tint)
                            .font(.callout)
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("HStack { Text(\"Leading\"); Spacer(); Text(\"Trailing\") }")
                }
            }
        }
    }

    // MARK: minLength

    private var minLengthSection: some View {
        PageSection("Spacer(minLength:)", subtitle: "Override the minimum expansion distance") {
            VStack(alignment: .leading, spacing: 20) {
                Text("minLength sets a floor on how small the Spacer can compress. Defaults to 8pt (the system gutter). Set to 0 to allow the Spacer to collapse to nothing. Set a larger value to guarantee a minimum gap.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("Spacer(minLength: 40)   // at least 40pt")
                APICallout("Spacer(minLength: 0)    // can collapse to zero")

                VStack(alignment: .leading, spacing: 8) {
                    Text("minLength: 40")
                        .font(.headline).foregroundStyle(.primary)
                    HStack {
                        chip("Left")
                        Spacer(minLength: 40)
                        chip("Right (min 40pt gap)")
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("HStack { Text(\u{2026}); Spacer(minLength: 40); Text(\u{2026}) }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("minLength: 0 — allow flush collapse")
                        .font(.headline).foregroundStyle(.primary)
                    HStack {
                        chip("Alpha")
                        Spacer(minLength: 0)
                        chip("Beta")
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("Spacer(minLength: 0)  // Spacer can compress to 0 if container is tight")
                }
            }
        }
    }

    // MARK: In HStack

    private var hstackContextSection: some View {
        PageSection("Spacer in HStack contexts", subtitle: "Equal distribution, toolbar-style layouts") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Multiple Spacers in an HStack distribute available space equally between them, centering the content between them or spreading it across the full width.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Two Spacers — equal distribution")
                        .font(.headline).foregroundStyle(.primary)
                    HStack {
                        chip("Alpha")
                        Spacer()
                        chip("Beta")
                        Spacer()
                        chip("Gamma")
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("HStack { Text; Spacer(); Text; Spacer(); Text }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Toolbar-style: title centered, action at trailing edge")
                        .font(.headline).foregroundStyle(.primary)
                    HStack {
                        Button { } label: { Image(systemName: "chevron.left") }
                            .buttonStyle(.borderless)
                        Spacer()
                        Text("Document")
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Spacer()
                        Button { } label: { Image(systemName: "square.and.arrow.up") }
                            .buttonStyle(.borderless)
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("HStack { BackButton; Spacer(); Title; Spacer(); ShareButton }")
                }
            }
        }
    }

    // MARK: In VStack

    private var vstackContextSection: some View {
        PageSection("Spacer in VStack contexts", subtitle: "Pin content to top or bottom") {
            VStack(alignment: .leading, spacing: 20) {
                Text("In a VStack, Spacer fills vertical space, pushing content to the top or bottom of the available height. Useful for pinning action buttons to the bottom of a panel.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Pin content to bottom")
                        .font(.headline).foregroundStyle(.primary)
                    VStack {
                        chip("Top content")
                        Spacer()
                        chip("Bottom action")
                    }
                    .frame(height: 120)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("VStack { TopContent; Spacer(); BottomAction }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Pin content to top")
                        .font(.headline).foregroundStyle(.primary)
                    VStack {
                        chip("Top-pinned")
                        chip("Also top")
                        Spacer()
                    }
                    .frame(height: 100)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("VStack { TopContent; AnotherRow; Spacer() }")
                }

                noteRow(
                    title: "Spacer outside a stack fills both axes.",
                    detail: "When Spacer is not inside an HStack or VStack, it expands in both horizontal and vertical directions, filling the available space from its parent layout.",
                    symbol: "arrow.up.left.and.arrow.down.right"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: "Spacer has no visual representation.",
                    detail: "It's a zero-visual-weight layout element. In a ScrollView that doesn't stretch its content, Spacer may have no effect — it only works when the parent has flexibility to give.",
                    symbol: "arrow.left.and.right.square"
                )
                noteRow(
                    title: "minLength defaults to 8pt (system default gutter).",
                    detail: "This matches the default HStack/VStack spacing. Set to 0 to allow full collapse when the parent is constrained.",
                    symbol: "ruler"
                )
                noteRow(
                    title: "Fixed spacing alternative — .padding() and spacing: parameter.",
                    detail: "For a fixed gap (not a flex spacer), use .padding() on a view, or set spacing: on the parent HStack/VStack. Spacer is for flexible distribution, not fixed gaps.",
                    symbol: "ruler.fill"
                )
                noteRow(
                    title: "Multiple Spacers share available space equally.",
                    detail: "If two Spacers are in the same stack and the container has 100pt to distribute, each gets 50pt (minus their minLength floors).",
                    symbol: "equal.circle"
                )
            }
        }
    }

    // MARK: Helpers

    private func chip(_ label: String) -> some View {
        Text(label)
            .font(.callout)
            .padding(.horizontal, 10).padding(.vertical, 4)
            .background(.tint.opacity(0.15), in: Capsule())
            .foregroundStyle(.tint)
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

#Preview {
    SpacerPage()
        .frame(width: 1000, height: 1000)
}
