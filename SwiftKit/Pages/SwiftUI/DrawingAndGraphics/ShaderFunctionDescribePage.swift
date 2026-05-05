import SwiftUI

// SwiftUI `ShaderFunction` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/shaderfunction.md
// macOS 14.0+. Value referencing a function in a Metal shader library.

struct ShaderFunctionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ShaderFunction",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/shaderfunction.md",
            availability: "macOS 14.0+",
            blurb: """
            A reference to a function in a Metal shader library — combines a \
            ShaderLibrary value with the function name. Acts as the address of \
            the Metal entry point that a Shader will call.

            Marked @dynamicCallable: calling a ShaderFunction with Shader.Argument \
            values produces a Shader. This is what makes the canonical \
            ShaderLibrary subscript ergonomic:

                ShaderLibrary.default.myFunc(.float(t), .color(.red))

            resolves as `ShaderLibrary.default[dynamicMember: "myFunc"]` (returning \
            a ShaderFunction) followed by dynamicallyCall(withArguments:) on that \
            function to bind the arguments and build a Shader.

            You rarely construct ShaderFunction directly — the dynamic-member \
            subscript on ShaderLibrary handles the lookup and the dynamic call \
            handles the Shader construction.
            """,
            signatures: [
                "@dynamicCallable struct ShaderFunction: Equatable, Sendable",
                "init(library: ShaderLibrary, name: String)",
                "var library: ShaderLibrary",
                "var name: String",
                "func dynamicallyCall(withArguments args: [Shader.Argument]) -> Shader"
            ],
            notes: [
                "Equatable / Sendable.",
                "@dynamicCallable \u{2014} call directly with Shader.Argument values to produce a Shader.",
                "Standard construction: ShaderLibrary.default.<name> (via @dynamicMemberLookup on the library).",
                "Direct construction (init(library:name:)) is rarely needed.",
                "name is checked at runtime against the Metal library \u{2014} typos do not fail at compile time."
            ]
        )
    }
}

#Preview {
    ShaderFunctionDescribePage().frame(width: 900, height: 700)
}
