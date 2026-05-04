import SwiftUI

struct FittingImagesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Fitting Images into Available Space",
            docPath: "Documentation/SwiftUI/images/fitting-images-into-available-space.md",
            availability: "macOS 11.0+",
            blurb: """
            Adjust the size and shape of images in your app's user interface by applying view modifiers.

            ## Overview

            Image sizes vary widely, from single-pixel PNG files to digital photography images with millions of pixels. Because device sizes also vary, apps commonly need to make runtime adjustments to image sizes so they fit within the visible user interface. SwiftUI provides modifiers to scale, clip, and transform images to fit your interface perfectly.

            ## Scale a Large Image to Fit Its Container Using Resizing

            To fix an image that renders at full size and overflows its frame, apply two modifiers to the Image:

            - resizable(capInsets:resizingMode:) tells the image view to adjust the image representation to match the size of the view. By itself, this modifier scales each axis independently.
            - aspectRatio(_:contentMode:) corrects the behavior where image scaling is different for each axis. ContentMode.fit scales the image to fit the view size along one axis, possibly leaving empty space along the other. ContentMode.fill scales the image to fill the entire view.

            ```swift
            Image("Landscape_4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 400, alignment: .topLeading)
                .border(.blue)
            ```

            ## Keep Image Data Inside the View's Bounds Using Clipping

            If you use ContentMode.fill, a portion of an image may extend beyond the view's bounds. Add clipped(antialiased:) to prevent this — it cuts off excess image rendering at the bounding frame of the view:

            ```swift
            Image("Landscape_4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400, alignment: .topLeading)
                .border(.blue)
                .clipped()
            ```

            ## Use Interpolation Flags to Adjust Rendered Image Quality

            Rendering an image at anything other than its original size requires interpolation. Use the interpolation(_:) modifier to provide a hint for SwiftUI rendering behavior:

            ```swift
            Image("dot_green")
                .resizable()
                .interpolation(.none)   // .none = pixelated; .medium = smoothed
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 400, alignment: .topLeading)
                .border(.blue)
            ```

            ## Fill a Space with a Repeating Image Using Tiling

            To fill a space with a small repeating image, pass Image.ResizingMode.tile to resizable(capInsets:resizingMode:):

            ```swift
            Image("dot_green")
                .resizable(resizingMode: .tile)
                .frame(width: 300, height: 400, alignment: .topLeading)
                .border(.blue)
            ```

            Tiling is particularly useful when an image, placed end-to-end with copies of itself, creates a larger pattern with no visual discontinuities.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/images/fitting-images-into-available-space.md",
                "Related APIs: imageScale(_:), Image.Scale, Image.Orientation, Image.ResizingMode."
            ]
        )
    }
}

#Preview {
    FittingImagesDescribePage()
        .frame(width: 900, height: 900)
}
