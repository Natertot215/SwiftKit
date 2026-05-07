import SwiftUI

/// Demo-target tiles for non-renderable but *applicable* APIs.
///
/// A protocol or modifier that has no visual identity on its own (Animation,
/// Transition, Material, ShapeStyle, EnvironmentValue) gets applied to a
/// stable canvas so the user reads the *delta* between tiles in a grid.
///
/// Each tile is a thin wrapper around `VariantTile` whose `demo` is the
/// canvas-with-API-applied. The canvas geometry is shared so adjacent tiles
/// in the grid stay visually comparable.

// MARK: - AnimationDemoTile

/// A capsule that springs between two offset poses on tap. The supplied
/// `animation` drives the transition.
struct AnimationDemoTile: View {
    let name: String
    let api: String?
    let animation: Animation

    @State private var toggled: Bool = false

    init(name: String, api: String? = nil, animation: Animation) {
        self.name = name
        self.api = api
        self.animation = animation
    }

    var body: some View {
        VariantTile(name: name, api: api) {
            Capsule()
                .fill(.tint)
                .frame(width: 28, height: 18)
                .offset(x: toggled ? 36 : -36)
                .animation(animation, value: toggled)
                .onTapGesture { toggled.toggle() }
        }
    }
}

// MARK: - TransitionDemoTile

/// A capsule that inserts/removes from the canvas under the supplied
/// transition on tap. Useful for `.opacity`, `.slide`, `.scale`, asymmetric.
struct TransitionDemoTile: View {
    let name: String
    let api: String?
    let transition: AnyTransition

    @State private var visible: Bool = true

    init(name: String, api: String? = nil, transition: AnyTransition) {
        self.name = name
        self.api = api
        self.transition = transition
    }

    var body: some View {
        VariantTile(name: name, api: api) {
            ZStack {
                if visible {
                    Capsule()
                        .fill(.tint)
                        .frame(width: 60, height: 22)
                        .transition(transition)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.4)) { visible.toggle() }
            }
        }
    }
}

// MARK: - MaterialDemoTile

/// A capsule label rendered on top of a baked-in semantic gradient plate so
/// the supplied `Material` actually has something to filter. Without the
/// gradient backdrop, materials render as a flat secondary background and
/// the visual delta between tiles disappears.
struct MaterialDemoTile: View {
    let name: String
    let api: String?
    let material: Material

    init(name: String, api: String? = nil, material: Material) {
        self.name = name
        self.api = api
        self.material = material
    }

    var body: some View {
        VariantTile(name: name, api: api) {
            ZStack {
                LinearGradient(
                    colors: [Color.accentColor, Color.secondary],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(width: 140, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                Text("Aa")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 6)
                    .background(material, in: Capsule())
            }
        }
    }
}

// MARK: - ShapeStyleDemoTile

/// A rounded rectangle filled with the supplied `ShapeStyle`. The smallest
/// useful demo target for any value that conforms to `ShapeStyle`.
struct ShapeStyleDemoTile<S: ShapeStyle>: View {
    let name: String
    let api: String?
    let style: S

    init(name: String, api: String? = nil, style: S) {
        self.name = name
        self.api = api
        self.style = style
    }

    var body: some View {
        VariantTile(name: name, api: api) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(style)
                .frame(width: 120, height: 64)
        }
    }
}

// MARK: - EnvironmentValueDemoTile

/// A canvas where the caller injects an environment value via the `apply`
/// closure. The supplied `surrogate` view is what the env value modifies —
/// usually a small standard control whose appearance the env value affects.
struct EnvironmentValueDemoTile<Surrogate: View>: View {
    let name: String
    let api: String?
    @ViewBuilder var surrogate: () -> Surrogate

    init(
        name: String,
        api: String? = nil,
        @ViewBuilder surrogate: @escaping () -> Surrogate
    ) {
        self.name = name
        self.api = api
        self.surrogate = surrogate
    }

    var body: some View {
        VariantTile(name: name, api: api) {
            surrogate()
        }
    }
}
