import SwiftUI

// SwiftUI `View/alignmentGuide(_:computeValue:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/alignmentguide(_:computevalue:).md
// macOS 10.15+. Two overloads: HorizontalAlignment + VerticalAlignment.

private extension VerticalAlignment {
    struct ImageTitleAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat { d[.bottom] }
    }
    static let imageTitle = VerticalAlignment(ImageTitleAlignment.self)
}

struct AlignmentGuidePage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/alignmentGuide(_:computeValue:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Sets the value of an alignment guide for this view; the guide must already exist on HorizontalAlignment or VerticalAlignment.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/alignmentguide(_:computevalue:).md \u{00b7} macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".alignmentGuide(.leading) { d in d[.trailing] }")
                Text("The middle row's leading guide is moved to its trailing edge \u{2014} it shifts left of the others by its own width.")
                    .font(.callout).foregroundStyle(.secondary)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Normal leading row")
                        .font(.callout).foregroundStyle(.primary)
                    Text("Shifted: aligned at trailing")
                        .font(.callout).foregroundStyle(.tint)
                        .alignmentGuide(.leading) { d in d[.trailing] }
                    Text("Normal leading row")
                        .font(.callout).foregroundStyle(.primary)
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("HorizontalAlignment overload").font(.headline).foregroundStyle(.primary)
                    APICallout("func alignmentGuide(_ g: HorizontalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View")
                    VStack(alignment: .center, spacing: 4) {
                        Text("Centered")
                            .font(.callout)
                            .foregroundStyle(.primary)
                        Text("Aligned at leading edge")
                            .font(.callout)
                            .foregroundStyle(.tint)
                            .alignmentGuide(HorizontalAlignment.center) { d in d[.leading] }
                        Text("Centered")
                            .font(.callout)
                            .foregroundStyle(.primary)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("VerticalAlignment overload").font(.headline).foregroundStyle(.primary)
                    APICallout("func alignmentGuide(_ g: VerticalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View")
                    HStack(alignment: .top, spacing: 16) {
                        Text("baseline up")
                            .font(.title)
                        Text("flipped to bottom")
                            .font(.callout)
                            .foregroundStyle(.tint)
                            .alignmentGuide(VerticalAlignment.top) { d in d[.bottom] }
                        Text("baseline up")
                            .font(.callout)
                            .foregroundStyle(.primary)
                    }
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Custom AlignmentID across stacks").font(.headline).foregroundStyle(.primary)
                    APICallout(".alignmentGuide(.imageTitle) { d in d[.bottom] }")
                    HStack(alignment: .imageTitle, spacing: 16) {
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.tint.opacity(0.4))
                                .frame(width: 80, height: 60)
                            Text("Bell Peppers")
                                .font(.callout).foregroundStyle(.primary)
                                .alignmentGuide(.imageTitle) { d in d[.bottom] }
                        }
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.tint.opacity(0.6))
                                .frame(width: 80, height: 90)
                            Text("Chili Peppers")
                                .font(.callout).foregroundStyle(.primary)
                                .alignmentGuide(.imageTitle) { d in d[.bottom] }
                            Text("Spicy")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("Both VStacks opt their title Text into a custom .imageTitle guide \u{2014} so the titles share a baseline despite differing image heights.")
                        .font(.caption).foregroundStyle(.tertiary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Computed from ViewDimensions").font(.headline).foregroundStyle(.primary)
                APICallout(".alignmentGuide(.leading) { d in d.width / 2 }  // half-width inset")
                Text("d is a ViewDimensions value \u{2014} read d.width / d.height or subscript with any built-in guide to compute the new value.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Only modifies the named guide for that view \u{2014} other guides keep their default values.", systemImage: "scope")
                    .font(.callout).foregroundStyle(.secondary)
                Label("To opt children into a custom AlignmentID-backed guide, apply .alignmentGuide on each one with the matching guide value.", systemImage: "arrow.left.and.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("The closure runs during layout \u{2014} keep it cheap, no side effects.", systemImage: "function")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AlignmentGuidePage().frame(width: 900, height: 900)
}
