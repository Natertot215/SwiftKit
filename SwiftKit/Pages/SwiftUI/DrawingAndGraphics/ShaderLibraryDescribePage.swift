import SwiftUI

// SwiftUI `ShaderLibrary` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/shaderlibrary.md
// macOS 14.0+. Locator for a Metal shader library — default, bundle, URL, or data.

struct ShaderLibraryDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ShaderLibrary",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/shaderlibrary.md",
            availability: "macOS 14.0+",
            blurb: """
            A Metal shader library — points at the binary blob containing your \
            stitchable shader functions. ShaderLibrary itself does not own the \
            Metal program; it identifies which library to load and lets you \
            access functions inside it by name.

            Four entry points:
            \u{2022} .default — the app bundle's main library (the .metal files \
              in the build target). The most common case.
            \u{2022} .bundle(_:) — a library inside an arbitrary Bundle.
            \u{2022} init(url:) — a compiled .metallib file at a URL.
            \u{2022} init(data:) — a compiled .metallib already in memory.

            The library is @dynamicMemberLookup, so writing \
            `ShaderLibrary.default.gradientFill` returns a ShaderFunction named \
            "gradientFill". That ShaderFunction is then @dynamicCallable, so \
            applying argument values builds a Shader.

            End-to-end:

                let shader = ShaderLibrary.default.gradientFill(.color(.red), .color(.blue))
                Rectangle().fill(shader)
            """,
            signatures: [
                "@dynamicMemberLookup struct ShaderLibrary: Equatable, Sendable",
                "static var `default`: ShaderLibrary { get }",
                "static func bundle(_ bundle: Bundle) -> ShaderLibrary",
                "init(url: URL)",
                "init(data: Data)",
                "subscript(dynamicMember name: String) -> ShaderFunction { get }"
            ],
            notes: [
                "Use ShaderLibrary.default for the app's main bundle library.",
                "Equatable / Sendable.",
                "@dynamicMemberLookup \u{2014} access functions by name at the call site.",
                "URL / Data initializers let you load .metallib produced offline (e.g., shipped as resources).",
                "Function names are NOT compile-time checked \u{2014} typos surface as runtime warnings."
            ]
        )
    }
}

#Preview {
    ShaderLibraryDescribePage().frame(width: 900, height: 700)
}
