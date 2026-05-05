import SwiftUI

// Describe-track page for NSAnimatablePropertyContainer.
// Source: Documentation/AppKit/animation/nsanimatablepropertycontainer.md
// macOS 10.5+. Protocol — adopted by 70+ AppKit classes (NSView, NSWindow,
// NSControl, NSTableView, NSCollectionView, …). Returns the `animator()` proxy
// used to drive implicit animations of property changes. Not renderable on
// its own; it is a conformance the framework's classes already satisfy.

struct NSAnimatablePropertyContainerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSAnimatablePropertyContainer",
            docPath: "Documentation/AppKit/animation/nsanimatablepropertycontainer.md",
            availability: "macOS 10.5+",
            blurb: """
            A protocol that defines a way to add animation to an existing class with minimal API impact. \
            Conformers expose an `animator()` proxy that you treat as a stand-in for the receiver — \
            sending KVC-compliant "set" messages to the proxy triggers implicit animations on the \
            original object's automatically animated properties. Setting a new value for an in-flight \
            property animation simply retargets it; wrapping the new value in an NSAnimationContext \
            grouping with duration 0 cancels the in-flight animation entirely. Over 70 AppKit classes \
            already conform — NSView, NSWindow, NSControl, NSTableView, NSCollectionView, and many \
            others — so most code uses this protocol via `someView.animator().frame = newFrame` rather \
            than by adopting the protocol on a custom type.
            """,
            signatures: [
                "protocol NSAnimatablePropertyContainer",
                "func animator() -> Self",
                "var animations: [NSAnimatablePropertyKey: Any] { get set }",
                "func animation(forKey key: NSAnimatablePropertyKey) -> Any?",
                "static func defaultAnimation(forKey key: NSAnimatablePropertyKey) -> Any?",
                "typealias NSAnimatablePropertyKey = String"
            ],
            notes: [
                "Use is overwhelmingly through built-in conformers: aView.animator().frame = newFrame.",
                "Returns a CAAnimation for animatable keys, nil otherwise — that's how AppKit decides whether to animate a setter.",
                "Cancel an in-flight animation by setting the property inside an NSAnimationContext grouping with duration 0.",
                "Conforming a custom NSObject subclass requires implementing animator(), animations, animation(forKey:), and defaultAnimation(forKey:)."
            ]
        )
    }
}

#Preview {
    NSAnimatablePropertyContainerDescribePage()
        .frame(width: 900, height: 700)
}
